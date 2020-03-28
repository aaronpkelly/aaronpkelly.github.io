
Table of Contents
=================



Created by [gh-md-toc](https://github.com/ekalinin/github-markdown-toc)


= 

I'm not sure how discoverable blogs that are hosted on Github Pages are, but I came across [this article](https://github.blog/2016-05-10-better-discoverability-for-github-pages-sites/) that seems to indicate that search engine optimisation is a valid concern, and that there is help out there in the form of a Jekyll plugin.

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
<title>Aaron Kelly’s Blog | Aaron Kelly’s Blog</title>
<meta name="generator" content="Jekyll v3.8.5" />
<meta property="og:title" content="Aaron Kelly’s Blog" />
<meta name="author" content="Aaron Kelly" />
<meta property="og:locale" content="en_US" />
<meta name="description" content="Aaron Kelly’s Blog" />
<meta property="og:description" content="Aaron Kelly’s Blog" />
<link rel="canonical" href="https://aaronpkelly.github.io/" />
<meta property="og:url" content="https://aaronpkelly.github.io/" />
<meta property="og:site_name" content="Aaron Kelly’s Blog" />
<script type="application/ld+json">
{"@type":"WebSite","url":"https://aaronpkelly.github.io/","name":"Aaron Kelly’s Blog","author":{"@type":"Person","name":"Aaron Kelly"},"headline":"Aaron Kelly’s Blog","description":"Aaron Kelly’s Blog","@context":"https://schema.org"}</script>
<!-- End Jekyll SEO tag -->

    <link rel="stylesheet" href="/assets/css/style.css?v=0d556b608acb40ad37c3e0461094a7fb6acf4be3">
  </head>
```

Boom. It looks like Jekyll SEO optimisation is done automatically for me, no need to install any additional plugins. Easy win!

Just in-case you're hosting your own Jekyll blog and need to install this plugin yourself, the official [installation instructions](https://github.com/jekyll/jekyll-seo-tag/blob/master/docs/installation.md) will have you covered.