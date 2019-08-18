# The slow deathmarch toward AWS
I have about 80 Github repositories, and previously my only interaction with
AWS was running a Jenkins instance in EC2 to build them and push docker images
to https://hub.docker.com/.

Now... I'm moving the whole show to AWS. I think the only repository I will end
up keeping is this one, in order to avail of the free hosted @github.io
website.

# AWS ECR, ECS and the Fargate ssh connection sage
So... I like containers. I especially like being able to connect to them after
they're deployed somewhere. I had a really tough time trying to SSH to my mutt
container instance that AWS Fargate managed for me, but as it turns out,
Fargate doesn't support a SSH connection method. Some light duckduckgo'ing
showed me that it was going to be difficult/impossible to connect this way.

The only sanctioned way to ssh to a container that's managed by AWS is to make
sure that it's launched on an EC2 instance.

Which is a bit of a bummer, because launching a Fargate cluster is a lot less
complex than using EC2.
