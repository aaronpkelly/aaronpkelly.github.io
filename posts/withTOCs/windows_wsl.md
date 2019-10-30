
Table of Contents
=================

Parsing local markdown file requires access to github API
Error: You exceeded the hourly limit. See: https://developer.github.com/v3/#rate-limiting
or place github auth token here: /home/ec2-user/src/aaronpkelly/aaronpkelly.github.io/token.txt



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
there's actually WSL2 available for Windows Insider users on the "Fast track"
ring, and it features a real kernel... oh my! A benefit of WSL2 is that Docker
can be run - I didn't realise that the first WSL didn't support it.

I'm not on this fast track, so I set it in _Settings -> Windows Insider Program_,
and set it there. It wanted me to restart, so I did. I checked my build version
using `ver`, but I still was on an older build. It was only when I went back to
_Settings -> Windows Insider Program_, that I saw this message:
```
Note: It will take some time to receive a build after changing your settings
```

So, I guess I'll have to wait a while until I can follow this guide:
https://docs.microsoft.com/en-us/windows/wsl/wsl2-install
