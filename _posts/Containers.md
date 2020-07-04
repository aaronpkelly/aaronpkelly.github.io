---
title: Containers
description:
date: 2020-03-21
categories:
  - development
tags:
  - containers
  - docker
---

# Containers
This post starts as generic as possible in regards to working with containers, and then has sections for particular container technologies (Docker, Podman...).

# Container management
I typically just run containers myself on a cheap [[VPS]]

Or I use a self-hosted PAAS like Caprover, see [[Self-hosting]]

## Watching for new images
A tool like [Watchtower](https://github.com/containrrr/watchtower ) that can restart them when image is updated.

Even simpler... there was also a post on HN where the same thing was accomplished by just using git hooks and docker:

	For those who have even simpler needs (like side projects, or 1 dev projects), I found using simply docker and git to be plenty enough.

	Basically, you can create a bare git repository on your server (`git init --bare`), and put a `hooks/post-receive` script within it that will clone sources in a temporary directory, build the docker image and rotate containers. That way, you can `git push` to build and deploy, and it's easy to migrate server.

	The added bonus is that you now have a central git repos that can act as backup, so you don't need github or gitlab.

- [link](https://news.ycombinator.com/item?id=23465087)

# Using containers effectively

## How to think about containers

As a sandboxed environment to host an application. This is the most common use case.

As a black box for transforming data. Set up an environment, take input, transform it, and output.

As a programming environment. VSCode has some [good support](https://code.visualstudio.com/docs/remote/containers) for developing inside a container already.

## Daily use

Get in the habit of using a disposable container whenever possible. Why go through all the trouble of writing a Dockerfile when all you want to do is use a piece of software once, and then throw it away. Spin up a tiny container with a decent package manager (Alpine Linux!), mount a volume to write to, install your software, and start working! [This post](https://news.ycombinator.com/item?id=23275315) has a script to drop you into a containerised environment for your current directory, and it takes care of the messy permissioning issues that occur when you touch files inside containers.

# See also
[[Docker]]