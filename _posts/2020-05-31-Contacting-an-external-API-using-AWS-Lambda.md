---
title: Contacting an external API using AWS Lambda
description: Contacting an external API using AWS Lambda
date: 2020-05-31
tags:
  - aws
  - lambda
  - api
---

# Using node.js to contact an external API

I've already made my own AWS API and used AWS Lambda to contact it and return
data, but it didn't take long before I yearned to use lambda to contact
APIs that are available on the internet.

## The https-request blueprint

I wanted to try and find a template which suited my needs, and then modify
it as little as possible in order to return the data I wanted.

Sure enough, the _https-blueprint_ template was exactly what I needed!

I went to _AWS Lambda -> Functions -> Create function -> Use a blueprint -> _https-request_.

I gave it a name, and created a basic service role so it could execute lambda
requests. Here's the blueprint it offered to create:

```
const https = require('https');

/**
 * Pass the data to send as `event.data`, and the request options as
 * `event.options`. For more information see the HTTPS module documentation
 * at https://nodejs.org/api/https.html.
 *
 * Will succeed with the response body.
 */
exports.handler = (event, context, callback) => {
    const req = https.request(event.options, (res) => {
        let body = '';
        console.log('Status:', res.statusCode);
        console.log('Headers:', JSON.stringify(res.headers));
        res.setEncoding('utf8');
        res.on('data', (chunk) => body += chunk);
        res.on('end', () => {
            console.log('Successfully processed HTTPS response');
            // If we know it's JSON, parse it
            if (res.headers['content-type'] === 'application/json') {
                body = JSON.parse(body);
            }
            callback(null, body);
        });
    });
    req.on('error', callback);
    req.write(JSON.stringify(event.data));
    req.end();
};
```

The blueprint comments refer you to the HTTPS module documentation on how to
actually construct a request. They want a JSON event to be sent to the lambda
function, containing two fields: data and options.

It is possible to construct a test event which has both of these fields:

```
{
  "data": "dont_matter",
  "options": {
      "host": "reactual.lib.id",
      "path": "/hnfavs@dev/?id=aaronpkelly&limit=100"
  }
}
````

So - I could have deployed my API now, and reqiuire anyone who used it to supply this
information with every call. However, I wanted to hard-code the options as I
want my lambda function to be as simple as possible, and not require anything
to be passed in.

So, using the HTTPS module docs are a reference, I decided to define my options
inside the lambda function. I also commented out a line of code that attempts
to send data with my request, but since I'm not providing that, it's not
necessary and only causes an error.

Here's the full function:

```
// uses https://github.com/reactual/hacker-news-favorites-api

const https = require('https');

const options = {
  hostname: 'reactual.lib.id',
  path: '/hnfavs@dev/?id=aaronpkelly&limit=1'
}

/**
 * Pass the data to send as `event.data`, and the request options as
 * `event.options`. For more information see the HTTPS module documentation
 * at https://nodejs.org/api/https.html.
 *
 * Will succeed with the response body.
 */
exports.handler = (event, context, callback) => {
    const req = https.request(options, (res) => {
        let body = '';
        console.log('Status:', res.statusCode);
        console.log('Headers:', JSON.stringify(res.headers));
        res.setEncoding('utf8');
        res.on('data', (chunk) => body += chunk);
        res.on('end', () => {
            console.log('Successfully processed HTTPS response');
            // If we know it's JSON, parse it
            if (res.headers['content-type'] === 'application/json') {
                body = JSON.parse(body);
            }
            callback(null, body);
        });
    });
    req.on('error', callback);
    // req.write(JSON.stringify(event.data));
    req.end();
};
```

After saving this lambda function, and then attaching it to an API method, I
saw that it worked just fine:

```
aaron@DESKTOP-R07OBQT MINGW64 ~
$ curl https://7rntnkjshg.execute-api.eu-west-1.amazonaws.com/beta/utils/ycombinator/bookmarks | jq
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100  3985  100  3985    0     0   1287      0  0:00:03  0:00:03 --:--:--  1287
[
  {
    "id": "16869112",
    "title": "Instantly spin up a Docker-enabled terminal",
    "link": "https://labs.play-with-docker.com/"
  },
  {
    "id": "20184181",
    "title": "Observable’s Not JavaScript",
    "link": "https://observablehq.com/@observablehq/observables-not-javascript"
  },
  {
    "id": "22188877",
    "title": "Command-line tools can be faster than a Hadoop cluster (2014)",
    "link": "https://adamdrake.com/command-line-tools-can-be-235x-faster-than-your-hadoop-cluster.html"
  }
```