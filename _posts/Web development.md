---
title: Web development
description:
date: 2020-02-11
categories:
  - webdev
---

# Web development
- learn plain JS



## Keep in mind

- frameworks come and go - but vanilla javascript is here to stay!

Zero-cost hosting:
- the best website is a static website 
- netlify is free ([[Jamstack]] anyone?), public domain address
- AWS S3 buckets can serve static websites, public domain address
- all of the above can still use JS + call APIs etc
- all of the above can use [[Cloudflare]] as a free CDN to sit in front of your site and reduce the cost from pennies to zero
	- a cloudflare worker sits in-front of your site to do caching of common hot queries 

# Building a web application
## Guides that don't drive me insane

https://developer.mozilla.org/en-US/docs/Learn/Server-side/First_steps/Web_frameworks

https://devcenter.heroku.com/articles/getting-started-with-nodejs (see [[Heroku]])

this is old-school cute, should I start here?: https://www.w3schools.com/php/php_mysql_intro.asp

somebody feels my pain: https://hn.algolia.com/?dateRange=all&page=0&prefix=true&query=web%20development&sort=byPopularity&type=story

the dark side: https://aws.amazon.com/getting-started/hands-on/build-modern-app-fargate-lambda-dynamodb-python/

## primo - you can also skip the code, and use an all-in-one IDE, CMS, component library, and static site generator
https://news.ycombinator.com/item?id=23820201

# Courses
https://www.freecodecamp.org/ - yay

# Resources

## Code playgrounds
https://jsfiddle.net/ - great!
http://codepen.io/ - want to try!

## Free shells
https://labs.play-with-docker.com/ - an excellent free environment for running docker images and other shell commands. 4 hour lifetime

## IDEs
[[Gitpod.io]] - incredible
https://aws.amazon.com/cloud9/ - works well

Are these still ok?
https://codenvy.com/
https://codio.com/
http://codemirror.net/
https://shiftedit.net
https://pypyjs.org/editor.html
https://docs.gitlab.com/ee/user/project/web_ide/

## Manifestos
The Twelve-Factor App: https://www.12factor.net/ (https://news.ycombinator.com/item?id=3267187)

## Comments (lightweight)
https://fastcomments.com/

## Design resources
https://designresourc.es/



# See also
[[Scraping websites for their plump JSONs]]

[[CORS]]

[[Development]]

[[Finding the ultimate CSS style]]

[[Software Development]]

[[Javascript]]

[[VPS]] - virtual private servers to deploy to