---
title: Using QUnit to test Javascript apps
description: AWS
date: 2020-09-28
categories: 
  - software development
  - testing
tags:
  - qunit
  - javascript
---
# intro

My experience with Javascript is minimal, and my experience with _testing_ that Javascript is even... minimaler.

The testing need came very quickly after the complexity of a [webapp I was writing](https://sr.ht/~aaronkelly/commentgrower/) started to grow. 

I've previously tried testing using [[Mocha]] in [[testing-a-nodejs-app-with-mocha]], but that really felt like a gigantic hammer to hit a small nail.

I wanted something smaller and simpler - QUnit seemed to fit the bill very nicely!

# getting started
Where possible I wanted to use the [QUnit website](https://qunitjs.com/) as my primary source of usage and test examples. If I felt that I wasn't getting enough info, I'd start searching elsewhere.

## examples
I'm not claiming these are world-class examples, but this is how I started testing:
```
QUnit.module('DOM structure', function() {

	QUnit.test('should create a text input box', function(assert) {
		assert.equal('INPUT', createTextInputBox().nodeName, 'element INPUT created');
		assert.equal(createTextInputBox().id, ID_INPUT_BOX, 'element INPUT has correct id');
	});

	QUnit.test('should verify that an INPUT element is now a child of the body', function(assert) {
		createAndAttachInputBoxToBody();
		assert.equal(document.getElementById(ID_INPUT_BOX).id, ID_INPUT_BOX);
		assert.equal(document.getElementById(ID_INPUT_BOX).parentNode, document.body);
	});
});

QUnit.module('nodes and trees', function () {

	QUnit.test('should create the root UL node', function (assert) {
		assert.ok(createRootNodeOnBody(), 'root node created')
	});

	QUnit.test('should return the root node with proper element and id', function (assert) {
		assert.equal(createRootNodeOnBody().nodeName, 'UL', 'root node is proper element')
		assert.equal(createRootNodeOnBody().id, ID_ROOT_NODE, 'root node has proper id')
	});

	QUnit.test('should get the root UL node', function (assert) {
		createRootNodeOnBody();
		assert.ok(getRootNode(), 'non-empty object returned')
	});

	QUnit.test('should create a root node with the story title', function (assert) {
		createRootNodeOnBody();
	});
});
```

# testing asynchronous requests and responses
Once I was able to test test that the basic elements of my webpage were in-place, it was on to testing the *functionality*.

The QUnit [docs](https://api.qunitjs.com/assert/async/) do give examples of testing asynchronous functions, but they did not give me what I wanted - testing the values RETURNED from those functions.

My [[Javascript notes]] article says that there are three ways to retrieve the return value of an asynchronous function - so I spent a couple of days ruminating about it, and and trying different methods. Eventually, I decided to go with using a _callback_, as it was the simplest.

I ended up with a test like this:

```
QUnit.test('should get a XMLHttpRequest response', function ( assert ) {
	var done1 = assert.async();

	sendXMLHttpRequest(STORY_URL_BASE + STORY_ID + '.json', function(myCallback) {
		assert.equal(myCallback, 'tmatthe', 'correct callback received')
		done1();
	});
})
```

To test this code:

```
function sendXMLHttpRequest(url, callback) {
    let request = new XMLHttpRequest();

    request.open("GET", url);
    request.responseType = "json";
    request.send();

    request.onreadystatechange = function () {
        if (request.readyState == 4) {
            callback(request.response['by']);
        }
    };
}
```

