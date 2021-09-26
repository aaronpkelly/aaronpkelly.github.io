# why i like NixOS

I think I finally worked out why I like this operating system so much:
- your entire operating system can act like a docker container with `nix-shell -p <package>`
	- as soon as you exit the shell, there are no left-over side-effects from using the package (apart from areas Nix doesn't manage such as user data)
	- you can have multiple versions of a package installed easily

# binaries
Downloading and attempting to run a binary on NixOS will almost never work.

https://nixos.wiki/wiki/Packaging/Binaries

# running packages

## comma

https://github.com/Shopify/comma

install with `nix-env -i -f .`


using a comma before a command will run a nix package without installing it:

```
, ruby --version
```

this is an even easier solution that running `nix-shell -p <package>`

# home manager

allows you to split your general system configuration file from packages configured for your user (your ~)

home manager manual: https://nix-community.github.io/home-manager/

Home manager manual - configuration options: https://rycee.gitlab.io/home-manager/options.html#opt-programs.firefox.enable





# Garbage collection

See garbage collection in the [manual](https://nixos.org/manual/nix/stable/#sec-garbage-collection). Deleting generations should be done first:

	# To delete all generations older than a specified number of days (except the current generation), use the `d` suffix
	$ nix-env --delete-generations 30d
	
	# To delete all old (non-current) generations of your current profile. Slighly more drastic!
	$ nix-env --delete-generations old
	
	# see the help file too
	$ nix-env --delete-generations --help
	
Then the garbge collection can be ran:

	nix-store --gc

## Automating generation delete and garbage collection
Generation deletion and garbage collection can also be automated, via https://nixos.wiki/wiki/Storage_optimization:

	nix.gc = {
	  automatic = true;
	  dates = "weekly";
	  options = "--delete-older-than 30d";
	};
	
For more options, see https://search.nixos.org/options?channel=21.05&from=0&size=50&sort=relevance&query=nix.gc

## forum post recommendations

And a quick recommendation from a [great forum post](https://discourse.nixos.org/t/what-to-do-with-a-full-boot-partition/2049/11):

> 1.  Do a `sudo nixos-rebuild build` so that you’re sure that the build of your current configuration can be carried out
> 2.  Do a garbage collection to remove old system generations with `sudo nix-collect-garbage -d`
> 3.  Manually make some space in boot. Find your kernels and `rm` them.
> 4.  Run `sudo nixos-rebuild switch` or `sudo nixos-rebuild boot`. This time your bootloader will be installed correctly along with the new kernel and initrd
> 5.  Make sure point 4 was executed correctly by looking at the output and reboot
> 6.  \[optional\] remove the `result` directory created by point 1

## clearing the /boot partition

The above post deals with a full _/boot_ partition too, but this is how to keep it clean in your _configuration.nix_:

	boot.loader.systemd-boot.configurationLimit = 5;

See [`boot.loader.systemd-boot.configurationLimit`](https://nixos.org/manual/nixos/stable/options.html#opt-boot.loader.systemd-boot.configurationLimit):

	boot.loader.systemd-boot.configurationLimit

    Maximum number of latest generations in the boot menu. Useful to prevent boot partition running out of disk space.

    null means no limit i.e. all generations that were not garbage collected yet.

    Type: null or signed integer

    Default: null

    Example: 120 

# intellij + java jdk

you will need to install a jdk package (e.g. `jdk11`, which is the [recommended](https://nixos.wiki/wiki/Java) LTS jdk) and then add the JDK manually in intellij. It must point to the location in the nix store

to find it:

```
readlink -f $(which java)
/nix/store/48ddc74sdlinbg5q5655i4z8kp6xasb0-openjdk-11.0.9+11/lib/openjdk/bin/java
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

## detecting network printers
### adding a printer in CUPS

Just remove all existing printers, then detect+add the network printer at http://localhost:631/admin

### using bonjour

using these docs: http://localhost:631/help/network.html

I can find the network printer:

```
$ lpinfo --include-schemes dnssd -v
network dnssd://HP%20ENVY%204520%20series%20%5B7FE558%5D%20(5)._ipp._tcp.local/?uuid=1c852a4d-b800-1f08-abcd-c8d3ff7fe558
```

### jetdirect???

in the past I was also able to use the _jetdirect socket_ to connect: 

	socket://hp7fe558.lan

## interface - CUPS!

cups is pretty cool! i like the html interface - http://localhost:631/

# scanning

note: it's still janky, the below SOMETIMES works

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

## connecting to a bluetooth speaker/headphones using ALSA only

so this is concerning, via https://wiki.archlinux.org/index.php/Bluetooth#ALSA :
	
	**Note:** Bluez5 has dropped direct integration for [ALSA](https://wiki.archlinux.org/index.php/ALSA "ALSA") and supports [PulseAudio](https://wiki.archlinux.org/index.php/PulseAudio "PulseAudio") only. Follow the instructions below if you cannot or do not want to use PulseAudio.
	
now - I do install the `bluez-alsa` package - this SHOULD be the solution, here's the [readme](https://github.com/Arkq/bluez-alsa):

	This project is a rebirth of a direct integration between [BlueZ](http://www.bluez.org/) and [ALSA](https://www.alsa-project.org/). Since BlueZ >= 5, the build-in integration has been removed in favor of 3rd party audio applications. From now on, BlueZ acts as a middleware between an audio application, which implements Bluetooth audio profile, and a Bluetooth audio device.
	
	The current status quo is, that in order to stream audio from/to a Bluetooth device, one has to install [PulseAudio](https://www.freedesktop.org/wiki/Software/PulseAudio), or use BlueZ < 5. However, BlueZ version 4 is considered to be deprecated, so the only reasonable way to achieve this goal is to install PulseAudio.
	
	With this application (later named as BlueALSA), one can achieve the same goal as with PulseAudio, but with less dependencies and more bare-metal-like. BlueALSA registers all known Bluetooth audio profiles in BlueZ, so in theory every Bluetooth device (with audio capabilities) can be connected. In order to access the audio stream, one has to connect to the ALSA PCM device called `bluealsa`. Please note that this PCM device is based on the [ALSA software PCM I/O plugin](https://www.alsa-project.org/alsa-doc/alsa-lib/pcm_external_plugins.html) - it will not be available in the [ALSA Kernel proc interface](https://www.kernel.org/doc/html/latest/sound/designs/procfile.html).

that same readme gives some great tips about the `bluealsa` program:

	The main component of BlueALSA is a program called `bluealsa`. By default, this program shall be run as a root during system startup. It will register `org.bluealsa` service in the D-Bus system bus, which can be used for accessing configured audio devices. In general, BlueALSA acts as a proxy between BlueZ and ALSA.
	
that same readme links to the `bluealsa` [man page](https://github.com/Arkq/bluez-alsa/blob/master/doc/bluealsa.8.rst#example) which gives you examples how to start it, e.g.:

```
bluealsa -p a2dp-sink -p hsp-hs
```

once that program has started, `bluetoothctl` can be used to connect the device:

```
[bluetooth]# connect F4:4E:FD:EC:28:63
Attempting to connect to F4:4E:FD:EC:28:63
[CHG] Device F4:4E:FD:EC:28:63 Connected: yes
Connection successful
[CHG] Device F4:4E:FD:EC:28:63 ServicesResolved: yes
```

you should hear a connection sound in your device, and you should be able to start the `blueman-applet` and see the device is connected

`bluealsa-aplay` is a convenient wrapper:

```
$ bluealsa-aplay --help
Usage:
  bluealsa-aplay [OPTION]... [BT-ADDR]...

Options:
  -h, --help            print this help and exit
  -V, --version         print version and exit
  -v, --verbose         make output more verbose
  -l, --list-devices    list available BT audio devices
  -L, --list-pcms       list available BT audio PCMs
  -B, --dbus=NAME       BlueALSA service name suffix
  -D, --pcm=NAME        playback PCM device to use
  --pcm-buffer-time=INT playback PCM buffer time
  --pcm-period-time=INT playback PCM period time
  --profile-a2dp        use A2DP profile (default)
  --profile-sco         use SCO profile
  --single-audio        single audio mode

Note:
If one wants to receive audio from more than one Bluetooth device, it is
possible to specify more than one MAC address. By specifying any/empty MAC
address (00:00:00:00:00:00), one will allow connections from any Bluetooth
device. Without given explicit MAC address any/empty MAC is assumed.
```

See the next section for example commonds.

Also, the bluealsa [man page](https://github.com/Arkq/bluez-alsa/blob/master/doc/bluealsa.8.rst) can be read more to understand the options.

NOTE: beware of any examples with the `-B` option. It registers the DBUS name under a different name instead of `org.bluealsa`, which means that `bluealsa-aplay` won't be able to find it by default

## setting a playback device

Setting your profile is important. Via [man](https://github.com/Arkq/bluez-alsa/blob/master/doc/bluealsa.8.rst):

```
The list of profile _NAME_\-s accepted by the `--profile=NAME` option:

-   **a2dp-source** - Advanced Audio Source (streaming audio to connected device)
-   **a2dp-sink** - Advanced Audio Sink (receiving audio from connected device)
-   **hfp-ofono** - Hands-Free handled by oFono
-   **hfp-hf** - Hands-Free
-   **hfp-ag** - Hands-Free Audio Gateway
-   **hsp-hs** - Headset
-   **hsp-ag** Headset Audio Gateway
```

so run:

```
sudo bluealsa -p a2dp-source
```

Now you can check what BT audio PCMs (`-L`) and BT audio devices (`-l`)  are available:

```
$ bluealsa-aplay -L
bluealsa:SRV=org.bluealsa,DEV=F4:4E:FD:EC:28:63,PROFILE=a2dp
    Jam Live Loud, trusted audio-card, playback
    A2DP (SBC): S16_LE 2 channels 44100 Hz
$ bluealsa-aplay -l
**** List of PLAYBACK Bluetooth Devices ****
hci0: F4:4E:FD:EC:28:63 [Jam Live Loud], trusted audio-card
  A2DP (SBC): S16_LE 2 channels 44100 Hz
**** List of CAPTURE Bluetooth Devices ****
```

So it should be possible to play stuff:

```
aplay -D org.bluealsa:DEV=F4:4E:FD:EC:28:63,PROFILE=a2dp ~/Music/test.wav
```

Currently I can't tho :)

### NOTE: this section is kind of outdated - but good for harvesting notes

current progress

i've spent HOURS on this shit below and I can't get it to work

THe commands I believe are correct, but I think the fact that the service:
- does not start at startup

is a bad sign

#### start bluealsa service

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



#### connect to the device
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

even though the above seems to fail - you can see that by running those commands manually, the named device now shows up in the GUI application`blueman-assistant`, but it still has a problem connecting

I have noticed that if I keep `bluetoothctl` running, and turn off my bluetooth device, and turn it on again, it does connect... but disconnects a few moments later:

```
[nix-shell:~]$ sudo bluetoothctl 
[sudo] password for aaron: 
Agent registered
[CHG] Device F4:4E:FD:EC:28:63 Connected: yes
[CHG] Device F4:4E:FD:EC:28:63 Connected: no
[bluetooth]#
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

# channels
## add the hardware channel

	$ sudo nix-channel --add https://github.com/NixOS/nixos-hardware/archive/master.tar.gz nixos-hardware
	$ sudo nix-channel --update

see [here](https://github.com/NixOS/nixos-hardware)

## moving to the unstable channel

there are channels for both:
- nixos: 
- nixpkgs: 

list current channels:

```
$ sudo nix-channel --list                                           
nixos https://nixos.org/channels/nixos-20.09
nixpkgs https://nixos.org/channels/nixpkgs-unstable
```

remove existing `20.09` channel:

```
nix-channel --remove nixos
```

add new one:

```
$ nix-channel --add https://nixos.org/channels/nixos-unstable nixos
$ nix-channel --list                                               
nixos https://nixos.org/channels/nixos-unstable
nixpkgs https://nixos.org/channels/nixpkgs-unstable
```

update your channels:

```
nixos-channel --update
```

upgrade:

```
nixos-rebuild switch --upgrade
```

see https://nixos.org/manual/nixos/stable/index.html#sec-upgrading

# see also

a gred nixos playlist on youtube (thank you Fred): https://www.youtube.com/playlist?list=PLRGI9KQ3_HP_OFRG6R-p4iFgMSK1t5BHs
