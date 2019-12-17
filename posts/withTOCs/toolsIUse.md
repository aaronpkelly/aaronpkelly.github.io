
Table of Contents
=================

   * [linux command-line tools](#linux-command-line-tools)
      * [audio](#audio)
      * [video](#video)
         * [mplayer](#mplayer)
         * [youtube-dl](#youtube-dl)
      * [general tools](#general-tools)
      * [terminal dashboards i WANT to start using](#terminal-dashboards-i-want-to-start-using)
   * [Windows](#windows)
      * [Window management](#window-management)
      * [binaries](#binaries)
      * [disk space analyser](#disk-space-analyser)
   * [browser](#browser)
      * [browser-based apps](#browser-based-apps)
      * [extensions](#extensions)
         * [ublock origin](#ublock-origin)
            * [Settings](#settings)

Created by [gh-md-toc](https://github.com/ekalinin/github-markdown-toc)



The following are everyday computing tools i use (or really want to believe I do)

The "?" character means the tool is no longer being used as much, and is in
danger of being removed from the list

# linux command-line tools

## audio

- ? cmus
- ? moc
- mpg123 - quick and dirty mp3 player
- mplayer
- ogg123 - quick and dirty ogg player

## video

- ? asciicinema
- ? mplayer

### mplayer
Use in conjunction with youtube-dl to play movies in the console:
```
$ apk add mplayer youtube-dl libcaca
$ youtube-dl pec8P5K4s8c -o fireplace.mp4
$ export CACA_DRIVER=ncurses
$ mplayer -really-quiet -vo caca fireplace.mp4
```
### youtube-dl
One of the best tools for downloading video from that platform


## general tools

- ? ag
- ? ack
- ? entr: http://eradman.com/entrproject/
- jq
- rclone
- xz - lossless compression program based on LZMA/LZMA2 compression algorithms

## terminal dashboards i WANT to start using

- ? https://github.com/wtfutil/wtf
- ? https://github.com/jaymedavis/hubble

# Windows
## Window management
Workspacer - I discovered it here: https://news.ycombinator.com/item?id=20895031

Others I've tried:
- Fancy Zones: I think i tried it quickly but it didn't do what I needed
- Plumb: worked just ok but wasn't perfect



## binaries

- ? hwinfo
- ? musikcube (windows)
- balenaEtcher/rufus - USB/SD image flashing
- bleachbit
- chocolatey - package manager for windows
- ext2fsd - mount linux partitions on windows
- git-bash - linux-like command-line for windows. use chocolatey to install addditional programs here
- greenshot - screenshot program
- itunes - regrettably it's the only reliable ipod management program on windows (Clementine doesn't support devices atm)
- nirsoft suite (nirlauncher.exe as a GUI )
- screentogif
- sysinternals suite
- total commander
- vlc
- xmlstarlet

## disk space analyser

- Spacesniffer - just come across it and I think it takes top spot.
- windirstat - great tool that I've used for a long time


# browser

- firefox
- firefox-dev browser

## browser-based apps
- feedly

## extensions
### ublock origin
#### Settings
Settings: Everything set to nightmare mode

Filter lists:
https://raw.githubusercontent.com/yourduskquibbles/webannoyances/master/ultralist.txt

My filters:

My rules:

Whitelist:

Shortcuts: Relax blocking mode: _Ctrl+Space_
