# update - use youtube-dlp

https://github.com/yt-dlp

> yt-dlp is a [youtube-dl](https://github.com/ytdl-org/youtube-dl) fork based on the now inactive [youtube-dlc](https://github.com/blackjack4494/yt-dlc). The main focus of this project is adding new features and patches while also keeping up to date with the original project

https://news.ycombinator.com/item?id=28319624

# stream from youtube-dl to vlc

```
youtube-dl -o - Z3kBWP231hI | vlc -
```

and if you put the full youtube video into a `VID` variable, you can use this:

```
VID=https://www.youtube.com/watch?v=Qwa59aNaR7w
youtube-dl -o - $(echo $VID | cut -d '=' -f 2) | vlc -
```

# trim/download only a portion of a video

youtube-dl doesn't support this, but ffmpeg done

e.g. a 1 hour video

	VIDEO=https://www.youtube.com/watch?v=fNz1Xg3MsH8
	VIDEO_NAME="Mesquite Fireplace HD 1080P by Fireplace for your Home 60 Minutes"
	CONTAINER=mkv
	VIDEO_NAME_WITH_CONTAINER_EXTENSION="${VIDEO_NAME}.${CONTAINER}"
	ENCODER_VIDEO=libx264
	ENCODER_AUDIO=aac
	PRESET=ultrafast
	TIME_FROM=00:00:00.00
	TIME_TO=01:00:00.00
	
	ffmpeg \
		$(youtube-dl -g $VIDEO | sed 's/^/-ss 00:00 -i /') \
			-t $TIME_TO \
			-map 0:v \
			-map 1:a \
			-c:v libx264 \
			-c:a aac \
			-preset $PRESET \
			$VIDEO_NAME_WITH_CONTAINER_EXTENSION
			
tips via: https://unix.stackexchange.com/questions/230481/how-to-download-portion-of-video-with-youtube-dl-command

# rescale video

> In FFmpeg, if you want to scale a video while retaining its aspect ratio, you need to set the height or width parameter, and set the other parameter to `-1`

You can specify the Width To Retain the Aspect Ratio:

	ffmpeg -i input.mp4 -vf scale=320:-1 output.mp4

Or specify the Height To Retain the Aspect Ratio:

	ffmpeg -i input.mp4 -vf scale=-1:720 output.mp4


In addition, you can use ffmpeg variables `iw` and `ih`  if you don't want to enter exact numbers:

	ffmpeg -i input.mp4 -vf "scale=iw/2:-1" output.mp4
