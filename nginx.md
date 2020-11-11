the container will keep exiting of you don't turn off the daemon

AND
the command to turn off the daemon is a bit weird (https://hub.docker.com/_/nginx/):

```
CMD [nginx-debug, '-g', 'daemon off;']
```

You can also set this via an env var I think

# hosting static content

i really struggled with this!

in the official dockerhub container

add `autoindex on;` to the `/` location in `/etc/nginx/conf.d/default.conf`:

```
    location / {
        root   /usr/share/nginx/html;
        index  index.html index.htm;
		autoindex on;
    }

```


then, create a directory at the root location,  `/usr/share/nginx/html/videos`

restart the nginx service inside the container: `nginx service restart`

you can now go to the url, but make sure there's a forward slash at the end: http://95.179.158.61:8090/videos/

then, upload content using sftp