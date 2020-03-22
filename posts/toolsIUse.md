The following are everyday computing tools i use (or really want to believe I do)

The "?" character means the tool is no longer being used as much, and is in
danger of being removed from the list

# linux

- jq
- rclone
- xz - lossless compression program based on LZMA/LZMA2 compression algorithms

- ? ag
- ? ack
- ? entr: http://eradman.com/entrproject/

## audio

- mpg123 - quick and dirty mp3 player
- ogg123 - quick and dirty ogg player
- mplayer (see note below): quick and dirty general player (FLAC support!)
- cvlc: command-line version of vlc, the curses view is great: `cvlc -I curses [FILE/URI]`

- ? cmus
- ? moc

### mplayer
Use in conjunction with youtube-dl to play movies in the console:
```
$ apk add mplayer youtube-dl libcaca
$ youtube-dl pec8P5K4s8c -o fireplace.mp4
$ export CACA_DRIVER=ncurses
$ mplayer -really-quiet -vo caca fireplace.mp4
```

## video

- ? asciicinema



### youtube-dl
One of the best tools for downloading video from that platform

## terminal dashboards i WANT to start using

- ? https://github.com/wtfutil/wtf
- ? https://github.com/jaymedavis/hubble

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

- ? hwinfo
- ? musikcube (windows)

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