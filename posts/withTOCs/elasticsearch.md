
Table of Contents
=================

   * [What makes me want to try it?](#what-makes-me-want-to-try-it)
   * [Running an Elasticsearch instance](#running-an-elasticsearch-instance)
   * [Running a search](#running-a-search)
      * [Kibana](#kibana)
   * [Indexing](#indexing)

Created by [gh-md-toc](https://github.com/ekalinin/github-markdown-toc)



# What makes me want to try it?

I want to index the email in my old gmail accounts and make them searchable.

I know that I can easily download all my Google data using
https://takeout.google.com, including my mailbox MBOX files, but this is plain
text, and so my current solution relies on me manually grepping these files
for keywords.

There must be a better way to search!

I've heard lots of good things abou Elasticsearch recently, so I figured this
would be a good opportunity to try it out!

# Running an Elasticsearch instance

I could run it myself, or I could use AWS Elasticsearch Service. I opted for
AWS for the moment as it's quicker to get started with.

# Running a search

One thing I discovered quickly is that there's no GUI. You need to communicate
with the service via HTTP requests (GET, POST...). So my idea that it had a
frontend with a search bar went out the window straight away.

## Kibana

However - it appears that a plugin called Kibana can be used to not only
visualise data, but also to enter it. I'll update this section when I know more

# Indexing

Here's another thing I took for granted - Elasticsearch doesn't index anything
for you, it's strength is providing near-instant data search. The caveat is
that you need to do the indexing yourself, and provide Elasticsearch with the
metadata.

So I'd need to find out how to index stuff.

Here's one of their docs on indexing:
https://www.elastic.co/guide/en/elasticsearch/reference/current/getting-started-index.html

As a test, I decided to see if I could submit their _accounts.json_ sample data
set to my Elasticsearch instance:

tags: search, elasticsearch, google, takeout, aws