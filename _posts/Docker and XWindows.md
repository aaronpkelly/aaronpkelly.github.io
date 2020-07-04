---
title: Docker and XWindows
description:
date: 2020-06-01
tags:
  - containers
  - docker
categories:
  - development
---

Today I wanted to try an experiment...

On Windows 10, could I run a graphical program inside a docker container, and
have it display on a Windows X11 display server?

# A choice of XWindows systems
- mobaxterm's built-in XWindows
- Xming
- https://sourceforge.net/projects/vcxsrv/

# using docker running natively

Using this _Dockerfile_:
```
FROM ubuntu:14.04
RUN apt-get update && apt-get install -y firefox
CMD /usr/bin/firefox
```

I ran this command in git-bash to build it:
```
docker build -t firefox .
```

Once that was done, I determined what my ip address was:
```
$ ipconfig
...
Wireless LAN adapter Wi-Fi:
   Connection-specific DNS Suffix  . : home
   IPv6 Address. . . . . . . . . . . : 2a02:8084:20c2:c180:b1da:14dc:c0ab:9c54
   Temporary IPv6 Address. . . . . . : 2a02:8084:20c2:c180:ac93:d10e:bd81:1de4
   Link-local IPv6 Address . . . . . : fe80::b1da:14dc:c0ab:9c54%3
   IPv4 Address. . . . . . . . . . . : 192.168.0.17
```

Exported my display (Xming sets the display number to `0` as default):
```
export DISPLAY=192.168.160.1:0
```

Then I started my _Xming_ server inside git-bash:
```
/c/Program\ Files\ \(x86\)/Xming/Xming.exe -ac &
```

Then I attempted to run Firefox in a container:
```
docker run --rm -it --net=host -e DISPLAY=192.168.0.17:0 firefox
```

It worked! This was just a proof-of-concept to see if it could be done, but I'm
very happy I managed to get it to display.

# using docker running inside an Alpine WSL2

After setting up docker inside an alpine Alpine WSL2, I wanted to know if this
could connect to an XWindows server too! Turns out, it can... lets try running
the _fr3nd/xeyes_ image:

```
docker run --rm -ti -e DISPLAY=192.168.160.1:0 fr3nd/xeyes
```

![xeyes!](https://aaronpkelly.github.io/posts/resources/dockerAndXWindows_xeyes.png)

And something else I've wanted to do run in a container a while... Eclipse!
(psharkey/eclipse)

![Eclipse!](https://aaronpkelly.github.io/posts/resources/dockerAndXWindows_eclipse.gif)

More images of other programs running:
- [Gimp!](https://aaronpkelly.github.io/posts/resources/dockerAndXWindows_gimp.png) (jamesnetherton/gimp)
- [Libreoffice!](https://aaronpkelly.github.io/posts/resources/dockerAndXWindows_libreOffice.png) (woahbase/alpine-libreoffice:x86_64)
- [Firefox!](https://aaronpkelly.github.io/posts/resources/dockerAndXWindows_firefox.png) (jess/firefox)

# the future

- try VcXsrv instead of XMing (as it's not updated since 2013?)
- get eclipse working (why is it so difficult?!)

# sources

https://medium.com/better-programming/running-desktop-apps-in-docker-43a70a5265c4
https://rgrunber.wordpress.com/2016/01/26/eclipse-inside-a-docker-container/
https://github.com/handflucht/guiAppInDockerOnWindows
https://github.com/baudren/NoteOrganiser/wiki/Docker,-QML,-XServer-on-Windows
https://robscode.onl/docker-run-gui-app-in-linux-container-on-windows-host/

