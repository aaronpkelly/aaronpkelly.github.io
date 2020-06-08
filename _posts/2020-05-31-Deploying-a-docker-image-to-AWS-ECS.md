---
title: Deploying a docker image to AWS ECS 
description: Deploying a docker image to AWS ECS 
date: 2020-05-31
tags:
    - aws
	- ecs
	- docker
---

# Deploying a docker image to AWS ECS

I've always wondered how long it would take me to go from picking a Dockerfile,
to having it deployed and working some cloud infrastructure.

I heard about a really interesing tool on
[ycombinator](https://news.ycombinator.com/) called
[Huginn](https://hub.docker.com/r/huginn/huginn), and I was keen to find out
what were the least amount I steps needed to go from pulling the Docker image,
to having it deployed.

For those of you that can't wait:
- if you know what you're doing, it takes about 10 minutes
- if you're following this guide, it's probably going to take an hour or longer

These estimates don't include troubleshooting items like:
- container startup issues
- connectivity issues
- configuration issues with the application itself

I always seem to run into some issues when deploying an image for the first
time.

So on average it won't take too long -  but only if you're familiar with the
infrastructure you're deploying onto. In my case, it's Amazon Elastic Container
Service (ECS), and I've deployed there before.

# Reading the installation instructions

In the case of Huginn, the Dockerfile was the recommended installation pathway,
which was great, because the normal installation instructions seemed a bit
complicated. Another reason I love Docker!

# Creating a repository on ECR

TODO

# Pushing a pre-built image from https://hub.docker.com/ vs building my own

It is possible to check out the git repo and build and push the docker image.
I can even use an EC2 instance/Cloud9 if I don't want to use my own hardware.

Improving on this, I can skip the git checkout stage, and just build the image
using the pull command from docker hub, and then immediately push the built
image to ECR.

I don't think it's possible to move image from one registry to
another without pulling the image first. Once built, it can be tagged and
pushed to the new registry.

# ecs

## security groups

It's not enough to configure your port mapping for your container, you need to
make sure traffic can reach your port in the first place. Your VPC's security
groups contain settings for this.

## creating a cluster

## creation a service (docker compose)

## creating a task (container)

### environment variables from SSSM

tags: aws, ecr, ecs, huginn, docker