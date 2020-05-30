# Set sound output to HDMI 

This worked immediately:

```
pactl set-card-profile 0 output:hdmi-stereo
```

To reverse:

```
pactl set-card-profile 0 output:analog-stereo
```

You can also install pavucontrol then, in the GUI, select Configuration: Digital Stereo (HDMI) Output or Analogue Stereo Output to switch between the two audio outputs.

via https://www.linuxquestions.org/questions/antix-mx-linux-127/can%27t-get-sound-when-plugging-computer-to-tv-4175637780/