My favourite media player at the moment, even better than VLC

It's command-line only, the GUI front-ends are separate.

I know it's meant primarily as a "video player", but it has amazing support for many audio formats, and best of all it's FAST. This means its a great GENERAL AUDIO PLAYER.

One con I've found - this tool doesn't support `pls` files :(

# Tricks
Use in conjunction with [[youtube-dlp (youtube-dl)]] to play movies in the console:

```
$ apk add mplayer youtube-dl libcaca
$ youtube-dl pec8P5K4s8c -o fireplace.mp4
$ export CACA_DRIVER=ncurses
$ mplayer -really-quiet -vo caca fireplace.mp4
```