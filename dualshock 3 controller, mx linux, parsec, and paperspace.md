# mx linux gamepad support?
yes - mx linux does have support out of the box.

steam detects it fine.

HOWEVER... it seems to also function as a mouse

# stopping my controller from behaving like it's a squeaker
this can be disabled in Mouse and Touchpad settings, but it doesn't seem to save

## editing some file
so I tried this:
```
sudo vim /usr/share/X11/xorg.conf.d/50-joystick.conf
```

updated the entry to this:
```
Section "InputClass"
	Identifier "joystick catchall"
	MatchIsJoystick "on"
	MatchDevicePath "/dev/input/event*"
	Driver "joystick"
	Option "StartMouseEnabled" "False"
EndSection
```

I didn't really know if the above did anything

## disabling controller in X
ALSO look at this shit:
```
❯ xinput
⎡ Virtual core pointer                    	id=2	[master pointer  (3)]
⎜   ↳ Virtual core XTEST pointer              	id=4	[slave  pointer  (2)]
⎜   ↳ DLL075B:01 06CB:76AF Touchpad           	id=12	[slave  pointer  (2)]
⎜   ↳ Sony PLAYSTATION(R)3 Controller         	id=19	[slave  pointer  (2)]
⎣ Virtual core keyboard                   	id=3	[master keyboard (2)]
    ↳ Virtual core XTEST keyboard             	id=5	[slave  keyboard (3)]
    ↳ Power Button                            	id=6	[slave  keyboard (3)]
    ↳ Video Bus                               	id=7	[slave  keyboard (3)]
    ↳ Power Button                            	id=8	[slave  keyboard (3)]
    ↳ Sleep Button                            	id=9	[slave  keyboard (3)]
    ↳ Integrated_Webcam_HD: Integrate         	id=11	[slave  keyboard (3)]
    ↳ Intel Virtual Button driver             	id=13	[slave  keyboard (3)]
    ↳ Intel HID events                        	id=14	[slave  keyboard (3)]
    ↳ Intel HID 5 button array                	id=15	[slave  keyboard (3)]
    ↳ Dell WMI hotkeys                        	id=16	[slave  keyboard (3)]
    ↳ AT Translated Set 2 keyboard            	id=17	[slave  keyboard (3)]
    ↳ ACPI Virtual Keyboard Device            	id=18	[slave  keyboard (3)]
    ↳ Sony PLAYSTATION(R)3 Controller (keys)  	id=10	[slave  keyboard (3)]
```

my controller is listed as a pointer. fuck that. disable!:
```
xinput set-prop 'Sony PLAYSTATION(R)3 Controller' "Device Enabled" 0
```

## result?
My controller is no longer a mouse pointer

When loading steam on my dell, it functions normally as a controller. Result!

thank you to [this article](https://askubuntu.com/questions/632026/how-can-i-stop-my-controller-from-moving-my-mouse)

# however... it don't work on parsec+paperspace
So I don't know if Parsec is to blame, or the Win10 box.

## parsec?
no idea how to troubleshoot this

## win10
install scptoolkit on the win10 box and see if it works 

# more help

here:
https://www.addictivetips.com/ubuntu-linux-tips/use-the-ps4-controller-on-linux/

plenty of info on setting up gamepads in arch linux wiki here: https://wiki.archlinux.org/index.php/Gamepad