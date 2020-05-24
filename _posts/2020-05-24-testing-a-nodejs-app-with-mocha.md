---
title: Testing a NodeJS app with Mocha
description: Exploring and using the Mocha test framework for a NodeJS app
---

# Vanilla Javascript TDD (Test-Driven-Development)

I had written a library of small Javascript functions that I wanted to do cover
with some basic tests. However, I found it really hard to find any information
about how to do this.

When I searched, I was barraged by so much information that everything very
quickly seemed to get overly complicated, and led me further and further away
from just simple plain Javascript testing. I really didn't want to get involved
with Javascript runtime environments like Node.js just yet, but I felt that a
lot of the resources I was finding were targeting it.

I liked the sound of [tape](https://github.com/substack/tape) because it seemed
like it was a fairly minimal stand-alone test suite, but for some reason I
didn't really get far with it.

Not having much success with rolling my own unit tests, I decided to see what
unit testing frameworks were on offer.

# Giving in to Node.js

I remembered that AWS CodeStar has sample software projects, and these come
with tests and suggested test frameworks, so I decided to see what they were
using.

Unfortunately, there were no vanilla Javascript sample projects offered, every
web application using Javascript used Node.js. So I just decided to give in.

I could see that the build files for the Node.js project used the following
tools:
- Unit.js
- Mocha

I don't know why they use 2 unit testing frameworks, so maybe there was a
difference between them. Here is how unitjs.com describes them both:

"Unit.js is an assertion library for Javascript, running on Node.js and the
browser. It works with any test runner and unit testing framework like Mocha,
Jasmine, Karma, protractor (E2E test framework for Angular apps), QUnit, ...
and more."

"Mocha is a feature-rich JavaScript test framework running on Node.js and in the
browser, making asynchronous testing simple and fun. Mocha tests run serially,
allowing for flexible and accurate reporting, while mapping uncaught exceptions
to the correct test cases."

This also meant that I would potentially need to learn 3 different tools in order
to try and achieve the simple objective of testing my existing vanilla
Javascript.

Total overkill!

Anyway, I decided to stop moaning and start.

# Testing a simple function

I have written my own Javascript library with some common functions that I use
frequently. I picked a simple function which I wanted to write a test for:

lib_javascript.js:
```
function isXML(str) {
	var XML_HEADER="<?xml version=";

	if (str.includes(XML_HEADER)) {
		return true;
	}
	return false;
}
```

According to the documentation, to test this function using Unit.js and Mocha,
my test case should look like this:

. ./tests/test.js
```
'use strict'; 
 
var test = require('unit.js'); 
var lib = require('../lib_javascript.js'); 
 
describe('Tests index', function() { 
	it('tests if a string is XML', function() { 
		var rst = lib.isXML("");
		test.bool(rst).isFalse();
	}); 
}); 
```

And then to run the test, I should define my test frameworks in a file:

.package.json:
```
{ 
    "name": "library", 
    "description": "Javascript library", 
    "version": "0.0.1", 
    "private": true, 
    "devDependencies": { 
        "mocha": "5.0.0", 
        "unit.js": "2.0.0" 
    }, 
    "scripts": { 
        "test": "mocha --recursive tests" 
    } 
}
```

And then install and run the tests:
```
$ npm install
$ npm test
```

Which gave this output:
```
> mocha --recursive tests

  Tests index
    ✓ tests if a string is XML

  1 passing (10ms)
```
