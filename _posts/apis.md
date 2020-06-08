---
title: APIs
description: How I created my own API
date: 2020-01-10
tags:
    - APIs
---

# APIs

I love APIs. I like the power an API gives you, whether it be to simply return some useful data, or to trigger a complex series of actions behind the scenes.

# The need

My initial need for an API was to access a service that could quickly get the data I needed before I started my commute in the morning - I found myself wrangling with a bunch of different phone apps and services. It was difficult to get the results I wanted using what was currently available.

So, I decided to try designing my own API to do all the heavy lifting for me. Initially it was a lot of work. In most cases, I've needed to dig into website assests that never intended to see the light of day - parsing JSON data and HTML in order to construct some useful JSON out it.

And I'm happy to say... the hard work is paying off!

# Benefits of deploying a personal API

Once an API is deployed, there are a number of immediate benefits:

- the API endpoints are callable from anywhere in the world with an internet connection

- sending a request to an API endpoint can be a simple request, but the tasks it triggers can be intricate and complex, especially if you're API is calling out to a service like AWS Lambda to perform some heavy compute instruction

# APIs I've designed

I've created:

- a personal API that can perform complex requests to internet services I use frequently: http://aaronkelly.pythonanywhere.com/

- APIs that transform and return plain JSON data for a number of public services which don't offer a good API service themselves. Below are some static frontend websites that use my APIs a the backend:
	- [TinyTimetable - DublinBikes](http://app-bucket-dublin-bike-tinytimetable.s3-website-eu-west-1.amazonaws.com/)
	- [TinyTimetable - DublinBus](http://app-bucket-dublin-bus-tinytimetable.s3-website-eu-west-1.amazonaws.com/)
	- [TinyWeather](http://app-bucket-weather-dublin-tinyweather.s3-website-eu-west-1.amazonaws.com/)

- custom GUI frontends for my APIs: https://git.sr.ht/~aaronkelly/accomplice

- a CLI binary to help me call my APIs easily: https://git.sr.ht/~aaronkelly/api-cli

<iframe height="400px" width="100%" src="https://repl.it/@aaronpkelly/UpbeatFairLegacy?lite=true" scrolling="no" frameborder="no" allowtransparency="false" allowfullscreen="true" sandbox="allow-forms allow-pointer-lock allow-popups allow-same-origin allow-scripts allow-modals"></iframe>

# API Frameworks I've tried

I've used a bunch of different API frameworks; flask, node.js, AWS API Gateway... I have to say I find flask the easiest to use! 

# API Testing and Validation (INCUBATING)

It's taking me some time find a killer solution for testing an API that's been deployed.

I'm currently using https://assertible.com/, which for the moment is good as separate, always-on service that runs in the cloud.

However I have just found https://github.com/sanathp/statusok, and I think this tool could become part of my CI/CD pipeline - it's open-source and very simple.

# See also
[[Using AWS API Gateway]]