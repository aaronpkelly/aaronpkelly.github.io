
This is an [incredible tool](https://docs.docker.com/compose/) that greatly simplifies the process of working with containers. No longer do you have to remember som arcane serious of `docker run` commands, you can just define exactly how you want your docker containers to behave, how environment variables are set, how volumes are mapped... and put it all in one file.

Some cool links in this space:

- https://composerize.com/: turn run commands into docker-compose files

# wait for it
`wait-for-it.sh` is a pure bash script that will wait on the availability of a host and TCP port. It is useful for synchronizing the spin-up of interdependent services, such as linked docker containers. Since it is a pure bash script, it does not have any external dependencies.

https://github.com/vishnubob/wait-for-it

# aws ecs

docker-compose has _integrated_ support for deploying to AWS ECS: https://www.docker.com/blog/docker-compose-for-amazon-ecs-now-available/