
Table of Contents
=================

   * [Docker](#docker)
      * [Useful commands](#useful-commands)
   * [Exploring a docker image's filesystem](#exploring-a-docker-images-filesystem)
   * [Building a Docker image from a Git repository](#building-a-docker-image-from-a-git-repository)
   * [Docker and raspberry pi](#docker-and-raspberry-pi)
   * [Interacting with containers launched via AWS Fargate](#interacting-with-containers-launched-via-aws-fargate)
   * [Best practices](#best-practices)
      * [Spin up a disposable Alpine Linux container whenever you want to do anything](#spin-up-a-disposable-alpine-linux-container-whenever-you-want-to-do-anything)
   * [dockerhub](#dockerhub)
      * [autobuilds - use dockerhub's infrastructure to build your dockerfiles](#autobuilds---use-dockerhubs-infrastructure-to-build-your-dockerfiles)

Created by [gh-md-toc](https://github.com/ekalinin/github-markdown-toc)


# Docker

Here lies useful info on using Docker.

## Useful commands

Sometimes you just want to chuck everything away. There is a command for that...
prune.

WARNING! This will remove:
    - all stopped containers
    - all networks not used by at least one container
    - all dangling images
    - all dangling build cache
```
docker system prune
```

# Exploring a docker image's filesystem

pull the image.

you can now use `docker export` or `docker save` (look up docs)

then:
`docker export <IMAGE> <IMAGE>.tar`

the tar will be in many layers, not great

"Unfortunately, these tarballs are really only useful to Docker. However, there
is a tool called “undocker” (https://github.com/larsks/undocker/) which can
extract a useful filesystem from these images. See here for a writeup from the
author: http://blog.oddbit.com/2015/02/13/unpacking-docker-images/"

https://github.com/larsks/undocker/ works great, I tried it

# Building a Docker image from a Git repository

Handy to know:

https://docs.docker.com/engine/reference/commandline/build/#git-repositories

# Docker and raspberry pi

A recent article from the Docker blog on installing it:

https://www.docker.com/blog/happy-pi-day-docker-raspberry-pi/

tags: docker, raspberry, pi

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

# dockerhub

## autobuilds - use dockerhub's infrastructure to build your dockerfiles

After hearing about this feature, I just had to give it a go!

Here's my current deployment pipeline:

Codecommit -> CodePipeline -> Push app to Github repo -> Put app to S3 bucket

As soon as Dockerhub detects a change in a connected repo, it will use ITS OWN
INFRASTRUCTURE to do the builds. This is a pretty cool feature - let them 
do all the overhead of building images, and let me pull the final image.

Proof: 
![Autobuilt image running on EC2](https://aaronpkelly.github.io/posts/resources/docker_dockerhub_autoBuilds.png)

tags: docker, dockerhub