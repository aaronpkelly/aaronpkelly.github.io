---
title: MX Linux
description:
date: 2020-05-12
tags:
  - linux
  - mxlinux
---

# MX Linux

Various solutions I've found for various problems specific to MX Linux.

For general [[Linux]] solutions see that file.

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

# changing background wallpaper
this is needed if using i3:

```
feh --bg-scale <PATH_TO_IMAGE>
```

there's some good ones on:
- artstation.com (e.g. 'hacker bedroom')
- or [Surface of the Planets](https://bogoljubov.artstation.com/projects/RXaYX)

# turning off x
```
sudo service lightdm stop
```

# capturing interactive tty output

Use `script`!

```
script ~/script_output
<DO_THINGS>
exit
```
For some reason I had control characters `^M` appended to my output. Use `dos2unix -f <FILE>` to clear them

# remapping keys (e.g. CAPS->ESC)

## in X

## remember: resetting
at any time type this to reset the keymapping in x:

```
setxkbmap ie
# or 
setxkbmap dvorak -option caps:escape
```

## using setxkbmap
`setxkbmap`  is known as the "modern" tool for the job

If you're in X, you can just do this:
```
setxkbmap dvorak -option caps:escape
```

i'm sure there's a lot more readins that can be done with this tool

## using xev and xmodmap

type `xev` to get a live window where you can see keypresses, e.g to remap the right `CTRL` key to be the left `CTRL` key, get the key codes:

```
KeyRelease event, serial 34, synthetic NO, window 0xb800001,
    root 0x18c, subw 0x0, time 131816574, (81,509), root:(1365,529),
    state 0x4, keycode 37 (keysym 0xffe3, Control_L), same_screen YES,
    XLookupString gives 0 bytes: 
    XFilterEvent returns: False

KeyPress event, serial 34, synthetic NO, window 0xb800001,
    root 0x18c, subw 0x0, time 131850486, (175,620), root:(1619,640),
    state 0x0, keycode 105 (keysym 0xffe4, Control_R), same_screen YES,
    XLookupString gives 0 bytes: 
    XmbLookupString gives 0 bytes: 
    XFilterEvent returns: False
```

Then just:

```
xmodmap -e "keycode 105 = keycode 37"
```

or:

```
xmodmap -e "keycode 105 = Control_L"
```


## without x
Many ways to skin a cat

This seems a little harder... 

### using evtest and hwdb

Here's me trying to remap `KEY_CAPSLOCK` to `KEY_ESC` using `hwdb`.

Btw, these URLs really helped me:

- https://blog.zhanghai.me/remapping-keys-with-udev-hwdb/
- https://wiki.archlinux.org/index.php/map_scancodes_to_keycodes

So, `evtest` can be used to determine:

- what your hardware keyboard is, and 
- to determine exactly what KEY you are pressing (needed when remapping)

```
sudo evtest
kevtest No device specified, trying to scan all of /dev/input/event*
Available devices:
/dev/input/event0:	AT Translated Set 2 keyboard
/dev/input/event1:	Lid Switch
/dev/input/event2:	Power Button
/dev/input/event3:	Sleep Button
/dev/input/event4:	Power Button
/dev/input/event5:	Video Bus
/dev/input/event6:	Dell WMI hotkeys
/dev/input/event7:	DLL075B:01 06CB:76AF Touchpad
/dev/input/event8:	Intel HID events
/dev/input/event9:	Intel HID 5 button array
/dev/input/event10:	Intel Virtual Button driver
/dev/input/event11:	HDA Digital PCBeep
/dev/input/event12:	HDA Intel PCH Headphone Mic
/dev/input/event13:	HDA Intel PCH HDMI/DP,pcm=3
/dev/input/event14:	HDA Intel PCH HDMI/DP,pcm=7
/dev/input/event15:	HDA Intel PCH HDMI/DP,pcm=8
/dev/input/event16:	HDA Intel PCH HDMI/DP,pcm=9
/dev/input/event17:	HDA Intel PCH HDMI/DP,pcm=10
/dev/input/event18:	Integrated_Webcam_HD: Integrate
/dev/input/event19:	ACPI Virtual Keyboard Device
Select the device event number [0-19]: 0
Input driver version is 1.0.1
Input device ID: bus 0x11 vendor 0x1 product 0x1 version 0xab41
Input device name: "AT Translated Set 2 keyboard"
Supported events:
  Event type 0 (EV_SYN)
  Event type 1 (EV_KEY)
    Event code 1 (KEY_ESC)
    Event code 2 (KEY_1)
    Event code 3 (KEY_2)
    Event code 4 (KEY_3)
    Event code 5 (KEY_4)
    Event code 6 (KEY_5)
    Event code 7 (KEY_6)
    Event code 8 (KEY_7)
    Event code 9 (KEY_8)
    Event code 10 (KEY_9)
    Event code 11 (KEY_0)
    Event code 12 (KEY_MINUS)
    Event code 13 (KEY_EQUAL)
    Event code 14 (KEY_BACKSPACE)
    Event code 15 (KEY_TAB)
    Event code 16 (KEY_Q)
    Event code 17 (KEY_W)
    Event code 18 (KEY_E)
    Event code 19 (KEY_R)
    Event code 20 (KEY_T)
    Event code 21 (KEY_Y)
    Event code 22 (KEY_U)
    Event code 23 (KEY_I)
    Event code 24 (KEY_O)
    Event code 25 (KEY_P)
    Event code 26 (KEY_LEFTBRACE)
    Event code 27 (KEY_RIGHTBRACE)
    Event code 28 (KEY_ENTER)
    Event code 29 (KEY_LEFTCTRL)
    Event code 30 (KEY_A)
    Event code 31 (KEY_S)
    Event code 32 (KEY_D)
    Event code 33 (KEY_F)
    Event code 34 (KEY_G)
    Event code 35 (KEY_H)
    Event code 36 (KEY_J)
    Event code 37 (KEY_K)
    Event code 38 (KEY_L)
    Event code 39 (KEY_SEMICOLON)
    Event code 40 (KEY_APOSTROPHE)
    Event code 41 (KEY_GRAVE)
    Event code 42 (KEY_LEFTSHIFT)
    Event code 43 (KEY_BACKSLASH)
    Event code 44 (KEY_Z)
    Event code 45 (KEY_X)
    Event code 46 (KEY_C)
    Event code 47 (KEY_V)
    Event code 48 (KEY_B)
    Event code 49 (KEY_N)
    Event code 50 (KEY_M)
    Event code 51 (KEY_COMMA)
    Event code 52 (KEY_DOT)
    Event code 53 (KEY_SLASH)
    Event code 54 (KEY_RIGHTSHIFT)
    Event code 55 (KEY_KPASTERISK)
    Event code 56 (KEY_LEFTALT)
    Event code 57 (KEY_SPACE)
    Event code 58 (KEY_CAPSLOCK)
    Event code 59 (KEY_F1)
    Event code 60 (KEY_F2)
    Event code 61 (KEY_F3)
    Event code 62 (KEY_F4)
    Event code 63 (KEY_F5)
    Event code 64 (KEY_F6)
    Event code 65 (KEY_F7)
    Event code 66 (KEY_F8)
    Event code 67 (KEY_F9)
    Event code 68 (KEY_F10)
    Event code 69 (KEY_NUMLOCK)
    Event code 70 (KEY_SCROLLLOCK)
    Event code 71 (KEY_KP7)
    Event code 72 (KEY_KP8)
    Event code 73 (KEY_KP9)
    Event code 74 (KEY_KPMINUS)
    Event code 75 (KEY_KP4)
    Event code 76 (KEY_KP5)
    Event code 77 (KEY_KP6)
    Event code 78 (KEY_KPPLUS)
    Event code 79 (KEY_KP1)
    Event code 80 (KEY_KP2)
    Event code 81 (KEY_KP3)
    Event code 82 (KEY_KP0)
    Event code 83 (KEY_KPDOT)
    Event code 85 (KEY_ZENKAKUHANKAKU)
    Event code 86 (KEY_102ND)
    Event code 87 (KEY_F11)
    Event code 88 (KEY_F12)
    Event code 89 (KEY_RO)
    Event code 90 (KEY_KATAKANA)
    Event code 91 (KEY_HIRAGANA)
    Event code 92 (KEY_HENKAN)
    Event code 93 (KEY_KATAKANAHIRAGANA)
    Event code 94 (KEY_MUHENKAN)
    Event code 95 (KEY_KPJPCOMMA)
    Event code 96 (KEY_KPENTER)
    Event code 97 (KEY_RIGHTCTRL)
    Event code 98 (KEY_KPSLASH)
    Event code 99 (KEY_SYSRQ)
    Event code 100 (KEY_RIGHTALT)
    Event code 102 (KEY_HOME)
    Event code 103 (KEY_UP)
    Event code 104 (KEY_PAGEUP)
    Event code 105 (KEY_LEFT)
    Event code 106 (KEY_RIGHT)
    Event code 107 (KEY_END)
    Event code 108 (KEY_DOWN)
    Event code 109 (KEY_PAGEDOWN)
    Event code 110 (KEY_INSERT)
    Event code 111 (KEY_DELETE)
    Event code 112 (KEY_MACRO)
    Event code 113 (KEY_MUTE)
    Event code 114 (KEY_VOLUMEDOWN)
    Event code 115 (KEY_VOLUMEUP)
    Event code 116 (KEY_POWER)
    Event code 117 (KEY_KPEQUAL)
    Event code 118 (KEY_KPPLUSMINUS)
    Event code 119 (KEY_PAUSE)
    Event code 121 (KEY_KPCOMMA)
    Event code 122 (KEY_HANGUEL)
    Event code 123 (KEY_HANJA)
    Event code 124 (KEY_YEN)
    Event code 125 (KEY_LEFTMETA)
    Event code 126 (KEY_RIGHTMETA)
    Event code 127 (KEY_COMPOSE)
    Event code 128 (KEY_STOP)
    Event code 140 (KEY_CALC)
    Event code 141 (KEY_SETUP)
    Event code 142 (KEY_SLEEP)
    Event code 143 (KEY_WAKEUP)
    Event code 148 (KEY_PROG1)
    Event code 152 (KEY_SCREENLOCK)
    Event code 155 (KEY_MAIL)
    Event code 156 (KEY_BOOKMARKS)
    Event code 157 (KEY_COMPUTER)
    Event code 158 (KEY_BACK)
    Event code 159 (KEY_FORWARD)
    Event code 162 (KEY_EJECTCLOSECD)
    Event code 163 (KEY_NEXTSONG)
    Event code 164 (KEY_PLAYPAUSE)
    Event code 165 (KEY_PREVIOUSSONG)
    Event code 166 (KEY_STOPCD)
    Event code 172 (KEY_HOMEPAGE)
    Event code 173 (KEY_REFRESH)
    Event code 183 (KEY_F13)
    Event code 184 (KEY_F14)
    Event code 185 (KEY_F15)
    Event code 191 (KEY_F21)
    Event code 205 (KEY_SUSPEND)
    Event code 212 (KEY_CAMERA)
    Event code 215 (KEY_EMAIL)
    Event code 217 (KEY_SEARCH)
    Event code 224 (KEY_BRIGHTNESSDOWN)
    Event code 225 (KEY_BRIGHTNESSUP)
    Event code 226 (KEY_MEDIA)
    Event code 227 (KEY_SWITCHVIDEOMODE)
    Event code 236 (KEY_BATTERY)
    Event code 240 (KEY_UNKNOWN)
  Event type 4 (EV_MSC)
    Event code 4 (MSC_SCAN)
  Event type 17 (EV_LED)
    Event code 0 (LED_NUML) state 0
    Event code 1 (LED_CAPSL) state 0
    Event code 2 (LED_SCROLLL) state 0
Key repeat handling:
  Repeat type 20 (EV_REP)
    Repeat code 0 (REP_DELAY)
      Value    250
    Repeat code 1 (REP_PERIOD)
      Value     33
Properties:
Testing ... (interrupt to exit)
Event: time 1596290402.345958, type 4 (EV_MSC), code 4 (MSC_SCAN), value 1c
Event: time 1596290402.345958, type 1 (EV_KEY), code 28 (KEY_ENTER), value 0
Event: time 1596290402.345958, -------------- SYN_REPORT ------------
Event: time 1596290408.340523, type 4 (EV_MSC), code 4 (MSC_SCAN), value 3a
Event: time 1596290408.340523, type 1 (EV_KEY), code 58 (KEY_CAPSLOCK), value 1
Event: time 1596290408.340523, -------------- SYN_REPORT ------------
Event: time 1596290408.511838, type 4 (EV_MSC), code 4 (MSC_SCAN), value 3a
Event: time 1596290408.511838, type 1 (EV_KEY), code 58 (KEY_CAPSLOCK), value 0
Event: time 1596290408.511838, -------------- SYN_REPORT ------------
Event: time 1596290409.796392, type 4 (EV_MSC), code 4 (MSC_SCAN), value 3a
Event: time 1596290409.796392, type 1 (EV_KEY), code 58 (KEY_CAPSLOCK), value 1
Event: time 1596290409.796392, -------------- SYN_REPORT ------------
Event: time 1596290409.975950, type 4 (EV_MSC), code 4 (MSC_SCAN), value 3a
Event: time 1596290409.975950, type 1 (EV_KEY), code 58 (KEY_CAPSLOCK), value 0
Event: time 1596290409.975950, -------------- SYN_REPORT ------------
```

Then you can write a file:

/etc/udev/hwdb.d/90-custom-keyboard.hwdb
```
evdev:atkbd:dmi:bvn*:bvr*:bd*:svn*:pn*:pvr*
	KEYBOARD_KEY_3a=esc
```

