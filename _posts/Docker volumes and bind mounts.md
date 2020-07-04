# Docker volumes and bind mounts

Oh man this can get tricky.

Read the entire _storage_ section here and make sure you're as familiar with it as possible: https://docs.docker.com/storage/

### REMEMBER: binds mounts from HOST->CONTAINER will overlay(but not overwrite) the folder in the container

I constantly forget this. When I am inside the container, my folder is empty. It's because of how bind mounts work.

From https://docs.docker.com/storage/:

    If you mount a bind mount or non-empty volume into a directory in the container in which some files or directories exist, these files or directories are obscured by the mount, just as if you saved files into /mnt on a Linux host and then mounted a USB drive into /mnt. The contents of /mnt would be obscured by the contents of the USB drive until the USB drive were unmounted. The obscured files are not removed or altered, but are not accessible while the bind mount or volume is mounted.

## Binding a folder from CONTAINER->HOST

Here's what I want to do:

- build docker image with files inside /app
- then, when running a container, I want a docker VOLUME to be mounted to the /app folder
- then, I want to be able to mount that volume back to my HOST system, so I can view what the container is writing AS IT HAPPENS on my host system
- both the CONTAINER and the HOST can modify these files AT THE SAME TIME

Just to check... how does this volume magic work again? From https://docs.docker.com/storage/:

    If you mount an empty volume into a directory in the container in which files or directories exist, these files or directories are propagated (copied) into the volume. Similarly, if you start a container and specify a volume which does not already exist, an empty volume is created for you. This is a good way to pre-populate data that another container needs.

Now, the trick is bind mounting the docker volume back to the host system. These guys figured it out using docker run commands:

- https://stackoverflow.com/questions/47664107/docker-mount-to-folder-overriding-content

- https://cravencode.com/post/docker/create-named-docker-bind-mount/

But you can also use docker-compose to do it, which is what I prefer:

```
services:
    webapp:
        build: .
        networks:
        - internal
        ports:
        - "8080:8080"
        extra_hosts:
        - "iedev434:192.168.127.225"
        volumes:
        - lfg887webapp:/usr/local/tomcat/webapps

volumes:
  lfg887webapp:
    driver_opts:
      device: "/c/opt/docker/lfg/8.8.7/exposer/webapps"
      type: "none"
      o: "bind"
```
