
Table of Contents
=================

Parsing local markdown file requires access to github API
Error: You exceeded the hourly limit. See: https://developer.github.com/v3/#rate-limiting
or place github auth token here: /home/ec2-user/src/aaronpkelly/aaronpkelly.github.io/token.txt
---
layout: post
title: How I host non-Jekyll webpages within Jekyll
---

One of my major desires for a Jekyll-heavy website was the ability to link to
project webpages that did not have any Jekyll formatting, and that were allowed
to live safely within the Jekyll website's folders. In this way, I could use
Github pages to not only host my super fancy Jekyll site, but I could also use
it to host my simple projects that only required very basic `.html` files, with
maybe a little bit of CSS or Javascript thrown in.

The convenience (and zero cost) of Github pages and a simple Jekyll syntax of
linking to internal pages within my site has ended up saving me a lot of
hassle:

```
<a href="{{ site.url }}/some/folder/structure/index.html">My Amazing Project</a>
```

I first tested this with *spreadList*, one of my first Javascript apps that
I intend to keep developing. It worked great, but then I had to consider the
question of where my development would take place - within Github pages, or
externally?

Very quickly I decided that the best course of action would be to develop the
project outside of where it is hosted, in order for it to be tracked with its
on version control system, and then use a bash script to copy it to Github
Pages when I was happy to release the next iteration.

So far - this has been working out very nicely :)
