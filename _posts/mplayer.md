Use in conjunction with youtube-dl to play movies in the console:

```
$ apk add mplayer youtube-dl libcaca
$ youtube-dl pec8P5K4s8c -o fireplace.mp4
$ export CACA_DRIVER=ncurses
$ mplayer -really-quiet -vo caca fireplace.mp4
```