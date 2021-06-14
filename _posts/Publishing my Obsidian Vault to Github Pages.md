---
title: Publishing my Obsidian Vault to Github Pages
description:
date: 2021-06-07
tags:
  - obsidian
  - github
---

# Turning notes into blogs

I use [Obsidian](https://obsidian.md/) as my primary note-taking application, and I think its great.

But one day while I was gazing up into the sky, I wondered... could I turn my notes into blog posts? And could I publish my notes to various blogging platforms *without* having to change the way that I took notes in Obisidan?

Obsidian do offer a [publishing service](https://obsidian.md/publish), but it's expensive, and why pay for something easy, when I can embark of months of personal toil trying to do the same thing for free?

And so began my journey to write my own plugins to do make this possible.

# Github pages

You can host your own blog on [Github Pages](https://pages.github.com/) for free. Github Pages has native support for Jekyll, a powerful blogging platform which can build a static HTML site for you... as long as you follow the rules.

I initially started with a simple bash script, which as part of a post-commit build pipeline, would made some modifications to my posts to make them Jekyll friendly.

I had many challenges:
- generating lists of posts, which required mo to write my own bash scripts, and then eventually learn the Liquid templating language
- learning about Jekyll gems and how to use them
- linking between articles, the soul of what my makes a blog great, would not work
- coming up for solutions to exclude articles that were still in-progress

The script that I wrote is [here](https://github.com/aaronpkelly/aaronpkelly.github.io/blob/master/jekyll-plugin_generateIndexAndPostsList.sh). It's currently very ugly, but becoming more beautiful every day.

# Plugins for publishing to different blog hosts

I think I should continue to write my blog in obsidian, but have different plugins (scripts) for converting them to the target platform

## github pages

To solve the broken links problem, I did try this, but it doesn't work: https://github.com/benbalter/jekyll-relative-links

# Apart from writing my own plugins - what FREE static html publishing tools are out there?

https://github.com/kmaasrud/oboe

https://github.com/srid/neuron/
