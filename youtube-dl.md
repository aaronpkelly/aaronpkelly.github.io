# stream from youtube-dl to vlc

```
youtube-dl -o - Z3kBWP231hI | vlc -
```

and if you put the full youtube video into a `VID` variable, you can use this:

```
VID=https://www.youtube.com/watch?v=Qwa59aNaR7w
youtube-dl -o - $(echo $VID | cut -d '=' -f 2) | vlc -
```