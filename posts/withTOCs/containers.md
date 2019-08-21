
Table of Contents
=================

   * [Interacting with containers launched via AWS Fargate](#interacting-with-containers-launched-via-aws-fargate)
   * [Best practices](#best-practices)
      * [Spin up a disposable Alpine Linux container whenever you want to do anything](#spin-up-a-disposable-alpine-linux-container-whenever-you-want-to-do-anything)

Created by [gh-md-toc](https://github.com/ekalinin/github-markdown-toc)
# Interacting with containers launched via AWS Fargate
TODO: I am trying to find the easiest way to do this:
- docker-compose.yml

# Best practices
## Spin up a disposable Alpine Linux container whenever you want to do anything
Think disposable.
Think of a container as a tool that takes input, transforms it, and outputs data.

You don't have to through all the trouble of writing Dockerfiles when all you want to do
is use a piece of software once, and then throw it away.
Spin up a tiny container with a decent package manager (Alpine Linux!), mount a volume
to write to, install your software, and start working!

`docker run --rm -it -v /home/user:/home/user alpine:edge /bin/ash`

That will drop you into a containerised environment where you're free to run wild, and do
whatever you want. Change the mount points to be whatever you want.
When you exit the container, the container is destroyed, but your output lives on your host machine.
