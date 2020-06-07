---
title: Deploying a small ecommerce website
description:
date: 2020-06-07
tags:
    - stripe
	- gatsby
---

# Deploying a small ecommerce website
I wanted to use this template: https://templates.netlify.com/template/gatsby-starter-ecommerce/

It would give me an excuse to use Netlify and Stripe.

But after following the setup guide, it seems Moltin has been bought out by another company, and they don't seem developer friendly, I could not generate an API key with them and it meant the guide and their service was unusable.

# Finding an alternative starter template - gatsby-starter-stripe
I decided to use this starter example: https://github.com/brxck/gatsby-starter-stripe

After following the instructions in the _README.md_, I came out with:
- a new Gatsby project
- a new Stripe account, and two Stripe API keys

## Adding Stripe keys to your project
The project requires that your Stripe API keys are placed in an .env` file:

```
STRIPE_SECRET_KEY="sk_live_****"
STRIPE_PUBLISHABLE_KEY="pk_test_4uR2k55AjfZt9YDunCZejr6k006WKjczZG"

```

## How products in your Stripe account are searched - GraphQL

In the README.md, it tells you how products are searched - using a graphql query in this file:
https://github.com/brxck/gatsby-starter-stripe/blob/master/src/components/ProductsProvider.js

If the query fails, your webstore will return an error.

Here's what the default query looks like to search for a good:

```
export const skuFragment = graphql`
  fragment Sku on StripeSku {
    id
    price
    fields {
      slug
    }
    inventory {
      type
      quantity
    }
    product {
      id
      name
      description
      active
      caption
      created
      updated
      images
      localFiles {
        childImageSharp {
          fluid(maxWidth: $maxWidth, quality: $quality) {
            ...GatsbyImageSharpFluid_withWebp_tracedSVG
          }
        }
      }
    }
  }
```

And just below that, here's how it searches for a SKU:

```
const skusQuery = graphql`                                               
  query skusQuery($maxWidth: Int = 300, $quality: Int = 92) {            
    allStripeSku {                                                       
      group(field: product___id) {                                       
        fieldValue                                                       
        edges {                                                          
          node {                                                         
            ...Sku                                                       
          }                                                              
        }                                                                
      }                                                                  
    }                                                                    
  }
```

## Using the Stripe APIs to create/update a product

First, the Stripe docs show you how to create a product. Here's a basic one

```
curl https://api.stripe.com/v1/products \
  -u sk_live_**** \
  -d name="hat"
```

It gave me a product id back - `prod_HNQWjgjgHkfKbt`.

So, how about updating this product for fun? Lets try:

```
curl https://api.stripe.com/v1/products/prod_HNQWjgjgHkfKbt \
  -u sk_live_**** \
  -d name=myHat \
  -d description=updatedHatDescription \
  -d "attributes[]"='size,color'
```

Amazing!

## Adding additional product attributes, creating a SKU
Unfortunately, just creating a product won't be enough. The default gatsby graphQL example requires that:
- every product must have the optional `caption` field set
- every product must have an SKU created for it

If anything is missing, your web store won't start, due to a failed graphql query.

So, lets update the product to set it's optional `caption` field:

```
curl https://api.stripe.com/v1/products/prod_HNQWjgjgHkfKbt \
  -u sk_live_**** \
  -d caption=myCaption
```

Now lets create a SKU. An SKU will add a bunch of additional metadata to a product. Only products that are of type `good`  can have an SKU associated with them (and not `service`).

I couldn't find out how to create a SKU via the GUI, so I used the API. :

```
curl https://api.stripe.com/v1/skus \
  -u sk_live_**** \
  -d "attributes[name]"=myHatSku \
  -d "attributes[description]"=myHatSku \
  -d "attributes[caption]"=mySkuCaption \
  -d price=1500 \
  -d currency=eur \
  -d "inventory[type]"=finite \
  -d "inventory[quantity]"=500 \
  -d product=prod_HNQWjgjgHkfKbt
 ```

## Getting my product

So what does my product look like now?:

```
curl https://api.stripe.com/v1/products/prod_HNQWjgjgHkfKbt \
 -u sk_live_****
 
