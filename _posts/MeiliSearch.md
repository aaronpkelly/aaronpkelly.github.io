---
title: Meilisearch
description: Using Meilisearch to index things
date: 2020-03-06
tags:
  - mbox
  - meilisearch
---

# Meilisearch

Just when I had given up hope in finding an easy-to-use indexing tool... something amazing happened. I came across [this post](https://news.ycombinator.com/item?id=22685831) on hacker news. It was a tool that performed indexing similar to Elasticsearch, but was much simpler: https://github.com/meilisearch/MeiliSearch

# How i use it
I've used it locally and it worked fantastically.

[[Digital Ocean]] have a Meilisearch droplet on their marketplace that spins up mostly pre-configured. I'm currently trying it out!

# Usage notes
## Creating an index 

```
curl -i \
    -X POST 'http://localhost:7700/indexes' \
    --data '{ "name": "Emails", "uid": "emails" }'
```

## Sending JSON-ified emails to Mellisearch

```
curl \
    -i \
    -X POST 'http://localhost:7700/indexes/emails/documents' \
    --header 'content-type: application/json' \
    --data-binary @myEmail.json
```