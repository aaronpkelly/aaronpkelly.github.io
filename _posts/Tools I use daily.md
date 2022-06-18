---
title: Tools I use daily
description: A list of the most common tools I use daily on both Linux and Windows, from command-line utilities to browser extensions
date: 2020-01-05
tags:
  - tools
  - developer
---

# Tools I use
The following are everyday computing tools i use (or really want to believe I do) to maximise productivity, and get the most amount of enjoyment I can out of the system I'm using.

This post will be frequently updated as I discover new tools to supplant existing ones, or revert back to a trusted tool after getting far too carried away on the hype train.

A lot of these tools have been found via a combination of:
- reading articles on  https://news.ycombinator.com/
- searching on https://alternativeto.net/
- looking at https://github.com/ibraheemdev/modern-unix

# legend
~ : in danger of being removed due to non-use

# audio

~ cmus
~ moc

- https://sr.ht/~tenacity/tenacity/ : Our project initially started as a fork of [Audacity](https://audacityteam.org) as a result of multiple controversies and public relation crises

# audio + video
- kodi: excellent media server, connect it to a remote seedbox and you have a movie library on the cloud
- gnome-sound-recorder: when you need to record some audio quickly - it's great!
- [[mplayer]] fantastic general audio and video player
- opusTools: the ultimate lossy encoding format - Opus replaces both Vorbis and Speex
- mpv (drew [uses](https://drewdevault.com/2020/12/12/Shell-literacy.html) it
- vlc
	- cvlc: command-line version of vlc. the curses view is great: `cvlc -I curses [FILE/URI]`

I also have a love affair for these programs:
- mpg123 - Fast console MPEG Audio Player and decoder library
- ogg123 (nix: vorbis-tools): Extra tools for Ogg-Vorbis audio codec
	- NOTE: OPUS has replaced ogg vorbis and speex

~ cmus
~ moc

## DAWs

- ableton (windows only)
- bitwig-studio (linux)
	- on linux, there's also https://www.tracktion.com/
	- and https://ardour.org/

# browsers
- firefox / firefox dev browser:
    - addons: dark reader, ublock origin, ~tree-style tabs
- brave (a fork of the Chrome browser)
    - addons: same as firefox, but replace tree-style tabs with Tabs Outliner

## Extensions/addons# Audio and video
- [[mplayer]]
- vlc (run in ncurses mode for a great command-line experience) (see [[cvlc]]) p
[[fraidyc.at]]

[[uBlock Origin]]

# Command-line tools
These tools in this list probably belong in their own sections:
- asciinema
- aws: the AWS cli
- baobab
- ffmpeg: audio/video conversion tool
- fzf
- jq: json processor
- lftp
- rclone: great utility, but I mostly use AWS S3 for everything these days
- xz - lossless compression program based on LZMA/LZMA2 compression algorithms
~ ack
~ ag


# Disk usage analysers
- Linux
	- baobab
	- [dust](https://github.com/bootandy/dust) (ncdu is also great)
- windows
	- spacesniffer (Windows).

more Linux alternatives can be found here: https://www.how2shout.com/tools/best-disk-usage-analyzer-tools-for-linux-system.html

# File managers
- ranger (linux)
- total commander (windows)

# File transfer

- [CURL](CURL.md)
- https://github.com/schollz/croc - Easily and securely send things from one computer to another. Fantastic tool that just works



# IDEs
[[VSCode]]

# Note taking
[Obsidian](https://obsidian.md/) - basically just markdown with wiki links

# Operating systems
MX Linux, [[searching-for-my-container-os|FedoraCoreOS]], Alpine Linux and Windows 10. 

# System hardware information
- pciutils (in order to get for lspci)
- lsusb
- hwinfo
- powertop: battery power consumption and management tool



# Windows (TODO: organise by category instead of OS)

- ventoy (replaces rufus!) (balenaEtcher is also good but does not support burning MX Linux bootloaders) - USB/SD image burner
- bleachbit - disk space cleaner
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
- workspacer (also tried fancy zones and plumb, but not good for me)
- xmlstarlet
~ hwinfo

# See also
[[Tools i am trialling or want to try]]