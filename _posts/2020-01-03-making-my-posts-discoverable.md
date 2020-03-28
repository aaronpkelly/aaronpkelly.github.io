---
title: Making my posts discoverable
description: Using the Jekyll SEO Plugin to index my blog posts on Github Pages
---

# Making my posts discoverable

I'm not sure how discoverable blog posts that are hosted on Github Pages are, but I came across [this article](https://github.blog/2016-05-10-better-discoverability-for-github-pages-sites/) that seems to indicate that search engine optimisation is a valid concern, and that there is help out there in the form of a Jekyll plugin.

Although I generally  try to avoid installing plugins where possible, I also want to make sure my content reaches an audience!

I was about to commit to installing an extra plugin, but before I committed... I decided to check the HTML source of one of my posts to see what was already there in the HEAD section:

```
<!DOCTYPE html>
<html lang="en-US">
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Begin Jekyll SEO tag v2.6.1 -->
<title>Making My Blog Discoverable | Aaron Kelly’s Blog</title>
<meta name="generator" content="Jekyll v3.8.5" />
<meta property="og:title" content="Making My Blog Discoverable" />
<meta name="author" content="Aaron Kelly" />
<meta property="og:locale" content="en_US" />
<meta name="description" content="Making my blog discoverable" />
<meta property="og:description" content="Making my blog discoverable" />
<link rel="canonical" href="https://aaronpkelly.github.io/2020/01/03/making-my-blog-discoverable.html" />
<meta property="og:url" content="https://aaronpkelly.github.io/2020/01/03/making-my-blog-discoverable.html" />
<meta property="og:site_name" content="Aaron Kelly’s Blog" />
<meta property="og:type" content="article" />
<meta property="article:published_time" content="2020-01-03T00:00:00+00:00" />
<script type="application/ld+json">
{"mainEntityOfPage":{"@type":"WebPage","@id":"https://aaronpkelly.github.io/2020/01/03/making-my-blog-discoverable.html"},"@type":"BlogPosting","url":"https://aaronpkelly.github.io/2020/01/03/making-my-blog-discoverable.html","author":{"@type":"Person","name":"Aaron Kelly"},"headline":"Making My Posts Discoverable","dateModified":"2020-01-03T00:00:00+00:00","datePublished":"2020-01-03T00:00:00+00:00","description":"Making my posts discoverable","@context":"https://schema.org"}</script>
<!-- End Jekyll SEO tag -->

    <link rel="stylesheet" href="/assets/css/style.css?v=650a48ca270b25ea183cc8f9feb2e4593004c2b2">
  </head>
```

Boom. It looks like Jekyll SEO optimisation is done automatically for me, no need to install any additional plugins. Easy win!

However... what's included in the tags doesn't really look useful. Any search engine that index's my post won't really have much idea of the content using these tags. Looks like there's more work to do!

# Proving extra metdata to search engines using Jekyll front-matter

According to [the documentation](https://github.com/jekyll/jekyll-seo-tag/blob/master/docs/usage.md), the SEO plugin will include extra information if I provide some Jekyll front-matter in my post, including probably the most importing meta-tags, `title` (self-explanatory), and `description` - which ideally should be a short, punchy ~140 char length that summarises the contents.

The output in the previous section is what I get when I provide **no** Jekyll front-matter in a post.

So, lets see if providing some extra information at the beginning changes things. Using [these docs](https://jekyllrb.com/docs/front-matter/) as a reference, here's what I'll try adding to the beginning of my post:

```
---
title: Making my posts discoverable
description: Using the Jekyll SEO Plugin to index my blog posts on Github Pages
---
```

After committing my changes and waiting for the page to be rebuilt, what was the result in the HTML?:

```
```

# More information about the Jekyll SEO Tag plugin

Just in-case you're hosting your own Jekyll blog and need to install this plugin yourself, the official [installation instructions](https://github.com/jekyll/jekyll-seo-tag/blob/master/docs/installation.md) will have you covered.