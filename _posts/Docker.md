---
title: Docker
description:
date: 2020-06-01
tags:
  - containers
  - docker
---

# Docker

Here lies a collection of useful tricks and tips I've found from working with Docker and containers in general for the last while.

## Docker compose

This is an [incredible tool](https://docs.docker.com/compose/) that greatly simplifies the process of working with containers. No longer do you have to remember som arcane serious of `docker run` commands, you can just define exactly how you want your docker containers to behave, how environment variables are set, how volumes are mapped... and put it all in one file.

Some cool links in this space:

- https://composerize.com/: turn run commands into docker-compose files

## Volumes and bind mounts

Oh man this can get tricky.

Read the entire _storage_ section here and make sure you're as familiar with it as possible: https://docs.docker.com/storage/

### REMEMBER: binds mounts from HOST->CONTAINER will overlay(but not overwrite) the folder in the container

I constantly forget this. When I am inside the container, my folder is empty. It's because of how bind mounts work.

From https://docs.docker.com/storage/:

    If you mount a bind mount or non-empty volume into a directory in the container in which some files or directories exist, these files or directories are obscured by the mount, just as if you saved files into /mnt on a Linux host and then mounted a USB drive into /mnt. The contents of /mnt would be obscured by the contents of the USB drive until the USB drive were unmounted. The obscured files are not removed or altered, but are not accessible while the bind mount or volume is mounted.

### Binding a folder from CONTAINER->HOST

Here's what I want to do:

- build docker image with files inside /app
- then, when running a container, I want a docker VOLUME to be mounted to the /app folder
- then, I want to be able to mount that volume back to my HOST system, so I can view what the container is writing AS IT HAPPENS on my host system
- both the CONTAINER and the HOST can modify these files AT THE SAME TIME

Just to check... how does this volume magic work again? From https://docs.docker.com/storage/:

    If you mount an empty volume into a directory in the container in which files or directories exist, these files or directories are propagated (copied) into the volume. Similarly, if you start a container and specify a volume which does not already exist, an empty volume is created for you. This is a good way to pre-populate data that another container needs.

Now, the trick is bind mounting the docker volume back to the host system. These guys figured it out using docker run commands:

- https://stackoverflow.com/questions/47664107/docker-mount-to-folder-overriding-content

- https://cravencode.com/post/docker/create-named-docker-bind-mount/

But you can also use docker-compose to do it, which is what I prefer:

```
services:
    webapp:
        build: .
        networks:
        - internal
        ports:
        - "8080:8080"
        extra_hosts:
        - "iedev434:192.168.127.225"
        volumes:
        - lfg887webapp:/usr/local/tomcat/webapps

volumes:
  lfg887webapp:
    driver_opts:
      device: "/c/opt/docker/lfg/8.8.7/exposer/webapps"
      type: "none"
      o: "bind"
```

## Throwing everything away

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

## Exploring a docker image's filesystem

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

## Building a Docker image from a Git repository

Handy to know:

https://docs.docker.com/engine/reference/commandline/build/#git-repositories

## Docker and raspberry pi

A recent article from the Docker blog on installing it:

https://www.docker.com/blog/happy-pi-day-docker-raspberry-pi/

tags: docker, raspberry, pi

## Interacting with containers launched via AWS Fargate
TODO: I am trying to find the easiest way to do this:
- docker-compose.yml

## dockerhub

### autobuilds - use dockerhub's infrastructure to build your dockerfiles

After hearing about this feature, I just had to give it a go!

Here's my current deployment pipeline:

Codecommit -> CodePipeline -> Push app to Github repo -> Put app to S3 bucket

As soon as Dockerhub detects a change in a connected repo, it will use ITS OWN
INFRASTRUCTURE to do the builds. This is a pretty cool feature - let them 
do all the overhead of building images, and let me pull the final image.

Proof: 
![Autobuilt image running on EC2](https://aaronpkelly.github.io/posts/resources/docker_dockerhub_autoBuilds.png)

# See also

https://labs.play-with-docker.com/ - an excellent free environment for running docker images. 4 hour lifetime