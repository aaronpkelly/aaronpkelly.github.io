
Table of Contents
=================

   * [The adventures of indexing an 8GB MBOX file](#the-adventures-of-indexing-an-8gb-mbox-file)
   * [Exporting the MBOX contents](#exporting-the-mbox-contents)
      * [Naiively working with MBOX contents using popular email clients](#naiively-working-with-mbox-contents-using-popular-email-clients)
         * [Claws Mail](#claws-mail)
         * [Thunderbird](#thunderbird)
      * [Analysis of export](#analysis-of-export)
   * [Formatting the exported content](#formatting-the-exported-content)
      * [Media attachments, a problem for another day](#media-attachments-a-problem-for-another-day)
      * [Plain-text exports, formatting, importing to Redis, exporting to a RDB](#plain-text-exports-formatting-importing-to-redis-exporting-to-a-rdb)
   * [Searching/indexing](#searchingindexing)
      * [ElasticSearch - considering the service](#elasticsearch---considering-the-service)
         * [How ElasticSearch indexes](#how-elasticsearch-indexes)
         * [Creating an ElasticSearch instance](#creating-an-elasticsearch-instance)
         * [Running a search on Elasticsearch](#running-a-search-on-elasticsearch)
         * [Kibana](#kibana)

Created by [gh-md-toc](https://github.com/ekalinin/github-markdown-toc)



# The adventures of indexing an 8GB MBOX file

I've got a load of old emails that I want to search.

Many email providers offer to export your old emails in the MBOX format (like Gmail, using
https://takeout.google.com), so this is great.

I'd also like to extract all the attachments separately.

# Exporting the MBOX contents

The contents of MBOX files are just plain text, which has advantages:

- linux tools like grep, sed and awk are designed to work very efficiently with
plain text

and disadvantages:

- embedded information, like email attachments, is not immediately readable
- the file is huge - 8GB, 250,000+ messages. It takes a long time to download
AND search, and even then, my search is limited to plain text

There must be a better way to index this MBOX file!

## Naiively working with MBOX contents using popular email clients

I've looked to some email clients to see how good their MBOX support was, and
whether they offered tools to easily work with them.

### Claws Mail

I tried Claws Mail, and although initially it was able to index all the email and
present a search interface, it choked heavily whenever I tried to
search it. I never completed a successful search.

### Thunderbird

Next up, Thunderbird, and I struggled to find out how to import a MBOX at all in the first place (it's an addon, ImportExportTools NG).
Also, when I finally installed it, when clicking the _Import mbox file_ item, it did nothing. Turned out I had to setup an email accound first, in order
to access the _Local folders_ screen.

After the import finished, the search seemed to work, and I was able to sort the email items fairly quickly. Performance seemed good!

It offered the ability to export all messages as plain text+attachments, which was great. My first export failed at 240/250k mails though, which was very
annoying! I struggled to make any progress until I refined my export settings, by exporting a new MBOX file per-year into its own folder. this
way I'd be breaking the problem up into smaller chunks.

## Analysis of export

Getting a summary of the exported file types:

```
find . -type f | sed 's/.*\.//' | sort | uniq -c
```

# Formatting the exported content

Elasticsearch doesn't solve the problem of automatically sifting throught your
source content and somehow creating a sensible structure for it... it
expects you to solve this, and then provide it with metadata. It's strength is
providing near-instant data search, you do the rest.

So, if you do find yourself with lots of data in different formats, you have a
bit of work to do.

## Media attachments, a problem for another day

Generally I'm not too concerned with sorting all of this. I created a folder
for each filetype and then uploaded it to it's own bucket on S3. Organising
media is a future problem!

## Plain-text exports, formatting, importing to Redis, exporting to a RDB

When it comes to building a searchable index of _stuff_, I've heard lots of good things about Memcached, Redis... and I know AWS combine
both of these applications into a service called 'Elasticsearch', so I figured
this would be a good opportunity to try it out!

I knew that if I could get all my emails exported into plain text, then I'd be
able to format them and insert them into a Redis database.

Then, I could export this database as a _rdb_ file.

Then, I could give this _rdb_ file to AWS when it is creating my Elasticsearch,
and boom, my content should hopefully be immediately searchable.



# Searching/indexing

## ElasticSearch - considering the service

### How ElasticSearch indexes

Here's one of their docs on indexing:
https://www.elastic.co/guide/en/elasticsearch/reference/current/getting-started-index.html

### Creating an ElasticSearch instance

### Running a search on Elasticsearch

One thing I discovered quickly is that there's no GUI. You need to communicate
with the service via HTTP requests (GET, POST...). So my idea that it had a
frontend with a search bar went out the window straight away.

### Kibana

However - it appears that a plugin called Kibana can be used to not only
visualise data, but also to enter it. I'll update this section when I know more

As a test, I decided to see if I could submit their _accounts.json_ sample data
set to my Elasticsearch instance:













tags: search, elasticsearch, google, takeout, aws