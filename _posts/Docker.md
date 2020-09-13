# Docker
This post is intended as a jumping-off point to related articles. Docker-specific information will go here, but generic topics like [[Containers]] will have separate posts.

I think Docker is a great tool for working with container technology. I like it a lot.

# Docker images

## Building a Docker image from a Git repository

Handy to know:

https://docs.docker.com/engine/reference/commandline/build/#git-repositories

# Networking
Bind webapps inside a container to `0.0.0.0`. Don't bind to `127.0.0.1` or `localhost` - those addresses will  still point inside the container.

# Docker logs
Tailing the STDOUT of a docker container - yes we can!:

```
docker logs --follow <CONTAINER>
```

# Testing docker images
I don't know what the best methodolgy is. Maybe it's:
- build the image locally, then run the tests inside the container?

Seems better than getting your CI tool to run them, because you're going to have to define all the packages used inside your image etc.

 # See also
[[Containers]]

[[Dockerhub]]

[[Docker and XWindows]]

[[Docker compose]]

[[Docker Swarm and Raspberry Pi]]

[[Docker pruning and cleaning]]

[[Docker volumes and bind mounts]]

[[Exploring a docker image's filesystem]]

[[SSHing into an AWS Fargate container]]

[[Web development notes]]