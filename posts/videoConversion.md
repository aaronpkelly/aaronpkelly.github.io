I have a lot of video files that I need to convert.

-I recently tried out https://eu-west-3.console.aws.amazon.com/mediaconvert/ and it worked very well-
Update: OH MAN. Guess a read the pricing wrong. I guess the price-per-minute is
the minutes IN THE VIDEO and not the amount of time the job spends in the job
queue.

I just spend US$67.06 on converting videos yesterday. Not good.

I should have probably contacted their billing support to try and get my billing
adjusted, but I didn't. I should really do this next time.

# Some commonly used terms

AVC = H.264
HEVC = H.265

# Ideal conversion process - container + FFMPEG

I use a container which uses FFMPEG to take input from an S3 bucket, convert,
and then output to a S3 bucket.

I also want to ensure the video file is encoded as "progressive", which to
allows a viewer to skip to different segments in its video timeline quickly.

I also want this file to be be streamable through a browser. The can be
accomplished by using a codec which has browser support (AVC/WEBM), and then
setting the S3 object to public. The browser should detect it as a video stream
and play it in-browser.

## Video parameters

AWS MediaConvert have a set of "progressive" templates here: https://eu-west-1.console.aws.amazon.com/mediaconvert/home?region=eu-west-1#/templates/details/System-Generic_Mp4_Progressive

Inside that is a _File Group_ with six templates, three of which are _AVC_
templates:

|| output || Name modifier || Extension ||
| Output 4 | _Generic_Hd_Mp4_Avc_Aac_16x9_1920x1080p_24Hz_6Mbps	| mp4 |
| Output 5 | _Generic_Hd_Mp4_Avc_Aac_16x9_1280x720p_24Hz_4.5Mbps | mp4 |
| Output 6 | _Generic_Sd_Mp4_Avc_Aac_4x3_640x480p_24Hz_1.5Mbps | mp4

I'm more inclined to follow these templates when creating the video encoding
parameters for my own video encoding, as they have a higher chance of being
closer to industry standards I suppose.

I don't know if it's possible to view the video/audio encoding settings outside
of creating a job, but they are visible when you:
_ Create a new job -> Add an Output Group -> Select the preset_

### Container settings
Container Info
MP4

Moov placement Info
PROGRESSIVE_DOWNLOAD

CSLG atom Info
INCLUDE

Freebox space box Info
EXCLUDE

CTTS version Info
Default

Encoding settings
Video

Video codec
MPEG-4 AVC (H.264)

Resolution (w x h)
1280 x 720

Scaling behavior Info
DEFAULT

Sharpness Info
50

Timecode insertion Info
DISABLED

Color metadata Info
INSERT

Respond to AFD Info
NONE

AFD signaling Info
NONE

Unregistered SEI Info
No

Framerate
24000 / 1001

Framerate conversion algorithm Info
DUPLICATE_DROP

Pixel aspect ratio
1 / 1

Rate control mode Info
CBR

Quality tuning level Info
MULTI_PASS_HQ

Bitrate (bits/s) Info
4500000

HRD buffer size (bits) Info
9000000

HRD buffer initial fill % Info
90

GOP size Info
2

Unit Info
SECONDS

B frames between reference frames Info
3

Closed GOP cadence Info
1

Number of reference frames Info
3

Repeat PPS Info
No

GOP reference B-Frame Info
Yes

Dynamic Sub-GOP Info
Default

Scene change detection Info
ENABLED

Min I-Interval Info
0

Interlace mode Info
PROGRESSIVE

Profile Info
HIGH

Level Info
LEVEL_4

Syntax Info
DEFAULT

Entropy encoding Info
CABAC

Slices Info
1
Adaptive quantization Info
HIGH

Spatial Adaptive Quantization Info
Yes

Temporal Adaptive Quantization Info
Yes

Flicker Adaptive Quantization Info
Yes

Softness Info
0

Preprocessors
Deinterlacer
Deinterlace mode Info
DEINTERLACE

Deinterlace algorithm Info
INTERPOLATE

Control Info
NORMAL





# Coverting on AWS - don't do it

Don't use their MedaConvert service because it's ridiculously pricey.

In case you are brave enough, here are my notes

## Single-file conversion via the GUI

