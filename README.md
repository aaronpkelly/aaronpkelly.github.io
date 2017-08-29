# tracking build progress
build messages will appear in the `settings` section of the github repo.

a site being built will say 'your site is ready to be published'
a site that is published will say `your site is published at $SITENAME`

## build messages
the majority of build errors will arrive via email.

other build errors will be in the `settings` section of the github repo

# serving the site from a docker container
## connecting to the container from a host browser
within the container, use one of these methods to show the IP address of the container:

`docker inspect [CONTAINER NAME]`
`ifconfig -a`
`ip addr show`

## serving on a custom hostname from within the container
sometimes the default hostname that jekyll serves on, `127.0.0.1`, cannot be
connected to from the host. it may be necessary to launch jekyll and bind it
to `0.0.0.0`:

```
bundle exec jekyll serve -H 0.0.0.0
```
## remap port
map port 4000 in the container to port 80 on the host.

```
docker run --rm -it -name website -p 80:4000 ...
```

`-p 80:4000` means map port `80` on my host to port `4000` in my container.
you should notice that your address bar pre-populates with the port of the
container as soon as your enter port 80, eg:

`172.17.0.3:80:4000`

the address bar will only show the docker containers port after that
