---
title: CORS - what is it?
description: An explanation on CORS
date: 2020-01-31
categories:
  - webdev
---

# CORS - what is it?
This policy frustrates me so much whenever I try and build a web project, I decided to dedicate a post to it.

It's a policy that restricts YOUR javascript code from making requests and using resources from other domains (origins). Which is a bummer, cos there's so much good JSON out there ready to be used.

Here's a good explanation from [SO](https://stackoverflow.com/questions/55673803/typeerror-networkerror-when-attempting-to-fetch-resource):

	It says that a CORS error has occurred, and that's because the front-end and back-end are hosted under different domain or ports if on localhost, lets explain this a little bet further.

	CORS which stands for Cross Origin Resource Sharing is a security policy that applies only to Javascript (Browsers) that blocks websites from accessing other websites using AJAX unless they are explicitly approved using headers.

	To solve this, you need to pass certain headers in the response from the server side that approves CORS for the requesting domain, headers & methods
	
MDN: https://developer.mozilla.org/en-US/docs/Web/HTTP/CORS

# Dealing with CORS
This: https://cors-anywhere.herokuapp.com/

A proxy which sends your HTTP request on behalf of you, then returns the response to you with CORS headers. Your browser then thinks "CORS headers huh? Everything is A-OK BRUH" and you can now happily use the response data in your JS code.