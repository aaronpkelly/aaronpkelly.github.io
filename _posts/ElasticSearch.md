

### How ElasticSearch indexes

Here's one of their docs on indexing:
https://www.elastic.co/guide/en/elasticsearch/reference/current/getting-started-index.html

#### exporting to a RDB

When it comes to building a searchable index of _stuff_, I've heard lots of good things about Memcached, Redis... and I know AWS combine
both of these applications into a service called 'Elasticsearch', so I figured
this would be a good opportunity to try it out!

I knew that if I could get all my emails exported into plain text, then I'd be
able to format them and insert them into a Redis database.

Then, I could export this database as a _rdb_ file.

Then, I could give this _rdb_ file to AWS when it is creating my Elasticsearch,
and boom, my content should hopefully be immediately searchable.

### Creating an ElastiCache instance

### Running a search

One thing I discovered quickly is that there's no GUI. You need to communicate
with the service via HTTP requests (GET, POST...). So my idea that it had a
frontend with a search bar went out the window straight away.

### Kibana

However - it appears that a plugin called Kibana can be used to not only
visualise data, but also to enter it. I'll update this section when I know more

As a test, I decided to see if I could submit their _accounts.json_ sample data
set to my Elasticsearch instance: