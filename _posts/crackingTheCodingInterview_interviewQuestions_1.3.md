---
title: Cracking the Coding Interview - 1.3 URLify
description:
date: 2021-06-04
tags:
  - cracking the coding interview
---

# urlify

tags:
- java

For solving this question, I got really excited and wondered if I could create a function that cloud url-ify ALL different types of special characters, not just spaces (` ` = `%20`), so keep that in mind. To get a list of percent encodings, I went here: https://en.wikipedia.org/wiki/Percent-encoding

I really liked this format to initialise a number of paired values (thank you [SO](https://stackoverflow.com/questions/6802483/how-to-directly-initialize-a-hashmap-in-a-literal-way)!):

	private static Map<String, String> percentEncoding = Map.ofEntries (
				entry("!", "%21"),
				entry("#", "%23"),
				entry("$", "%24"),
				entry("%", "%25"),
				entry("&", "%26")
	);
	
# see also
[Cracking the Coding Interview](Cracking%20the%20Coding%20Interview.md)