I've tried converting using this template:
_Generic_Sd_Mp4_Avc_Aac_4x3_640x480p_24Hz_1.5Mbps

but too much is lost. I'll try this template next:
_Generic_Hd_Mp4_Hevc_Aac_16x9_1280x720p_24Hz_3.0Mbps

that took a long time!!!

## Batch conversion via AWS CLI

This documentation helped me out: https://docs.aws.amazon.com/mediaconvert/latest/apireference/custom-endpoints.html

So the first thing I did was manually create a job using the GUI, and once I was
happy with that, I can export the job JSON as a template to use.

This is great, because I can use this to define my encoding parameters, and all
I need to change are the filenames.

Here's the job JSON:
```
{
  "Queue": "arn:aws:mediaconvert:eu-west-1:655455268553:queues/Default",
  "UserMetadata": {},
  "Role": "arn:aws:iam::655455268553:role/MediaConvert_Default_Role",
  "Settings": {
    "OutputGroups": [
      {
        "Name": "File Group",
        "Outputs": [
          {
            "Preset": "System-Generic_Hd_Mp4_Avc_Aac_16x9_Sdr_1280x720p_30Hz_5Mbps_Qvbr_Vq9",
            "Extension": "mp4"
          }
        ],
        "OutputGroupSettings": {
          "Type": "FILE_GROUP_SETTINGS",
          "FileGroupSettings": {
            "Destination": "s3://bitstore-video/converted/"
          }
        }
      }
    ],
    "AdAvailOffset": 0,
    "Inputs": [
      {
        "AudioSelectors": {
          "Audio Selector 1": {
            "Offset": 0,
            "DefaultSelection": "DEFAULT",
            "ProgramSelection": 1
          }
        },
        "VideoSelector": {
          "ColorSpace": "FOLLOW",
          "Rotate": "DEGREE_0",
          "AlphaBehavior": "DISCARD"
        },
        "FilterEnable": "AUTO",
        "PsiControl": "USE_PSI",
        "FilterStrength": 0,
        "DeblockFilter": "DISABLED",
        "DenoiseFilter": "DISABLED",
        "TimecodeSource": "EMBEDDED",
        "FileInput": "s3://bitstore-video/toConvert/DAS/destroyAllSoftware_HEVC-x265-encodedByMe/das-0001-statistics-over-git-repositories.mov.mp4"
      }
    ]
  },
  "AccelerationSettings": {
    "Mode": "DISABLED"
  },
  "StatusUpdateInterval": "SECONDS_60",
  "Priority": 0
}
```

That `FileInput` string is the only thing that needs to change.

So, here the hacks begin.

### Attempt 1: Long hacky way

I need a list of files in in my source bucket.

Lets just get the list, and put this list in a file:
```
for item in $(aws s3 ls s3://bitstore-video/toConvert/DAS/destroyAllSoftware_HEVC-x265-encodedByMe/ | awk '{print $4}'); do echo "$item" >> output; done
```

Now, lets create a $FILE_job.json for each file:
```
while read line; do sed "s,das.*,$line\",g" job.json > "$line"_job.json ; done < output
```

get my endpoint (needed!):
```
aaron:~/environment/transcode $ aws mediaconvert describe-endpoints --region eu-west-1
{
    "Endpoints": [
        {
            "Url": "https://r1eeew44a.mediaconvert.eu-west-1.amazonaws.com"
        }
    ]
}
```

Then, for each *job.json file, submit the job:
```
for file in *.json; do aws --endpoint-url https://r1eeew44a.mediaconvert.eu-west-1.amazonaws.com --region eu-west-1 mediaconvert create-job --cli-input-json file://"$file"; done
```

### Attempt 2: The one-liner? (TODO)

Once I verified the above was working, I attempted to turn it into a one-liner,
but I couldn't :(

Here's a script instead:

```
for file in $(aws s3 ls s3://bitstore-video/toConvert/DAS/destroyAllSoftware_HEVC-x265-encodedByMe/ | awk '{print $4}'); do
    sed "s,das.*,$file\",g" job.json > "$file"_job.json
    aws --endpoint-url https://r1eeew44a.mediaconvert.eu-west-1.amazonaws.com --region eu-west-1 mediaconvert create-job --cli-input-json file://"$file"_job.json
done
```