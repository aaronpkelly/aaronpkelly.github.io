---
layout: post
title: HTML generation, Jekyll, and Github Pages
categories: jekyll containers
---

# HTML generation - the initial problem
Today the search began for a tool that would allow me to programmatically
generate HTML code around content that I've written for a website. I want
a minimum of fuss, and I ideally don't want to learn an entirely new language
to do it. The goal is to be able to focus on writing content, and not endlessly
editing HTML files. So whats on offer?

PHP is supposed to be the defacto language for generating HTML. However,
a quick search showed that it wasn't for me. I'll let you look for yourself
on why I came to that conclusion.

Major programming languages, for example Python and Go, seem to have some
package or other that deal with for HTML generation, with some more developed
than others. I quickly scanned the offerings, but didn't find anything that
really blew me away.

Three pages deep into search results, I began to despair. But my heart
gladdened when I came across a site that I'd previously visited many months
ago, but had forgotten about - **Jekyll!**

I'm a huge fan of markdown, so the idea of turning simple text into HTML is a
win in my book.

# Building the site locally
Initially, I decided to create a dockerfile that would include the complete
build environment required by Jekyll to build and serve webpages. This was
accomplished, and the dockerfile now resides in the folder. There's a few bugs
with permission and a lot of time was spent trying to connect from a browser on
the host machine to the container, but I eventually figured it out.

# Hosting my Jekyll site on Github Pages
It was soon after that I realised that Github has support for Jekyll built-in
to its "Github Pages" service. All that is required is that a Jekyll-compatible
folder is uploaded to a `site.github.io` repository, and Github will build and
serve the site to the world. So I decided to let Github take over hosting my
website - the hassle it saves me is significant.
