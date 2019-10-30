
Table of Contents
=================

Parsing local markdown file requires access to github API
Error: You exceeded the hourly limit. See: https://developer.github.com/v3/#rate-limiting
or place github auth token here: /home/ec2-user/src/aaronpkelly/aaronpkelly.github.io/token.txt



I really like RSS. Most sites provide a RSS feed so you can follow along with
the news/blog items that it produces.

I prefer to get my RSS feeds turned into emails, and when a new item appears on an RSS
feed, I get an email.

To do this, I use a service: https://blogtrottr.com/

However, there can be a few issues encountered when trying to follow sites, here
are my solutions.

## No RSS feed provided

I find this site is excellent: http://createfeed.fivefilters.org/

"Create an RSS feed for a web page which does not offer its own."

## Dealing with messed-up feeds

Some feeds, like https://slate.com/rss, are valid, but they have an invalid
_content type_ which messes up blogtrottr.

For this, I use a feed cleaner: http://feedcleaner.nick.pro/

You can then subscribe to the new URL that the site generates