{
  "id": "prod_HNQWjgjgHkfKbt",
  "object": "product",
  "active": true,
  "attributes": [
    "size,color"
  ],
  "caption": "myCaption",
  "created": 1590887351,
  "deactivate_on": [

  ],
  "description": "updatedHatDescription",
  "images": [
    "https://files.stripe.com/links/fl_live_16TE4jb4YvX9UMCLtjeNArfN"
  ],
  "livemode": true,
  "metadata": {
  },
  "name": "myHat",
  "package_dimensions": null,
  "shippable": true,
  "type": "good",
  "updated": 1591544913,
  "url": null
}

```

Looks good to go!

## Building and running a new store
I created this `Dockerfile` to build a new store from scratch:

```
FROM alpine
# COPY . /app
RUN apk update && \
	 apk add \
		build-base \
		git \
		nodejs \
		npm
RUN npm install gatsby-cli \
	netlify-cli -g
WORKDIR /app
RUN gatsby new gatsby-starter-stripe https://github.com/brxck/gatsby-starter-stripe
COPY .env /app/gatsby-starter-stripe
WORKDIR /app/gatsby-starter-stripe
ENTRYPOINT [ "ash" ]
```

Building the container:

```
docker build -t gatsby-starter-stripe .
```

For some reason, I can't start the container running `netlify dev` yet for some reason, so manually run the command in the container:

```
docker run --rm -it -p8888:8888 gatsby-starter-stripe
/app/gatsby-starter-stripe # netlify dev
◈ Netlify Dev ◈
◈ Overriding the following env variables with .env file: STRIPE_SECRET_KEY,STRIPE_PUBLISHABLE_KEY
◈ Starting Netlify Dev with gatsby

◈ Functions server is listening on 43937

> gatsby-starter-stripe@0.2.0 start /app/gatsby-starter-stripe
> gatsby develop


   ┌─────────────────────────────────────────────────┐
   │                                                 │
   │   ◈ Server now ready on http://localhost:8888   │
   │                                                 │
   └─────────────────────────────────────────────────┘

success open and validate gatsby-configs - 0.034s
/bin/sh: lscpu: not found
/bin/sh: lscpu: not found
success load plugins - 0.878s
success onPreInit - 0.034s
success initialize cache - 0.014s
success copy gatsby files - 0.069s
success onPreBootstrap - 0.009s
success createSchemaCustomization - 0.007s
error (node:41) [DEP0066] DeprecationWarning: OutgoingMessage.prototype._headers is deprecated
success source and transform nodes - 1.864s
success building schema - 0.594s
success createPages - 0.039s
success createPagesStatefully - 0.077s
success onPreExtractQueries - 0.001s
success update schema - 0.045s
success extract queries from components - 0.530s
success write out requires - 0.027s
success write out redirect data - 0.013s
success Build manifest and related icons - 0.156s
success onPostBootstrap - 0.158s
⠀
info bootstrap finished - 7.024s
⠀
success run queries - 0.590s - 8/8 13.55/s
/bin/sh: lscpu: not found
success Generating image thumbnails - 3.192s - 2/2 0.63/s
⠀
You can now view gatsby-starter-stripe in the browser.
⠀
  http://localhost:8000/
⠀
View GraphiQL, an in-browser IDE, to explore your site's data and schema
⠀
  http://localhost:8000/___graphql
⠀
Note that the development build is not optimized.
To create a production build, use gatsby build
⠀
success Building development bundle - 7.036s
Request from ::ffff:172.17.0.1: GET /.netlify/functions/skuList
Response with status 200 in 421 ms.
error while proxying request: socket hang up
error while proxying request: socket hang up
error while proxying request: socket hang up
Request from ::ffff:172.17.0.1: GET /.netlify/functions/skuList
Response with status 200 in 217 ms.
Request from ::ffff:172.17.0.1: GET /.netlify/functions/skuList
Response with status 200 in 224 ms.
```

The webstore will be available at `http://localhost:8888/`