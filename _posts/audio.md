# Artist discovery and hosting
Absolutely love this site:
https://en.wikipedia.org/wiki/Bandcamp

All sorts of indie artists live there.

# General
Spotify, it's fine for mainstream listening, but if you're an indie artist you
won't have a presence there. Bandcamp is great for that.

# Webradio
One of my favourite sites to listen to music online is SomaFM:
https://en.wikipedia.org/wiki/Soma.fm

I found them when reading about Defcon - SomaFM provide the music for one of
the chillout rooms at the event. I find myself usually listening to the least
popular stations, because they're more interesting to me.

There is also https://en.wikipedia.org/wiki/Di.fm which is decent, but more
mainstream

## Listening to radio from a command-line

This post is really good: https://askubuntu.com/questions/193737/how-to-listen-radio-from-terminal/193753

I have an alias which gets all the currently available AAC 32k streams on the
site, which can be dumped to a file:
```
alias soma_getURLs="curl https://somafm.com/listen/ | grep 32k | cut -c11- | rev | cut -c10- | rev | xargs -L 1 printf 'http://www.somafm.com/%s\n'"

This can then be played with... 

cvlc (in ncurses mode!). Great for reading a downloaded .pls file:
```
cvlc -I curses [FILE/URI]
```

mplayer(note: mplayer doesn't support .pls streams):
```
mplayer [IP_ADDRESS]
```

cmus:
- run `cmus`
- type `:add http://www.somafm.com/cliqhop32.pls`
- press 2 for the library, enter to play

moc:
```
mocp
```
