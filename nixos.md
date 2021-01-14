# binaries
Downloading and attempting to run a binary on NixOS will almost never work.

https://nixos.wiki/wiki/Packaging/Binaries

# intellij + java

you will need to install a jdk package (e.g. `jdk14`) and then add the JDK manually in intellij. It mastu point to the location in the nix store

to find it:

```
aaron@nixos  /run/current-system/sw/bin  ls -al java
lrwxrwxrwx 1 root root 70 Jan  1  1970 java -> /nix/store/ws8wlx376m3g8wa9h6x7qxjpixhqxzc3-openjdk-14.0.2-ga/bin/java
```

In that location there will be a `lib/openjdk` folder somewher. So in IntelliJ, give the location `/nix/store/ws8wlx376m3g8wa9h6x7qxjpixhqxzc3-openjdk-14.0.2-ga/lib/openjdk`

# brightness and backlight
for brightness i have [[scripts]] for xrandr

but i don't have a good solution for the backlight yet, i'm doing reading https://nixos.wiki/wiki/Backlight and doing this:

```
$ cat /sys/class/backlight/intel_backlight/max_brightness
7500

$ sudo tee /sys/class/backlight/intel_backlight/brightness <<< 7500
```

# firmware
NIXOs provides a hardware channel that has firmware fixes for *quirks* for certain makes and models of hardware devices: https://github.com/NixOS/nixos-hardware

From that page:

```
$ sudo nix-channel --add https://github.com/NixOS/nixos-hardware/archive/master.tar.gz nixos-hardware
$ sudo nix-channel --update
```

add your profile:

```
imports = [
  <nixos-hardware/dell/xps/13-9360>
  ./hardware-configuration.nix
];
```


# terminal
## theme (.Xresources)
with i3, xterm is ok, but the theme is a bit garish

download https://github.com/dracula/xresources

installation is easy:

```
$ ln -sn ~/src/xresources/Xresources ~/.Xresources
$ xrdb ~/.Xresources
```

