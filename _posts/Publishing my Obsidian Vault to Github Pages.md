---
title: Publishing my Obsidian Vault to Github Pages
description:
date: 2021-06-07
tags:
  - obsidian
  - github
---

# It kind of works

I use Obsidian to not only take notes, but to also write blog posts.

I currently use a custom bash script to make some modifications to my posts at build time to a format that works for Github pages. Github will then build a static HTML site for me, with its native support for Jekyll.

So, it kind of works.

What's really broken are the links between articles, the soul of what my makes a blog great.

I decided to either try and fix it myself, or try using a tool written by someone else.

# Plugins for publishing to different blog hosts

I think I should continue to write my blog in obsidian, but have different plugins (scripts) for converting them to the target platform

## github pages

To solve the broken links problem, I did try this, but it doesn't work: https://github.com/benbalter/jekyll-relative-links

Instead I'm going to have to try modifying my github pages script to generate my own `page_url` "liquid tags": https://stackoverflow.com/questions/31480030/jekyll-link-to-posts-from-pages#31483469

E.g.:

	[crackingTheCodingInterview_interviewQuestions_1.1]({% post_url 2021-05-19-crackingTheCodingInterview_interviewQuestions_1.1 %})


# Apart from writing my own plugins - what FREE static html publishing tools are out there?

https://github.com/kmaasrud/oboe

https://github.com/srid/neuron/

# the paid option - Obsidian publish

I want to avoid doing this for now: https://help.obsidian.md/Index