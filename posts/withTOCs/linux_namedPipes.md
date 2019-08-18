
Table of Contents
=================



Created by [gh-md-toc](https://github.com/ekalinin/github-markdown-toc)
---
layout: post
title: Title
date:   2019-07-27
categories: linux named pipe inter-process communication
---

An interesting article I came across today talked about _named pipes_ in Linux.

I've never used them, but now I really want to.

It is an in-memory location for writing data to, skipping disk altogether.

It's primary purpose is easy inter-process communication, and as wikipedia
says, can be used to transfer information from one application to another
without the need of opening a file.

For example, watch what happens when you put some text to a named pipe:
```
mkfifo -m 0666 /tmp/myPipe
echo "In one end... and out there other"
```

Your shell will then wait until the contents of the pipe is consumed by another
process. If you want, you can append an ampersand `&` to the second command to
have your command executed in the background, which will give you back control
of your shell.

Now, opening up another shell (or in your current one if it's free), try
reading the contents of your pipe:
```
cat /tmp/myPipe
```

The contents of the pipe appears in the other shell, and your pipe is now empty!
No disk writes occured.

I'm sure there's a lot of use cases for this.

#  Good articles
https://en.wikipedia.org/wiki/Named_pipe
https://www.networkworld.com/article/3251853/why-use-named-pipes-on-linux.html
