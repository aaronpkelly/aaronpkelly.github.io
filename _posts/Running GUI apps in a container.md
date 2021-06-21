---
title: Running GUI apps in a container
description: How to containerise and run GUI applications, such as Chrome, inside a container
date: 2020-03-22
tags:
  - containers
  - docker
---

# Running GUI apps in a container

## Chrome

Is it possible to run Chrome in a container? Yes it is!

My original inspiration comes this [Dockerfile](https://github.com/jessfraz/dockerfiles/blob/master/chrome/stable/Dockerfile), 
via Jess's [blog](https://blog.jessfraz.com/post/docker-containers-on-the-desktop/).

I have slimmed down the docker command that Jess uses, to something
that just gives me just a basic browser:

```
docker run \
    --name chrome \
    --privileged \
    --rm \
    -e DISPLAY \
    -it \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    jess/chrome
```

Here's the result:

![chrome](/assets/containers_chrome.png)

## Troubleshooting

If you are having trouble getting the container started, it may be due to a lot
of factors, but the most likely cause is the run command you are using. The
command I use above works well for me on Linux, but it is a very cut-down
example. You should try running the command that Jess suggests in her
Dockerfile, and see if that improves thing for you.

### No protocol specified

The error:
```
No protocol specified
[1:1:0322/125427.199734:ERROR:browser_main_loop.cc(1512)] Unable to open X display.
```

To fix this, run the following command in your shell:

```
xhost +
```

### Failed to move to new namespace

The error:
```
Failed to move to new namespace: PID namespaces supported, Network namespace supported, but failed: errno = Operation not permitted
```

Make sure you are passing in the `--privileged` option

# see also
[Docker and XWindows](Docker%20and%20XWindows.md)