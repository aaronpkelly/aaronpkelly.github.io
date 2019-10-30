
Table of Contents
=================

Parsing local markdown file requires access to github API
Error: You exceeded the hourly limit. See: https://developer.github.com/v3/#rate-limiting
or place github auth token here: /home/ec2-user/src/aaronpkelly/aaronpkelly.github.io/token.txt



# browser
I had to edit /etc/resolv.conf because of slow loading times, I appended the
following to the file:

```
# my options
options timeout:1 attempts:5
```

# go
I had to build go from source, as the version of go that comes with the
raspian distro is not compatible with megacmd

# scanner
problems with sane and detecting a USB scanner

i had to go to /dev/bus and
```
chmod -R 777 usb
```
after that the scanner was detected by scanimage -L

# sound
ALSA should already be pre-installed, use that - not pulseaudio.

MPlayer will use the default libavcodec to play mp3 files - which is fine. It
will complain however that it can't find the mpg123 codec files to play.
Install the packages libmpg123-0 (and maybe mpg123?) and then edit the 
~/.mplayer/config file to include:
```
afm=mp3lib
```

The pi can either output audio via the hdmi cable or the standard analogue 
audio jack. Use the below command to switch between hdmi/analogue:

Substituting <n> for the desired mode: 0=auto, 1=headphones, 2=hdmi. For example, to force the Raspberry Pi to use the analog output:
```
sudo amixer cset numid=3 1
```
