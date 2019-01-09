# USB compatibility
## compatible partition and filesystem
partition type: Win95 FAT32 (fdisk selection b)
filesystem: FAT32

use the package `dosfstools` to create the partitions:

`mkfs.fat -F 32 /dev/sdb1`

## folder structure
you need the following folders:

`Game` `Music` `Photo` `Video`

## ffmpeg encoding
a great article by prupert that contains his example encoding string:
https://prupert.wordpress.com/2009/10/10/how-to-use-ffmpeg-to-transcode-video-for-the-ps3/

the actual FFmpeg page for H.264 encoding:
https://trac.ffmpeg.org/wiki/Encode/H.264

there is a bash script in scripts/playstation/encodeBatchVideo

working encoding string:

`
ffmpeg -i $INFILE -vcodec libx264 -level 41 -preset medium -crf 24 -threads 0 -acodec aac -ab 128k -ac 2 -ar 48000 $OUTFILE.mp4
`

### on presets (see the FFmpeg link above for full explanation):
> The general guideline is to use the slowest preset that you have patience
for. Current presets in descending order of speed are:
ultrafast,superfast, veryfast, faster, fast, medium, slow, slower, veryslow

## ps3 supported codecs
## audio
http://manuals.playstation.net/document/en/ps3/current/music/filetypes.html

Memory Stick Audio Format(ATRAC)
MP3
- MPEG-1/2 Audio Layer3
- MP3 Surround
MP4(MPEG-4 AAC)
WAVE(Linear PCM)
WMA

### video
http://manuals.playstation.net/document/en/ps3/current/video/filetypes.html

Memory Stick Video Format
- MPEG-4 SP (AAC LC)
- H.264/MPEG-4 AVC High Profile (AAC LC)
- MPEG-2 TS(H.264/MPEG-4 AVC, AAC LC)
MP4 file format
- H.264/MPEG-4 AVC High Profile (AAC LC)
MPEG-1 (MPEG Audio Layer 2)
MPEG-2 PS (MPEG2 Audio Layer 2, AAC LC, AC3(Dolby Digital), LPCM)
MPEG-2 TS(MPEG2 Audio Layer 2, AC3(Dolby Digital), AAC LC)
MPEG-2 TS(H.264/MPEG-4 AVC, AAC LC)
AVI
- Motion JPEG (Linear PCM)
- Motion JPEG (μ-Law)
AVCHD (.m2ts / .mts)
DivX
WMV
- VC-1(WMA Standard V2)
