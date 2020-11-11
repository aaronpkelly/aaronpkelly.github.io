# Artist discovery and hosting
Absolutely love this site:
https://en.wikipedia.org/wiki/Bandcamp

All sorts of indie artists live there.

# General
Spotify, it's fine for mainstream listening, but if you're an indie artist you
won't have a presence there. Bandcamp is great for that.

# Webradio


## Listening to radio from a command-line

This post is really good: https://askubuntu.com/questions/193737/how-to-listen-radio-from-terminal/193753

My API has a function which gets all the currently available AAC 32k streams on SOMA FM, which can then be dumped to a file:
```
https://somafm.com/groovesalad32.pls
https://somafm.com/dronezone32.pls
https://somafm.com/indiepop32.pls
```

## Playing the .pls

[cvlc] (in ncurses mode!). Great for reading a downloaded .pls file:
```
cvlc -I curses [FILE/URI]
```

[[mplayer]] (note: this tool doesn't support .pls streams, you're going to have to `curl` the .pls file and play a URL directly:
```
❯ curl https://somafm.com/scanner32.pls
[playlist]
numberofentries=6
File1=http://ice6.somafm.com/scanner-32-aac
Title1=SomaFM: SF Police Scanner (#1): San Francisco Public Safety Scanner Feed

❯ mplayer http://ice1.somafm.com/scanner-32-aac
Starting playback...
A:   0.6 (00.5) of 0.0 (unknown)  0.6% 73%
```

[[cmus]]:
- run `cmus`
- type `:add http://www.somafm.com/cliqhop32.pls`
- press 2 for the library, enter to play

[[moc]] - instructions are a bit light...:
```
mocp
```