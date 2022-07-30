---
title: Static website hosting
description: Hosting a serverless static website on various services
date: 2020-05-31
categories:
  - development
tags:
  - aws
  - s3
  - static
  - serverless
---

# Static website hosting
You should basically be able to do it for free, or for pennies

# AWS S3
I like static webpages. I also like not haing to manage the server it runs on.

Being able to serve content, or host a useful tool, and letting someone else
worry about managing the servers, is pretty amazing.

One morning, I woke up early and started thinking about static website hosting, don't ask me why. I remember seeing a tutorial somewhere that used AWS S3 buckets for hosting static website content, and public access was then granted to the bucket. Pretty cool!

I use S3 for simple website hosting, using  only a minimal amount of HTLM5, CSS and JS. For something that needs more complicated integrations or a database, I'll use another service.

## How to get setup
Just follow their guide:
https://docs.aws.amazon.com/AmazonS3/latest/dev/WebsiteHosting.html

Soon you you have a bucket available to receive files, and serve them to the public.

I would recommend to setup a build pipeline that puts your files into the bucket with every new commit. 

## Advanced serverless static website hosting
There are already some great AWS docs on setting this up, so I don't think I
need to repeat them here. They have a great tutorial on the entire process, but I only completed this to the end of step 1, as I didn't need to do any advanced implementation:
[https://aws.amazon.com/getting-started/projects/build-serverless-web-app-lambda-apigateway-s3-dynamodb-cognito/](https://aws.amazon.com/getting-started/projects/build-serverless-web-app-lambda-apigateway-s3-dynamodb-cognito/)

In the future, maybe I will try:
- finishing the tutorial, so I can implement advanced behaviours on my websites, using serverless backend technologies
- registering a custom domain, and then linking that to my bucket - https://docs.aws.amazon.com/AmazonS3/latest/dev/website-hosting-custom-domain-walkthrough.html

## Static website projects I've created on AWS
I have a bunch of other pet projects that I occasionally work on from time to time:

[NVIDIA GeForce Now Supported Games List](http://nvidia-geforce-now.s3-website-eu-west-1.amazonaws.com/)

[PetiteSheets](http://app-bucket-petitesheets.s3-website-eu-west-1.amazonaws.com/)

[Screentime.cc](http://screentime.cc.s3-website-eu-west-1.amazonaws.com/)

[Timeliner](http://app-timeliner.s3-website-eu-west-1.amazonaws.com/)

# Digital Ocean

They offer 'App Platform' for automated static and dynamic webapp hosting. See [DigitalOcean notes]({% post_url 2020-06-01-DigitalOcean-notes %})

# Github pages

# Gitlab pages

# Netlify

# See also

[[Static website generators]]