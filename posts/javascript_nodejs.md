# First impressions

So I wanted to try developing with node.js, as I already had a simple
HTML/CSS/JS application available and I was curious to see how it would feel.

However, when trying to run my application in the node.js framework, it wouldn't
work, because the Fetch standard (https://fetch.spec.whatwg.org/), including the
Javascript Fetch API, isn't included in node.js.

There is a workaround for including it in your app:
```
global fetch = require("node-fetch");
```

But even with this - you won't be able to test your fetch() calls in your
browser until you deploy your node.js app somewhere... this is because node.js 
is a server-side framework.

So this made me a bit sad, as it meant that by choosing to use a framework
for developing my code, the simple conventions that I was used to for simple
development no longer worked.

There is a solution to this also - install a library called browserify that
allows you to run node.js functions locally - but really, this is just another
layer of complexity that I don't want (at the moment).
