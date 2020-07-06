# blogtrottr.com, for all the feeds
I really like RSS. Most sites provide a RSS feed so you can follow along with
the news/blog items that it produces.

I prefer to get my RSS feeds turned into emails, and when a new item appears on an RSS
feed, I get an email.

To do this, I use https://blogtrottr.com/

However, there can be a few issues encountered when trying to follow sites, here
are my solutions.

# No RSS feed provided?
https://rssproxy.migor.org/ - HTML -> RSS. Extremely good

http://createfeed.fivefilters.org/ - HTML -> RSS alternative

Also https://news.ycombinator.com/item?id=23583629 > https://rssbox.herokuapp.com - a number of different supported sites (if [[fraidyc.at]] doesn't support them natively)

# Dealing with messed-up feeds

Some feeds, like https://slate.com/rss, are valid, but they have an invalid
_content type_ which messes up blogtrottr.

For this, I use a feed cleaner: http://feedcleaner.nick.pro/

You can then subscribe to the new URL that the site generates
