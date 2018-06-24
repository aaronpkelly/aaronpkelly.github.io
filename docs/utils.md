# Here's some useful utilities I've developed
## The Consumer
A small bash script that plays a folder of audio files and then moves them to a
_listened_ folder

```
#!/user/bin/env bash

VLCPATH="/c/Program Files/VideoLAN/VLC"

mkdir listened

# -I null: start as background task (currently disabled)
# --intf dummy: no GUI (currently disabled)
# --play-and-exit: quits vlc after each audio file
for file in *; do
        "$VLCPATH"/vlc.exe --play-and-exit --qt-start-minimized "$file"
        mv "$file" listened
done
```
