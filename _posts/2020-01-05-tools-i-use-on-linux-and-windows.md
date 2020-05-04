---
title: Tools I Use
description: Listing the most common tools I use daily on both Linux and Windows, from browsers to command-line utilities
---

# Tools I Use (INCUBATING - I'm currently organising tools by category, rather than OS)

The following are everyday computing tools i use (or really want to believe I do) to maximise productivity, and get the most amount of enjoyment I can out of the system I'm using.

This post will be frequently updated as I discover new tools to supplant existing ones, or revert back to a trusted tool after getting far too carried away on the hype train.

A lot of these tools have been found via a combination of searching on hackernews, and using https://alternativeto.net/.

Note: The '~' character means the tool is no longer being used as much, and is in danger of being removed from the list

# Disk usage analysers

Linux: Baobab
Windows: Spacesniffer

More Linux alternatives can be found here: https://www.how2shout.com/tools/best-disk-usage-analyzer-tools-for-linux-system.html

# System hardware information

Linux: pciutils (lspci), lsusb, hwinfo







# Linux

Distros:

- MX Linux: daily OS
- Alpine Linux: minimal linux OS I have running on many older laptops
- Fedora CoreOS: container linux OS I have running on my home server

Command-line tools:

- audio:
    - cvlc: command-line version of vlc, the curses view is great: `cvlc -I curses [FILE/URI]`
    - mpg123 - quick and dirty mp3 player
    - mplayer (see note below): quick and dirty general player (FLAC support!)
    - ogg123 - quick and dirty ogg player
    - https://github.com/Rigellute/spotify-tui: excellent command-line music player for spotify
    ~ cmus
    ~ moc
- asciicinema
- aws: the AWS cli
- baobab
- ffmpeg: audio/video conversion tool
- jq: json processor
- rclone: great utility, but I mostly use AWS S3 for everything these days
- xz - lossless compression program based on LZMA/LZMA2 compression algorithms
~ ack
~ ag
~ entr: http://eradman.com/entrproject/

- firefox / firefox dev browser:
    - addons: dark reader, ublock origin, tree-style tabs
- brave (a fork of the Chrome browser)
    - addons: same as firefox, but replace tree-style tabs with Tabs Outliner

# Windows

- rufus (balenaEtcher is also good but does not support burning MX Linux bootloaders) - USB/SD image flau- bleachbit - disk space cleaner
- chocolatey - package manager for windows
- diskpart - command-line disk partitioning utility
- ext2fsd - mount linux partitions on windows
- git-bash - linux-like command-line for windows
- greenshot - screenshot program
- itunes - regrettably it's the only reliable ipod management program on windows (Clementine doesn't support devices atm)
- nirsoft suite (nirlauncher.exuue as a GUI )
- screentogif
- spacesniffer (successor to windDirStat)
- sysinternals suite
- total commander
- vlc (run in ncurses mode for a great command-line experience)
- workspacer (also tried fancy zones and plumb, but not good for me)
- xmlstarlet
~ hwinfo
~ ? musikcube (windows)

# Browser extensions/addons

## fraidyc.at

Great way to follow things without the feeling that you need to catch-up and read everything. If you are getting the error `NetworkError when attempting to fetch resource` or similar, check that your browser's network settings are set to _Auto-detect proxy settings for this network_.

# Additional information on specific tools

## mplayer

Use in conjunction with youtube-dl to play movies in the console:

```
$ apk add mplayer youtube-dl libcaca
$ youtube-dl pec8P5K4s8c -o fireplace.mp4
$ export CACA_DRIVER=ncurses
$ mplayer -really-quiet -vo caca fireplace.mp4
```

## Terminal dashboards (i WANT to start using one day)

~ https://github.com/wtfutil/wtf
~ https://github.com/jaymedavis/hubble

## uBlock Origin 

    Settings: Everything set to nightmare mode

    Filter lists:
    https://raw.githubusercontent.com/yourduskquibbles/webannoyances/master/ultralist.txt

    My filters:

    My rules:

    Whitelist:

    Shortcuts: Relax blocking mode: _Ctrl+Space_


# Tools I WANT to try

https://directory.fsf.org/wiki/Etherpad

https://directory.fsf.org/wiki/Nextcloud

https://github.com/Upload/Up1

https://mosh.org

diagram.codes

X410 – X Server for Windows 10 https://news.ycombinator.com/item?id=22905390

