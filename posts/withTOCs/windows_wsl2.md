
Table of Contents
=================

   * [Windows Subsystem for Linux (WSL/WSL2)](#windows-subsystem-for-linux-wslwsl2)
   * [Downloading a Linux distro](#downloading-a-linux-distro)
   * [WSL2 - I can finally use it](#wsl2---i-can-finally-use-it)
   * [Installing docker inside Alpine](#installing-docker-inside-alpine)
   * [Troubleshooting](#troubleshooting)
      * [Code: 0x80073D05](#code-0x80073d05)
   * [TODO/TRY](#todotry)

Created by [gh-md-toc](https://github.com/ekalinin/github-markdown-toc)



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

- Download and install from the Microsoft Store
- Download and install from the Command-Line/Script
- Download and manually unpack and install

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

# WSL2 - I can finally use it

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

# Installing docker inside Alpine

Run the following commands to get perfectly setup:

```
# switch to root user
$ su

# update alpine packages
$ apk update

# add the apline-sdk package to install sudo
$ apt add alpine-sdk

# add your user to the sudoers file in order to run sudo (e.g. append `aaron ALL=(ALL) ALL`)
$ visudo

# exit su, return to your user
$ exit

# install docker (and docker-compose!)
$ sudo apk add docker docker-compose

# add the current user to the docker group (so docker can be run without typing
# sudo all the time)
$ sudo addgroup aaron docker

# install openrc and start the docker service at boot
$ sudo apk add openrc
$ sudo rc-update add docker boot

# allow openrc to start the service inside our WSL2 instance
$ touch /run/openrc/softlevel

# start the service manually (you may need to restart your terminal)
$ sudo service docker start

# verify the docker service is running. it will run automatically from now on
$ sudo rc-status --all

# verify you can run a docker image
$ docker run --rm hello-world
```

My journey has finally come to the end! With the WSL2 providing all my docker
needs, I was finally able to remove Docker Desktop from my machine.

# Troubleshooting

## Code: 0x80073D05

This code can appear when attemping a reinstall of Alpine. Delete any leftover
alpine folders from the previous installation, e.g. _c:\Users\aaron\AppData\Local\Packages\36828agowa338.AlpineWSL_my43bytk1c4nr_

# TODO/TRY

There have been some new developments with Docker Desktop WSL 2:
https://www.docker.com/blog/5-things-docker-desktop-wsl2-tech-preview