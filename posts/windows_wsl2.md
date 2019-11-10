# Windows Subsystem for Linux (WSL/WSL2)

I've been a while putting it off, but I decided I'd finally pull the finger out
and try Windows Subsytem for Linux (WSL).

The installation instructions (https://docs.microsoft.com/en-us/windows/wsl/install-win10)
said that I need to enter the following in a Powershell opened as administrator:
```
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
```

I didn't need to restart my computer, which was great!

# Downloading a Linux distro
There's three ways to get a distro:
Download and install from the Microsoft Store
Download and install from the Command-Line/Script
Download and manually unpack and install

Microsoft offer the following distros via their Store app:
Ubuntu 16.04 LTS
Ubuntu 18.04 LTS
OpenSUSE Leap 15
OpenSUSE Leap 42
SUSE Linux Enterprise Server 12
SUSE Linux Enterprise Server 15
Kali Linux
Debian GNU/Linux
Fedora Remix for WSL
Pengwin
Pengwin Enterprise
Alpine WSL

I couldn't find Alpine listed as a distro available to download from the
command-line, so I gave in and attempted and using their store.

Already I didn't like that the app is listed as having a "free-trial". Do MS
label all free software on their Store platform as free trial, because of course
there must eventually be a version that someone will charge you for? It kind of
shows their approach to softwre and it grinds my gears.

The Alpine WSL download says in the description that "Windows S mode currently
*NOT* supported.". I don't know what S Mode is, but I found out:
```
Windows 10 in S Mode is a more limited, locked-down Windows operating system.
In S Mode, you can only install apps from the Store, and you can only browse
the web with Microsoft Edge
```
Anyway, the store app seemed to install fine:
![gif](https://aaronpkelly.github.io/posts/resources/windows_wsl_alpine.gif)

However I wasn't able to sudo or change to the root user account.

After a bit of digging, I found out that you can set the root user's account
using the wsl.exe tool. From an admin windows CMD shell I ran this:
```
C:\WINDOWS\system32>wsl.exe --distribution Alpine --user root
DESKTOP-R07OBQT:/mnt/c/Windows/System32# passwd
New password:
Retype new password:
passwd: password updated successfully
```

After I got root, I tried to install Docker and run the hello-world image.
It didn't work, it complained that the docker daemon wasn't running. I didn't
think it would work out of the box, but I was kind of hoping.

While reading about WSL a bit more on wikipedia
(https://en.wikipedia.org/wiki/Windows_Subsystem_for_Linux), I found out that
there's actually WSL2 available for Windows 10 users that are on build `18917`
and higher, and apparently it features a real kernel... oh my! This gives a
huge benefit in that Docker can be run natively - this is great, but it's a
shame that the first WSL doesn't support it, and you need to jump through all
these extra hoops.

Anyway, to get access to these builds, you need to be a Windows Insider user
on the "Fast track". I'm not on this fast track, so I set it in
_Settings -> Windows Insider Program_, and set it there. It wanted me to
restart, so I did. I checked my build version using `ver`, but I still was on
an older build. It was only when I went back to _Settings -> Windows Insider
Program_, that I saw this message:
```
Note: It will take some time to receive a build after changing your settings
```

So, I guess I'll have to wait a while until I can follow this guide:
https://docs.microsoft.com/en-us/windows/wsl/wsl2-install

# After the long wait...

So it's been a number of weeks and many Windows updates later, and I'm finally
on a build that supports WSL2 - `19018`! You wouldn't want to be in a hurry...
there's no indication when your machine will receive the updates required.

Anyway, I immediately went back to the doc I linked in my last section, and ran
these commands successfully:
```
PS C:\WINDOWS\system32> Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
Path          :
Online        : True
RestartNeeded : False

PS C:\WINDOWS\system32> Enable-WindowsOptionalFeature -Online -FeatureName VirtualMachinePlatform
Path          :
Online        : True
RestartNeeded : False
```

I also wanted to make sure that all future Linux installations would use WSL2:
```
PS C:\WINDOWS\system32> wsl --set-default-version 2
For information on key differences with WSL 2 please visit https://aka.ms/wsl2
```

Checking that I still had Alpine installed...
```
wsl -l
```

I then tried converting it to "version 2":
```
wsl --set-version alpine 2
The requested operation could not be completed due to a virtual disk system limitation. Virtual hard disk files must be uncompressed and unencrypted and must not be sparse.
```

Oh dear. This is where it started going pear-shaped.

I uninstalled alpine, and tried to reinstall it from the store. I then launched
the Alpine app, and a window appeared with installation output:
```
Temporary directory: C:\Users\aaron\AppData\Local\Temp\wsl_Alpine_setup
Downloading   : http://dl-cdn.alpinelinux.org/alpine/v3.10/releases/x86_64/alpine-minirootfs-3.10.2-x86_64.tar.gz
To local file : install.tar.gz
The current working directory is: C:\Users\aaron\AppData\Local\Temp\wsl_Alpine_setup
File successfully deleted
Mime type available
Begin download
Cache filename available
100% [====================]
End download
Downloaded OK
Hash of file install.tar.gz is: 869b1f491d04b712892a4232b2afc24998f05eae4fb114fc6e44f4b1ab67f80c

Verifying Hash: OK
Installing, this may take a few minutes...
WslRegisterDistribution failed with error: 0xc03a001a
WslRegisterDistribution failed
Error: 0xc03a001a The requested operation could not be completed due to a virtual disk system limitation.  Virtual hard disk files must be uncompressed and unencrypted and must not be sparse.

Press any key to continue...
```

Super gross. The WLS2 article does have a troubleshooting section down the
bottom though, which says:
```
The requested operation could not be completed due to a virtual disk system limitation. Virtual hard disk files must be uncompressed and unencrypted and must not be sparse.

Please check WSL Github thread #4103 where this issue is being tracked for updated information.
```

Over on that thread https://github.com/microsoft/WSL/issues/4103, there was this
comment:
```
Thanks, the workaround of manually disabling compression on %localappdata%\Packages\CanonicalGroupLimited.UbuntuonWindows_79rhkp1fndgsc worked for me. My guess is that the compression was enabled by the update that started doing that automatically a while ago to free up space for more updates (except from my experience it never actually decompresses them afterwards, unlike what the official website says)
```

That was a good idea, so I went to the directory:
```
cd %localappdata%\Packages
```

And tried to find a folder that had 'Alpine' inside of it. There was one called
'36828agowa338.AlpineWSL_my43bytk1c4nr'.

- I right clicked the folder -> Properties
- on the General tab, clicked the _Advanced_ button
- in the Compress or Encrypt attributes section, unticked _Compress contents
to save disk space_
- you should untick _Encrypt contents to secure data_ if that is ticked for you

After that, I tried to relaunch the Alpine app from the store. What a
difference:
```
Verifying Hash: OK
Installing, this may take a few minutes...
Executing bugfixing command: /bin/chmod 755 /
Executing bugfixing command: /sbin/apk --no-cache add shadow
fetch http://dl-cdn.alpinelinux.org/alpine/v3.10/main/x86_64/APKINDEX.tar.gz
fetch http://dl-cdn.alpinelinux.org/alpine/v3.10/community/x86_64/APKINDEX.tar.gz
(1/2) Installing linux-pam (1.3.0-r1)
(2/2) Installing shadow (4.6-r2)
Executing busybox-1.30.1-r2.trigger
OK: 8 MiB in 16 packages
Executing bugfixing command: /bin/sed -i 's/^export PATH/#export PATH/' /etc/profile
Please create a default UNIX user account. The username does not need to match your Windows username.
For more information visit: https://aka.ms/wslusers
Enter new UNIX username: aaron
Installation successful!
DESKTOP-R07OBQT:~$

```

Poweshell also confirms I'm on Alpine version 2:
```
PS C:\WINDOWS\system32> wsl --list --verbose
  NAME      STATE           VERSION
* Alpine    Stopped         2
```

Hurrah! Again, I can't do much as my current user - I needed to become root to
do all the fun stuff, so from powershell I ran this command again:
```
PS C:\WINDOWS\system32> wsl.exe --distribution Alpine --user root
DESKTOP-R07OBQT:/mnt/c/WINDOWS/system32# passwd
New password:
Retype new password:
passwd: password updated successfully
DESKTOP-R07OBQT:/mnt/c/WINDOWS/system32# exit
PS C:\WINDOWS\system32>
```

After launching Alpine again from the store, I was able to change into the root
account and update and install docker:
```
DESKTOP-R07OBQT:~$ su -
Password:
DESKTOP-R07OBQT:~# ls
DESKTOP-R07OBQT:~# apk update
fetch http://dl-cdn.alpinelinux.org/alpine/v3.10/main/x86_64/APKINDEX.tar.gz
fetch http://dl-cdn.alpinelinux.org/alpine/v3.10/community/x86_64/APKINDEX.tar.gz
v3.10.3-19-g7f993019c4 [http://dl-cdn.alpinelinux.org/alpine/v3.10/main]
v3.10.3-13-g8068beb776 [http://dl-cdn.alpinelinux.org/alpine/v3.10/community]
OK: 10340 distinct packages available
DESKTOP-R07OBQT:~# apk add docker
(1/12) Installing ca-certificates (20190108-r0)
(2/12) Installing libseccomp (2.4.1-r0)
(3/12) Installing runc (1.0.0_rc8-r0)
(4/12) Installing containerd (1.2.9-r0)
(5/12) Installing libmnl (1.0.4-r0)
(6/12) Installing libnftnl-libs (1.1.3-r0)
(7/12) Installing iptables (1.8.3-r0)
(8/12) Installing tini-static (0.18.0-r0)
(9/12) Installing device-mapper-libs (2.02.184-r0)
(10/12) Installing docker-engine (18.09.8-r0)
(11/12) Installing docker-cli (18.09.8-r0)
(12/12) Installing docker (18.09.8-r0)
Executing docker-18.09.8-r0.pre-install
Executing busybox-1.30.1-r2.trigger
Executing ca-certificates-20190108-r0.trigger
OK: 280 MiB in 28 packages
DESKTOP-R07OBQT:~# docker

Usage:  docker [OPTIONS] COMMAND

A self-sufficient runtime for containers

Options:
      --config string      Location of client config files (default "/root/.docker")
  -D, --debug              Enable debug mode
  -H, --host list          Daemon socket(s) to connect to
  -l, --log-level string   Set the logging level ("debug"|"info"|"warn"|"error"|"fatal") (default "info")
      --tls                Use TLS; implied by --tlsverify
      --tlscacert string   Trust certs signed only by this CA (default "/root/.docker/ca.pem")
      --tlscert string     Path to TLS certificate file (default "/root/.docker/cert.pem")
      --tlskey string      Path to TLS key file (default "/root/.docker/key.pem")
      --tlsverify          Use TLS and verify the remote
  -v, --version            Print version information and quit

Management Commands:
  builder     Manage builds
  config      Manage Docker configs
  container   Manage containers
  engine      Manage the docker engine
  image       Manage images
  network     Manage networks
  node        Manage Swarm nodes
  plugin      Manage plugins
  secret      Manage Docker secrets
  service     Manage services
  stack       Manage Docker stacks
  swarm       Manage Swarm
  system      Manage Docker
  trust       Manage trust on Docker images
  volume      Manage volumes

Commands:
  attach      Attach local standard input, output, and error streams to a running container
  build       Build an image from a Dockerfile
  commit      Create a new image from a container's changes
  cp          Copy files/folders between a container and the local filesystem
  create      Create a new container
  deploy      Deploy a new stack or update an existing stack
  diff        Inspect changes to files or directories on a container's filesystem
  events      Get real time events from the server
  exec        Run a command in a running container
  export      Export a container's filesystem as a tar archive
  history     Show the history of an image
  images      List images
  import      Import the contents from a tarball to create a filesystem image
  info        Display system-wide information
  inspect     Return low-level information on Docker objects
  kill        Kill one or more running containers
  load        Load an image from a tar archive or STDIN
  login       Log in to a Docker registry
  logout      Log out from a Docker registry
  logs        Fetch the logs of a container
  pause       Pause all processes within one or more containers
  port        List port mappings or a specific mapping for the container
  ps          List containers
  pull        Pull an image or a repository from a registry
  push        Push an image or a repository to a registry
  rename      Rename a container
  restart     Restart one or more containers
  rm          Remove one or more containers
  rmi         Remove one or more images
  run         Run a command in a new container
  save        Save one or more images to a tar archive (streamed to STDOUT by default)
  search      Search the Docker Hub for images
  start       Start one or more stopped containers
  stats       Display a live stream of container(s) resource usage statistics
  stop        Stop one or more running containers
  tag         Create a tag TARGET_IMAGE that refers to SOURCE_IMAGE
  top         Display the running processes of a container
  unpause     Unpause all processes within one or more containers
  update      Update configuration of one or more containers
  version     Show the Docker version information
  wait        Block until one or more containers stop, then print their exit codes

Run 'docker COMMAND --help' for more information on a command.
DESKTOP-R07OBQT:~#
```

I then started the docker daemon as a background process:
```
DESKTOP-R07OBQT:~# dockerd &
DESKTOP-R07OBQT:~# INFO[2019-11-09T10:39:43.797729800Z] libcontainerd: started new containerd process  pid=159
INFO[2019-11-09T10:39:43.797822100Z] parsed scheme: "unix"                         module=grpc
INFO[2019-11-09T10:39:43.797832000Z] scheme "unix" not registered, fallback to default scheme  module=grpc
INFO[2019-11-09T10:39:43.797868800Z] ccResolverWrapper: sending new addresses to cc: [{unix:///var/run/docker/containerd/containerd.sock 0  <nil>}]  module=grpc
INFO[2019-11-09T10:39:43.797878000Z] ClientConn switching balancer to "pick_first"  module=grpc
INFO[2019-11-09T10:39:43.797944100Z] pickfirstBalancer: HandleSubConnStateChange: 0xc000774f30, CONNECTING  module=grpc
INFO[2019-11-09T10:39:43.822021000Z] starting containerd                           revision=d50db0a42053864a270f648048f9a8b4f24eced3 version=v1.2.9
INFO[2019-11-09T10:39:43.822393000Z] loading plugin "io.containerd.content.v1.content"...  type=io.containerd.content.v1
INFO[2019-11-09T10:39:43.822441400Z] loading plugin "io.containerd.snapshotter.v1.btrfs"...  type=io.containerd.snapshotter.v1
WARN[2019-11-09T10:39:43.822630400Z] failed to load plugin io.containerd.snapshotter.v1.btrfs  error="path /var/lib/docker/containerd/daemon/io.containerd.snapshotter.v1.btrfs must be a btrfs filesystem to be used with the btrfs snapshotter"
INFO[2019-11-09T10:39:43.822674000Z] loading plugin "io.containerd.snapshotter.v1.aufs"...  type=io.containerd.snapshotter.v1
WARN[2019-11-09T10:39:43.823387100Z] failed to load plugin io.containerd.snapshotter.v1.aufs  error="modprobe aufs failed: "modprobe: can't change directory to '/lib/modules': No such file or directory\n": exit status 1"
INFO[2019-11-09T10:39:43.823421700Z] loading plugin "io.containerd.snapshotter.v1.native"...  type=io.containerd.snapshotter.v1
INFO[2019-11-09T10:39:43.823514600Z] loading plugin "io.containerd.snapshotter.v1.overlayfs"...  type=io.containerd.snapshotter.v1
INFO[2019-11-09T10:39:43.823644900Z] loading plugin "io.containerd.snapshotter.v1.zfs"...  type=io.containerd.snapshotter.v1
INFO[2019-11-09T10:39:43.823900000Z] skip loading plugin "io.containerd.snapshotter.v1.zfs"...  type=io.containerd.snapshotter.v1
INFO[2019-11-09T10:39:43.823940700Z] loading plugin "io.containerd.metadata.v1.bolt"...  type=io.containerd.metadata.v1
WARN[2019-11-09T10:39:43.824019400Z] could not use snapshotter zfs in metadata plugin  error="path /var/lib/docker/containerd/daemon/io.containerd.snapshotter.v1.zfs must be a zfs filesystem to be used with the zfs snapshotter: skip plugin"
WARN[2019-11-09T10:39:43.824068300Z] could not use snapshotter btrfs in metadata plugin  error="path /var/lib/docker/containerd/daemon/io.containerd.snapshotter.v1.btrfs must be a btrfs filesystem to be used with the btrfs snapshotter"
WARN[2019-11-09T10:39:43.824100100Z] could not use snapshotter aufs in metadata plugin  error="modprobe aufs failed: "modprobe: can't change directory to '/lib/modules': No such file or directory\n": exit status 1"
INFO[2019-11-09T10:39:43.824255400Z] loading plugin "io.containerd.differ.v1.walking"...  type=io.containerd.differ.v1
INFO[2019-11-09T10:39:43.824294100Z] loading plugin "io.containerd.gc.v1.scheduler"...  type=io.containerd.gc.v1
INFO[2019-11-09T10:39:43.824384900Z] loading plugin "io.containerd.service.v1.containers-service"...  type=io.containerd.service.v1
INFO[2019-11-09T10:39:43.824422700Z] loading plugin "io.containerd.service.v1.content-service"...  type=io.containerd.service.v1
INFO[2019-11-09T10:39:43.824458500Z] loading plugin "io.containerd.service.v1.diff-service"...  type=io.containerd.service.v1
INFO[2019-11-09T10:39:43.824498200Z] loading plugin "io.containerd.service.v1.images-service"...  type=io.containerd.service.v1
INFO[2019-11-09T10:39:43.824564000Z] loading plugin "io.containerd.service.v1.leases-service"...  type=io.containerd.service.v1
INFO[2019-11-09T10:39:43.824607300Z] loading plugin "io.containerd.service.v1.namespaces-service"...  type=io.containerd.service.v1
INFO[2019-11-09T10:39:43.824658200Z] loading plugin "io.containerd.service.v1.snapshots-service"...  type=io.containerd.service.v1
INFO[2019-11-09T10:39:43.824680200Z] loading plugin "io.containerd.runtime.v1.linux"...  type=io.containerd.runtime.v1
INFO[2019-11-09T10:39:43.824835900Z] loading plugin "io.containerd.runtime.v2.task"...  type=io.containerd.runtime.v2
INFO[2019-11-09T10:39:43.824909800Z] loading plugin "io.containerd.monitor.v1.cgroups"...  type=io.containerd.monitor.v1
INFO[2019-11-09T10:39:43.825455700Z] loading plugin "io.containerd.service.v1.tasks-service"...  type=io.containerd.service.v1
INFO[2019-11-09T10:39:43.826068700Z] loading plugin "io.containerd.internal.v1.restart"...  type=io.containerd.internal.v1
INFO[2019-11-09T10:39:43.826339300Z] loading plugin "io.containerd.grpc.v1.containers"...  type=io.containerd.grpc.v1
INFO[2019-11-09T10:39:43.826409900Z] loading plugin "io.containerd.grpc.v1.content"...  type=io.containerd.grpc.v1
INFO[2019-11-09T10:39:43.826497500Z] loading plugin "io.containerd.grpc.v1.diff"...  type=io.containerd.grpc.v1
INFO[2019-11-09T10:39:43.826559700Z] loading plugin "io.containerd.grpc.v1.events"...  type=io.containerd.grpc.v1
INFO[2019-11-09T10:39:43.826851700Z] loading plugin "io.containerd.grpc.v1.healthcheck"...  type=io.containerd.grpc.v1
INFO[2019-11-09T10:39:43.826929900Z] loading plugin "io.containerd.grpc.v1.images"...  type=io.containerd.grpc.v1
INFO[2019-11-09T10:39:43.826971900Z] loading plugin "io.containerd.grpc.v1.leases"...  type=io.containerd.grpc.v1
INFO[2019-11-09T10:39:43.827008000Z] loading plugin "io.containerd.grpc.v1.namespaces"...  type=io.containerd.grpc.v1
INFO[2019-11-09T10:39:43.827024700Z] loading plugin "io.containerd.internal.v1.opt"...  type=io.containerd.internal.v1
INFO[2019-11-09T10:39:43.827060100Z] loading plugin "io.containerd.grpc.v1.snapshots"...  type=io.containerd.grpc.v1
INFO[2019-11-09T10:39:43.827361100Z] loading plugin "io.containerd.grpc.v1.tasks"...  type=io.containerd.grpc.v1
INFO[2019-11-09T10:39:43.827378400Z] loading plugin "io.containerd.grpc.v1.version"...  type=io.containerd.grpc.v1
INFO[2019-11-09T10:39:43.827393300Z] loading plugin "io.containerd.grpc.v1.introspection"...  type=io.containerd.grpc.v1
INFO[2019-11-09T10:39:43.827821500Z] serving...                                    address="/var/run/docker/containerd/containerd-debug.sock"
INFO[2019-11-09T10:39:43.827927600Z] serving...                                    address="/var/run/docker/containerd/containerd.sock"
INFO[2019-11-09T10:39:43.827975500Z] containerd successfully booted in 0.006626s
INFO[2019-11-09T10:39:43.829197400Z] pickfirstBalancer: HandleSubConnStateChange: 0xc000774f30, READY  module=grpc
INFO[2019-11-09T10:39:43.835481400Z] parsed scheme: "unix"                         module=grpc
INFO[2019-11-09T10:39:43.835525800Z] scheme "unix" not registered, fallback to default scheme  module=grpc
INFO[2019-11-09T10:39:43.835584700Z] parsed scheme: "unix"                         module=grpc
INFO[2019-11-09T10:39:43.835601000Z] scheme "unix" not registered, fallback to default scheme  module=grpc
INFO[2019-11-09T10:39:43.835730700Z] ccResolverWrapper: sending new addresses to cc: [{unix:///var/run/docker/containerd/containerd.sock 0  <nil>}]  module=grpc
INFO[2019-11-09T10:39:43.835750700Z] ClientConn switching balancer to "pick_first"  module=grpc
INFO[2019-11-09T10:39:43.835807900Z] pickfirstBalancer: HandleSubConnStateChange: 0xc00089d2d0, CONNECTING  module=grpc
INFO[2019-11-09T10:39:43.835986000Z] pickfirstBalancer: HandleSubConnStateChange: 0xc00089d2d0, READY  module=grpc
INFO[2019-11-09T10:39:43.835986000Z] ccResolverWrapper: sending new addresses to cc: [{unix:///var/run/docker/containerd/containerd.sock 0  <nil>}]  module=grpc
INFO[2019-11-09T10:39:43.836058400Z] ClientConn switching balancer to "pick_first"  module=grpc
INFO[2019-11-09T10:39:43.836204700Z] pickfirstBalancer: HandleSubConnStateChange: 0xc000128650, CONNECTING  module=grpc
INFO[2019-11-09T10:39:43.836316400Z] pickfirstBalancer: HandleSubConnStateChange: 0xc000128650, READY  module=grpc
INFO[2019-11-09T10:39:43.838322000Z] [graphdriver] using prior storage driver: overlay2
INFO[2019-11-09T10:39:43.856529400Z] Graph migration to content-addressability took 0.00 seconds
WARN[2019-11-09T10:39:43.856805300Z] Your kernel does not support cgroup blkio weight
WARN[2019-11-09T10:39:43.856847500Z] Your kernel does not support cgroup blkio weight_device
WARN[2019-11-09T10:39:43.856883000Z] Your kernel does not support cgroup blkio throttle.read_bps_device
WARN[2019-11-09T10:39:43.856919200Z] Your kernel does not support cgroup blkio throttle.write_bps_device
WARN[2019-11-09T10:39:43.856958400Z] Your kernel does not support cgroup blkio throttle.read_iops_device
WARN[2019-11-09T10:39:43.856993300Z] Your kernel does not support cgroup blkio throttle.write_iops_device
INFO[2019-11-09T10:39:43.857924300Z] Loading containers: start.
WARN[2019-11-09T10:39:43.858832600Z] Running modprobe nf_nat failed with message: `modprobe: can't change directory to '/lib/modules': No such file or directory`, error: exit status 1
WARN[2019-11-09T10:39:43.859549000Z] Running modprobe xt_conntrack failed with message: `modprobe: can't change directory to '/lib/modules': No such file or directory`, error: exit status 1
INFO[2019-11-09T10:39:43.942222200Z] Default bridge (docker0) is assigned with an IP address 172.17.0.0/16. Daemon option --bip can be used to set a preferred IP address
INFO[2019-11-09T10:39:43.978396700Z] Loading containers: done.
INFO[2019-11-09T10:39:43.995284600Z] Docker daemon                                 commit=0dd43dd87fd530113bf44c9bba9ad8b20ce4637f graphdriver(s)=overlay2 version=18.09.8-ce
INFO[2019-11-09T10:39:43.995374300Z] Daemon has completed initialization
INFO[2019-11-09T10:39:44.004881700Z] API listen on /var/run/docker.sock
```

And finally, tried to run the docker _hello-world_ image:
```
DESKTOP-R07OBQT:~# docker run hello-world
Unable to find image 'hello-world:latest' locally
latest: Pulling from library/hello-world
1b930d010525: Pull complete
Digest: sha256:c3b4ada4687bbaa170745b3e4dd8ac3f194ca95b2d0518b417fb47e5879d9b5f
Status: Downloaded newer image for hello-world:latest
INFO[2019-11-09T10:39:51.875853600Z] shim containerd-shim started                  address="/containerd-shim/moby/b0aea71f983567c98343502b6209cbd60b6b2e62415e163e520e6b7c8631e242/shim.sock" debug=false pid=314

Hello from Docker!
This message shows that your installation appears to be working correctly.

To generate this message, Docker took the following steps:
 1. The Docker client contacted the Docker daemon.
 2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
    (amd64)
 3. The Docker daemon created a new container from that image which runs the
    executable that produces the output you are currently reading.
 4. The Docker daemon streamed that output to the Docker client, which sent it
    to your terminal.

To try something more ambitious, you can run an Ubuntu container with:
 $ docker run -it ubuntu bash

Share images, automate workflows, and more with a free Docker ID:
 https://hub.docker.com/

For more examples and ideas, visit:
 https://docs.docker.com/get-started/

DESKTOP-R07OBQT:~#
```

My journey has finally come to the end! With the WSL2 providing all my docker
needs, I was finally able to remove Docker Desktop from my machine.
