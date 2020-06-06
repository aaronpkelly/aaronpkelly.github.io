---
title: Tools I use daily
description: A list of the most common tools I use daily on both Linux and Windows, from command-line utilities to browser extensions
date: 2020-01-05
tags:
    - asciinema
	- tools
	- developer
---

# Tools I use daily
The following are everyday computing tools i use (or really want to believe I do) to maximise productivity, and get the most amount of enjoyment I can out of the system I'm using.

This post will be frequently updated as I discover new tools to supplant existing ones, or revert back to a trusted tool after getting far too carried away on the hype train.

A lot of these tools have been found via a combination of searching on hackernews, and using https://alternativeto.net/.

## FEAR THE ~
The '~' character means the tool is marked as no longer being used, and is in danger of being removed from the list.

# Audio
- [[cvlc]]: command-line version of vlc
- mpg123: quick and dirty mp3 player
- [[mplayer]] quick and dirty general player (FLAC support!)
- ogg123:  quick and dirty ogg player
- [spotify-tui](https://github.com/Rigellute/spotify-tui): excellent command-line music player for spotify
~ cmus
~ moc

# Browsers
- firefox / firefox dev browser:
    - addons: dark reader, ublock origin, tree-style tabs
- brave (a fork of the Chrome browser)
    - addons: same as firefox, but replace tree-style tabs with Tabs Outliner

## Extensions/addons
https://fraidyc.at/: Great way to follow things without the feeling that you need to catch-up and read everything. If you are getting the error `NetworkError when attempting to fetch resource` or similar, check that your browser's network settings are set to _Auto-detect proxy settings for this network_.

[[uBlock Origin]]

# Command-line tools
These tools in this list probably belong in their own sections:
- asciinema
- aws: the AWS cli
- baobab
- ffmpeg: audio/video conversion tool
- jq: json processor
- rclone: great utility, but I mostly use AWS S3 for everything these days
- xz - lossless compression program based on LZMA/LZMA2 compression algorithms
~ ack
~ ag
~ entr: http://eradman.com/entrproject/

# Disk usage analysers
Baobab (Linux) and Spacesniffer (Windows).

More Linux alternatives can be found here: https://www.how2shout.com/tools/best-disk-usage-analyzer-tools-for-linux-system.html

# Note taking
[Obsidian](https://obsidian.md/) - basically just markdown with wiki links

# Operating systems
MX Linux, [[searching-for-my-container-os|FedoraCoreOS]], Alpine Linux and Windows 10. 

# System hardware information
pciutils (for lspci), lsusb, hwinfo (Linux).

# Windows (TODO: organise by category instead of OS)

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

# See also
[[Tools i am trialling or want to try]]