---
title: My personal infrastructure kingdom
description: How I write and publish my thoughts, and the tools I use to do it
tags:
    - infrastructure
    - markdown
    - api
    - meilisearch
    - pages.github.com
---

A quick asciiflow infinity diagram showing how I want to be able to write and publish my content using all sorts of different services.

Hopefully this will expand to be a fully automated pipeline, e.g. edit/add a document in mardown, and it will ripple through and update all my services.

          +----> pages.github.com
          |
          |
          |
          |
          |
          |
markdown  +----> api
          |
          |
          |
          |
          |
          |
          |
          +----> json +---------> meilisearch

generated with: http://asciiflow.com/