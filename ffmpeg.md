# Screen capture
[[ffmpeg]] is the tool for the job! [This page](https://trac.ffmpeg.org/wiki/Capture/Desktop) has examples you can use. On [[MX Linux]], Pulseaudio seems to be installed by default, so I'll use that example.

First, get your current screen resolution (your current resolution has a `*` star next to it):

```
$ xrandr
Screen 0: minimum 320 x 200, current 1920 x 1080, maximum 8192 x 8192
eDP-1 connected primary 1920x1080+0+0 (normal left inverted right x axis y axis) 294mm x 165mm
   1920x1080     59.93*+
   1680x1050     59.95    59.88  
   1600x1024     60.17
```

Then, use this to capture the _entire_ screen:

```
ffmpeg -video_size 1920x1080 -framerate 25 -f x11grab -i :0.0 -f pulse -ac 2 -i default output.mkv
```

If you want to grab a _smaller_ portion of the screen:

```
ffmpeg -video_size 1024x768 -framerate 25 -f x11grab -i :0.0+100,200 output.mp4
```

`-i :0.0+100,200`: this will grab the image from desktop, starting with the upper-left corner at x=100, y=200 with a width and height of 1024x768. 

# front-end
https://handbrake.fr/ - uses FFMPEG, very nice tool (https://news.ycombinator.com/item?id=18949007)

# see also

[[Tools I use daily]]