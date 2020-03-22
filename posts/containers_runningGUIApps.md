
Table of Contents
=================

   * [Running GUI Apps in a Container](#running-gui-apps-in-a-container)
      * [Chrome](#chrome)
      * [Troubleshooting](#troubleshooting)
         * [No protocol specified](#no-protocol-specified)
         * [Failed to move to new namespace](#failed-to-move-to-new-namespace)

Created by [gh-md-toc](https://github.com/ekalinin/github-markdown-toc)


# Running GUI Apps in a Container

## Chrome

It is possible to run Chrome in a container!

My original inspiration comes from Jess's blog here: https://blog.jessfraz.com/post/docker-containers-on-the-desktop/

Which uses to a Dockerfile here: https://github.com/jessfraz/dockerfiles/blob/master/chrome/stable/Dockerfile

Here's the command that I personally run, it's very much a bare-bones command
when give me just a basic browser:

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

Here it is!:
![chrome](https://aaronpkelly.github.io/posts/resources/containers_chrome.png)

## Troubleshooting

The run command I give above is very cut-down. You may need to use a more
verbose run command, you should check out the command that Jess suggests in her
Dockerfile.

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