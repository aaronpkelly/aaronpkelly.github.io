---
title: Containers
description:
date: 2020-03-21
tags:
    - containers
	- docker
---

# Containers
This post starts as generic as possible in regards to working with containers, and then has sections for particular container technologies (Docker, Podman...).

## Using containers effectively

### How to think about containers

As a sandboxed environment to host an application. This is the most common use case.

As a black box for transforming data. Set up an environment, take input, transform it, and output.

As a programming environment. VSCode has some [good support](https://code.visualstudio.com/docs/remote/containers) for developing inside a container already.

### Daily use

Get in the habit of using a disposable container whenever possible. Why go through all the trouble of writing a Dockerfile when all you want to do is use a piece of software once, and then throw it away. Spin up a tiny container with a decent package manager (Alpine Linux!), mount a volume to write to, install your software, and start working! [This post](https://news.ycombinator.com/item?id=23275315) has a script to drop you into a containerised environment for your current directory, and it takes care of the messy permissioning issues that occur when you touch files inside containers.

# See also

[[docker]]