
Table of Contents
=================

Parsing local markdown file requires access to github API
Error: You exceeded the hourly limit. See: https://developer.github.com/v3/#rate-limiting
or place github auth token here: /c/Users/aaron/src/aaronpkelly.github.io/token.txt
# About this post
This deals with interestings thing I've learned and experienced using AWS
services so far.

I'm moving to AWS with a big backpack... I have about 80 Github repositories,
and previously my only interaction with AWS was running a Jenkins instance on
EC2.

I'm moving the whole show to AWS. I think the only repository I will end
up keeping is this one, in order to avail of the free hosted github.io
website.

# AWS Fargate
https://aws.amazon.com/fargate/
I like this service because there's very little to manage, you can just spin up
the scaffolding you need to host and run your containers.

## Interacting with containers launched via AWS Fargate
So... I like containers. I especially like being able to connect to them after
they're deployed somewhere. I had a really tough time trying to SSH to my mutt
container instance that AWS Fargate managed for me, but as it turns out,
Fargate doesn't support a SSH connection method. Some light duckduckgo'ing
showed me that it was going to be difficult/impossible to connect this way.

The only sanctioned way to ssh to a container that's managed by AWS is to make
sure that it's launched on an EC2 instance.

Which is a bit of a bummer, because launching a Fargate cluster is a lot less
complex than using EC2.

So I want to try some solutions...

### docker-compose.yml
UNTESTED.

This doesn't really allow me to issue commands interactively, I have to define
them upfront.

### Installing openssh and redirecting ssh port 22 -> 80
SUCCESS. I have a separate article that shows you have to do this, it should be
called aws_fargate_ssh.

### nginx
UNTESTED.
