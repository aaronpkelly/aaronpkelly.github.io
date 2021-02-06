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

# connecting to a remote docker daemon

I have docker running on some remote systems.

It's possible to connect to it remotely.

on Vultr i ran this:

```
sudo service docker stop
root@box:~/src/box_composer# sudo dockerd -H unix:///var/run/docker.sock -H tcp://0.0.0.0:2375 &
INFO[2021-01-16T14:42:12.287717301Z] Starting up                                  
WARN[2021-01-16T14:42:12.289177589Z] Binding to IP address without --tlsverify is insecure and gives root access on this machine to everyone who has access to your network.  host="tcp://0.0.0.0:2375"
WARN[2021-01-16T14:42:12.289341617Z] Binding to an IP address, even on localhost, can also give access to scripts run in a browser. Be safe out there!  host="tcp://0.0.0.0:2375"
WARN[2021-01-16T14:42:13.293294114Z] Binding to an IP address without --tlsverify is deprecated. Startup is intentionally being slowed down to show this message  host="tcp://0.0.0.0:2375"
WARN[2021-01-16T14:42:13.293803866Z] Please consider generating tls certificates with client validation to prevent exposing unauthenticated root access to your network  host="tcp://0.0.0.0:2375"
WARN[2021-01-16T14:42:13.293969089Z] You can override this by explicitly specifying '--tls=false' or '--tlsverify=false'  host="tcp://0.0.0.0:2375"
WARN[2021-01-16T14:42:13.294074583Z] Support for listening on TCP without authentication or explicit intent to run without authentication will be removed in the next release  host="tcp://0.0.0.0:2375"
```

I was then able to connect to it via IntelliJ by creating a new docker configuration, and connecting to the tcp socket `tcp://95.179.158.61:2375`. See here:

![](Pasted%20image%2020210116154410.png)

You should be able to run commands against the remote host using:

```
docker -H tcp://0.0.0.0:2375 ps
```

see https://docs.docker.com/engine/reference/commandline/dockerd/

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