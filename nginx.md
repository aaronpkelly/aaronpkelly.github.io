the container will keep exiting of you don't turn off the daemon

AND
the command to turn off the daemon is a bit weird (https://hub.docker.com/_/nginx/):

```
CMD [nginx-debug, '-g', 'daemon off;']
```

You can also set this via an env var I think