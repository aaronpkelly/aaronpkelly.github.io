
Table of Contents
=================

   * [Github Pages](#github-pages)
      * [Tracking build progress](#tracking-build-progress)
      * [Build messages](#build-messages)
      * [Jekyll integration](#jekyll-integration)
         * [hacking a theme? don't use the layouts/default.html file!!!](#hacking-a-theme-dont-use-the-layoutsdefaulthtml-file)
      * [Serving the site from a docker container](#serving-the-site-from-a-docker-container)
         * [Connecting to the container from a host browser](#connecting-to-the-container-from-a-host-browser)
         * [Serving on a custom hostname from within the container](#serving-on-a-custom-hostname-from-within-the-container)
         * [Remap port](#remap-port)

Created by [gh-md-toc](https://github.com/ekalinin/github-markdown-toc)



# Github Pages
I use this service to build my static site. I think it's great.

I don't use the Jekyll integrations.

## Tracking build progress
Build messages will appear in the `settings` section of the github repo.

A site being built will say 'your site is ready to be published'.
A site that is published will say `your site is published at $SITENAME`.

## Build messages
the majority of build errors will arrive via email.

other build errors will be in the `settings` section of the github repo

## Jekyll integration
Some notes on my experiences using Github Pages + Jekyll below, I don't
know how useful they are now, since I don't use the Jekyll stuff anymore.

### hacking a theme? don't use the layouts/default.html file!!!
this is a hidden file used by github pages to apply your theme. if you want
to hack around with the theme, edit ANYTHING but this file

just reference the `default.html` file instead, using for example, a
`layouts/home.html` file:
```
---
layout: default
---
include {*% blah.html %} ...
```

## Serving the site from a docker container
These notes deal with running a Jekyll container locally.

### Connecting to the container from a host browser
within the container, use one of these methods to show the IP address of the container:

`docker inspect [CONTAINER NAME]`
`ifconfig -a`
`ip addr show`

### Serving on a custom hostname from within the container
sometimes the default hostname that jekyll serves on, `127.0.0.1`, cannot be
connected to from the host. it may be necessary to launch jekyll and bind it
to `0.0.0.0`:

```
bundle exec jekyll serve -H 0.0.0.0
```
### Remap port
map port 4000 in the container to port 80 on the host.

```
docker run --rm -it -name website -p 80:4000 ...
```

`-p 80:4000` means map port `80` on my host to port `4000` in my container.
you should notice that your address bar pre-populates with the port of the
container as soon as your enter port 80, eg:

`172.17.0.3:80:4000`

the address bar will only show the docker containers port after that

