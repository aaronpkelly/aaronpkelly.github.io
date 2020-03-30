
Table of Contents
=================

   * [Tools I use on Linux and Windows](#tools-i-use-on-linux-and-windows)
   * [Linux](#linux)
   * [Windows](#windows)
   * [Additional information on specific tools](#additional-information-on-specific-tools)
      * [mplayer](#mplayer)
      * [Terminal dashboards (i WANT to start using one day)](#terminal-dashboards-i-want-to-start-using-one-day)
      * [ublock origin](#ublock-origin)

Created by [gh-md-toc](https://github.com/ekalinin/github-markdown-toc)


# Tools I use on Linux and Windows

TODO: Should this list be YAML-formatted?

The following are everyday computing tools i use (or really want to believe I do) to maximise productivity, and get the most amount of enjoyment I can out of the system I'm using.

This post will be frequently updated as I discover new tools to supplant existing ones, or revert back to a trusted tool after getting far too carried away on the hype train.

Note: The '~' character means the tool is no longer being used as much, and is in danger of being removed from the list

# Linux

Distros:
    - MX Linux: daily OS
    - Alpine Linux: minimal linux OS I have running on many older laptops
    - Fedora ChromeOS: container linux OS I have running on my home server

Command-line tools:
    - audio:
        - cvlc: command-line version of vlc, the curses view is great: `cvlc -I curses [FILE/URI]`
        - mpg123 - quick and dirty mp3 player
        - mplayer (see note below): quick and dirty general player (FLAC support!)
        - ogg123 - quick and dirty ogg player
        ~ cmus
        ~ moc
    - asciicinema
    - aws: the AWS cli
    - chrome
        - addons: same as firefox, but replace tree-style tabs with Tabs Outliner
    - ffmpeg
    - firefox / firefox dev browser:
        - addons: dark reader, fraidyc.at, ublock origin, tree-style tabs
    - jq: json processor
    - rclone: great utility, but I mostly use AWS S3 for everything these days
    - xz - lossless compression program based on LZMA/LZMA2 compression algorithms
    ~ ack
    ~ ag
    ~ entr: http://eradman.com/entrproject/

# Windows

- rufus (balenaEtcher is also good but does not support burning MX Linux bootloaders) - USB/SD image flashing
- bleachbit - disk space cleaner
- chocolatey - package manager for windows
- diskpart - command-line disk partitioning utility (see https://www.repairwin.com/fix-diskpart-has-encountered-an-error-the-parameter-is-incorrect/ for usage)
- ext2fsd - mount linux partitions on windows
- git-bash - linux-like command-line for windows. use chocolatey to install addditional programs here
- greenshot - screenshot program
- itunes - regrettably it's the only reliable ipod management program on windows (Clementine doesn't support devices atm)
- nirsoft suite (nirlauncher.exe as a GUI )
- screentogif
- spacesniffer (successor to windDirStat)
- sysinternals suite
- total commander
- vlc (run in ncurses mode for a great command-line experience)
- workspacer (also tried fancy zones and plumb, but not good for me)
- xmlstarlet
~ hwinfo
~ ? musikcube (windows)

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

- ? https://github.com/wtfutil/wtf
- ? https://github.com/jaymedavis/hubble

## ublock origin 

Settings: Everything set to nightmare mode

Filter lists:
https://raw.githubusercontent.com/yourduskquibbles/webannoyances/master/ultralist.txt

My filters:

My rules:

Whitelist:

Shortcuts: Relax blocking mode: _Ctrl+Space_