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

# Testing
## Testing Dockerfile best practices
Conftest is a neat little tool which analyses configuration files for policy violations: https://www.conftest.dev/install/ (via [hn](https://news.ycombinator.com/item?id=24776771))

## Running unit tests before/after image built?
Build the image, then have an entrypoint that can either run your tests, or run your main program.

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