
Table of Contents
=================

   * [Downloading a Linux distro](#downloading-a-linux-distro)

Created by [gh-md-toc](https://github.com/ekalinin/github-markdown-toc)
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