more info about X resources is [here](https://wiki.archlinux.org/index.php/x_resources)

# wifi

i had to use networkmanager to use my wifi on my dell

```
networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # aaron: enable the networkmanager
  networking.networkmanager.enable = true;
  # networking.networkmanager.unmanaged = [
  # "*" "except:type:wwan" "except:type:gsm"
  # ];

  # Set your time zone.
  time.timeZone = "Europe/Dublin";

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking.useDHCP = false;
  networking.interfaces.wlp58s0.useDHCP = true;

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";
```

then i used `nmtui` from the command-line

# erasing my darlings

I read a [post](https://news.ycombinator.com/item?id=22856199) on HN about a guy who used NixOS + ZFS to create an immutable operating system. I wanted to try it out!

I found that following his instructions wasn't straightforward as I've no experience with ZFS, but I found a guy who [created a script](https://gist.github.com/mx00s/ea2462a3fe6fdaa65692fe7ee824de3e) of the entire process.

I did need to make some changes to that script though...

When a partition is created on my SSD, it prepends a `p` before the new partition number, so I had to account for this:

```
- export DISK_PART_ROOT="${DISK_PATH}1"
+ export DISK_PART_BOOT="${DISK_PATH}p2"
- export DISK_PART_ROOT="${DISK_PATH}1"
+ export DISK_PART_BOOT="${DISK_PATH}p2"
```

Also, after rebooting, the wrong UUID was being used by the OS, and the system would never start. I found [this issue](https://github.com/NixOS/nixpkgs/issues/62444) was already reported, and their fix was simple - just add `udevadm trigger` before generating the config. I updated the script with this and it worked fine:

```
  info "Installing NixOS to /mnt ..."
+ udevadm trigger
  ln -s /mnt/persist/etc/nixos/configuration.nix /mnt/etc/nixos/configuration.nix
  nixos-install -I "nixos-config=/mnt/persist/etc/nixos/configuration.nix" --no-root-passwd  # already prompted for and configured password
```

I've created a fixed version of the original install script, but with networkmanager enabled and my 2 fixes: https://paste.sr.ht/~aaronkelly/8719f57570aa85295a7151f164cfd4f47a4be267

From here on, I'll version my zsh-specific NixOS configuration file in my private repo: https://git.sr.ht/~aaronkelly/configfiles/tree/master/nixos

# printing
it does work: https://nixos.wiki/wiki/Printing

use jetdirect socket to connect: socket://hp7fe558.lan

cups is pretty cool! i like the html interface - http://localhost:631/

# scanning
after setting up the printer, I did try following the tips in https://nixos.wiki/wiki/Scanners but I was unsuccessful.

However, after adding the printer in the CUPS - http://localhost:631/printers/HP_ENVY_4520_series_7FE558_

And setting the printer as the server default via _Printers -> HP Envy -> Set as Server Default_, the `hp-scan` utility was successful (**actually**, I think you just need to do ANY action in CUPS, e.g. click on the printer, for the `hp-scan` utility to work):

```
$ hp-scan 

HP Linux Imaging and Printing System (ver. 3.20.5)
Scan Utility ver. 2.2

Copyright (c) 2001-18 HP Development Company, LP
This software comes with ABSOLUTELY NO WARRANTY.
This is free software, and you are welcome to distribute it
under certain conditions. See COPYING file for more details.

warning: No destinations specified. Adding 'file' destination by default.
Using device hpaio:/net/envy_4520_series?ip=192.168.0.209&queue=false
Opening connection to device...

Resolution: 300dpi
Mode: gray
Compression: JPEG
Scan area (mm):
  Top left (x,y): (0.000000mm, 0.000000mm)
  Bottom right (x,y): (215.900009mm, 297.010681mm)
  Width: 215.900009mm
  Height: 297.010681mm
Destination(s): file
Output file: 
warning: File destination enabled with no output file specified.
Setting output format to PNG for greyscale mode.
warning: Defaulting to '/home/aaron/hp/hpscan001.png'.

Warming up...
 

Scanning...
Reading data: [************************************************************************************************************************] 100%  8.5 MB     
Read 8.5 MB from scanner.
Closing device.

Outputting to destination 'file':

Done

```

# bluetooth
follow https://nixos.wiki/wiki/Bluetooth for enabling the hardware

## connecting to a bluetooth speaker
NOTE: i've spent HOURS on this shit below and I can't get it to work

THe commands I believe are correct, but I think the fact that the service:
- does not start at startup

is a bad sign

### start bluealsa service

According to the docs, this [SHOULD](https://github.com/Arkq/bluez-alsa#configuration--usage) be started as a system service after the installation of the `bluez-alsa` derivation - but it's not:

```
 aaron@nixos  ~  sudo systemctl | grep -i blue
  sys-devices-pci0000:00-0000:00:14.0-usb1-1\x2d3-1\x2d3:1.0-bluetooth-hci0.device       loaded active plugged   /sys/devices/pci0000:00/0000:00:14.0/usb1/1-3/1-3:1.0/bluetooth/hci0      
  sys-subsystem-bluetooth-devices-hci0.device                                            loaded active plugged   /sys/subsystem/bluetooth/devices/hci0                                     
  bluetooth.service                                                                      loaded active running   Bluetooth service                                                         
  bluetooth.target                                                                       loaded active active    Bluetooth
```

So, suggestions are to start bluealsa manually ([man page](https://github.com/Arkq/bluez-alsa/blob/master/doc/bluealsa.8.rst)):

```
sudo bluealsa --dbus=org.bluealsa --device=hci0 --profile=a2dp-source &
```

### connect to the device
follow the same guide to use the cli to connect:

```
$ bluetoothctl
\[bluetooth\] # power on
\[bluetooth\] # agent on
\[bluetooth\] # default-agent
\[bluetooth\] # scan on
...put device in pairing mode and wait \[hex-address\] to appear here...
\[bluetooth\] # pair B8:69:C2:61:6B:91
\[bluetooth\] # connect B8:69:C2:61:6B:91
\[bluetooth\] # trust
\[bluetooth\] # scan off
```

```
[bluetooth]# connect B8:69:C2:61:6B:91
Attempting to connect to B8:69:C2:61:6B:91
[CHG] Device B8:69:C2:61:6B:91 Connected: yes
Failed to connect: org.bluez.Error.Failed
[CHG] Device B8:69:C2:61:6B:91 Connected: no
[CHG] Device B8:69:C2:61:6B:91 Connected: yes
[CHG] Device B8:69:C2:61:6B:91 Icon: audio-card
[CHG] Device B8:69:C2:61:6B:91 Appearance is nil
[NEW] Primary Service (Handle 0xb01d)
        /org/bluez/hci0/dev_B8_69_C2_61_6B_91/service0006
        00001801-0000-1000-8000-00805f9b34fb
        Generic Attribute Profile
[NEW] Primary Service (Handle 0xb01d)
        /org/bluez/hci0/dev_B8_69_C2_61_6B_91/service0007
        65786365-6c70-6f69-6e74-2e636f6d0000
        Vendor specific
[NEW] Characteristic (Handle 0xb01d)
        /org/bluez/hci0/dev_B8_69_C2_61_6B_91/service0007/char0008
        65786365-6c70-6f69-6e74-2e636f6d0001
        Vendor specific
[NEW] Characteristic (Handle 0xb01d)
        /org/bluez/hci0/dev_B8_69_C2_61_6B_91/service0007/char000a
        65786365-6c70-6f69-6e74-2e636f6d0002
        Vendor specific
[CHG] Device B8:69:C2:61:6B:91 ServicesResolved: yes
```

### playing music

#### mpg123:

```
 mpg123 -a bluealsa:HCI=hci0,DEV=B8:69:C2:61:6B:91,PROFILE=a2dp ~/Music/mp3/bensound-anewbeginning.mp
```

#### mplayer:

this just plays to my local laptop speakers:

```
mplayer -ao alsa ~/Music/mp3/bensound-anewbeginning.mp3
```

but to play to bluealsa?:

```
mplayer -ao alsa:device=B8:69:C2:61:6B:91 ~/Music/mp3/bensound-anewbeginning.mp3
```

vlc:
```

```

# elf binaries

https://nixos.wiki/wiki/Packaging/Binaries

	Downloading and attempting to run a binary on NixOS will almost never work.
	
That's because inside the binary is a _hardcoded_ location for the ELF interpreter, but NixOS won't have this path.

so you can try searching for an ELF interpreter:
```

$ find . -name '*ld-linux*' 2>/dev/null
./nix/store/9df65igwjmf2wbw0gbrrgair6piqjgmi-glibc-2.31/lib/ld-linux-x86-64.so.2
./nix/store/pd84q00d99kd7627h5sjkp819ag1pyc5-extra-utils/lib/ld-linux-x86-64.so.2
./nix/store/m2ylgs54567lq2pgjwaykm1wz7vrykw6-nixos-20.09.1693.d12178b1c4a/nixos/pkgs/os-specific/linux/dmtcp/ld-linux-so-buffer-size.patch

```

then you can try running the `patchelf` command:
```
$ patchelf --set-interpreter /nix/store/9df65igwjmf2wbw0gbrrgair6piqjgmi-glibc-2.31/lib/ld-linux-x86-64.so.2 <YOUR_FILE>
```