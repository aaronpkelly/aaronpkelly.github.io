---
title: MX Linux
description:
date: 2020-05-12
tags:
  - linux
  - mxlinux
---

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

# Changing the console font on a tty
normally fonts go in ~/.local/share/fonts, but not console fonts

reconfiguring
```
sudo dpkys-reconfigure console-setup
```

there's only a small number of fonts

use `man console-setup`

console fonts go in `/usr/share/consolefonts`

console-setup config file is `/etc/default/console-setup`, where you can specify a default `FONT` but I haven't been able to get it working with a font other that the defaults