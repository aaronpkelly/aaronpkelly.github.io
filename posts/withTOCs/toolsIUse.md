
Table of Contents
=================

Parsing local markdown file requires access to github API
Error: You exceeded the hourly limit. See: https://developer.github.com/v3/#rate-limiting
or place github auth token here: /home/ec2-user/src/aaronpkelly/aaronpkelly.github.io/token.txt
The following are everyday computing tools i use (or really want to believe I do)

The "-" character means the tool is no longer being used as much, and is in
danger of being removed from the list

# linux command-line tools
## audio
ogg123 - quick and dirty ogg player
mpg123 - quick and dirty mp3 player
-cmus
mplayer
-moc
asciicinema

## video
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


## tools
-ag
-ack
-entr: http://eradman.com/entrproject/
jq
rclone
xz - lossless compression program based on LZMA/LZMA2 compression algorithms

## terminal dashboards i WANT to start using
https://github.com/wtfutil/wtf
https://github.com/jaymedavis/hubble

# Windows
## Window management
Plumb, fancyzones, workspaces... jury is still out. See my related post on tiling
window managers.

## binaries
- hwinfo
- jenkins (with the build monitor plugin!)
- musikcube (windows)
balenaEtcher - USB/SD image flashing utility
bleachbit
chocolatey (made ninite redundant) - package manager for windows
ext2fsd - mount linux partitions on windows
git-bash - linux-like command-line for windows. use chocolatey to install addditional programs here
greenshot - screenshot program
itunes - regrettably it's the only reliable ipod management program on windows (Clementine doesn't support devices atm)
nirsoft suite
screentogif
sysinternals suite
total commander
vlc
xmlstarlet

## disk space analyser
Spacesniffer - just come across it and I think it takes top spot.
windirstat - great tool.


# browser
firefox
firefox-dev browser

## browser-based apps
feedly

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
