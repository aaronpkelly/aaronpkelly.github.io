---
title: Web development notes
description:
date: 2020-02-11
categories:
  - webdev
---

# Web development notes

## Keep in mind
- frameworks come and go - but vanilla javascript is here to stay!

## Zero-cost hosting
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

# Web development courses
https://www.freecodecamp.org/

https://fullstackopen.com/en/ - saw on 24374979

https://frontendmasters.com/books/front-end-handbook/2019

# Resources

## Source code playgrounds

Great starting point for comparison: https://en.wikipedia.org/wiki/Comparison_of_online_source_code_playgrounds

i did a comparison fiddle here: https://jsfiddle.net/aaronkelly/Lemb5gfs/1/

from a HN post:

	If you want to just write code in a box and have it run, maybe you should use http://sketchpad.cc/ or https://jsfiddle.net/. Or code.labstack.com, intervue.io, codepad, codiva.io, paiza.io, compilr, ideone, onlinegdb, repl.it, rextester, mycompiler, jsbin, sequential, or the other couple dozen alternatives in https://en.wikipedia.org/wiki/Comparison_of_online_source_co.... Or ObservableHQ, which is fucking amazing. Or try.jupyter.org. Or just your browser's JavaScript console. Or ShaderToy, where you can program in GLSL. Or Philip Guo's http://PythonTutor.com/ which can step you through the execution of simple code step by step while visualizing the stack.

### html/css/js

https://jsfiddle.net/ - great!
http://codepen.io/ - want to try!

### embeddable + runnable code

https://replit.com/ - pretty fantastic:

	- embeddable + runnable code
	- currently using this for blog code snippets
	- can also check-out a github repo and run code, although limited to a single "run" command. would be great if you could select-and-run github file

https://www.onlinegdb.com/ - nice looking, works!

https://paiza.io - a bit fugly but works!

### embeddable, but non-runnable

https://ideone.com - nice
https://tio.run - very swank

### not embeddable, not runnable

https://rextester.com - nice

### untested

some of these share buttons aren't working (crypto-miners?)

https://glot.io - nice, but the share snippet buttons broken
https://code.labstack.com - very fancy, but again, share button disabled/broken


## Wireframes / mockups

https://www.figma.com/

# Utilities
https://curl.trillworks.com/ - Convert curl syntax to Python, Ansible URI, MATLAB, Node.js, R, PHP, Strest, Go, Dart, JSON, Elixir, Rust

## Free shells
https://labs.play-with-docker.com/ - an excellent free environment for running docker images and other shell commands. 4 hour lifetime

## IDEs
See [IDEs](IDEs.md)

## Manifestos
The Twelve-Factor App: https://www.12factor.net/ (https://news.ycombinator.com/item?id=3267187)

## Comments (lightweight)
https://fastcomments.com/

## Design resources
https://designresourc.es/

# See also

[[CORS - what is it]]

[[Development]]

[[Finding the ultimate CSS style]]

[[Javascript notes]]

[[regex notes]]

[[SQL]]

[[Scraping websites for their plump JSONs]]

[[Software Development]]

[[VPS]] - virtual private servers to deploy to

[[webservers]]
