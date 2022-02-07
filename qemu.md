# quickemu

> Quickly create and run optimised Windows, macOS and Linux desktop virtual machines.

https://news.ycombinator.com/item?id=28797129

usage:

	# get a vm	
	quickget ubuntu-mate impish
	# start
	quickemu --vm ubuntu-mate-impish.conf

shortcuts:

- Shift+F11 for fullscreen
- Shift+F12 to un-fullscreen

#  Live CDs / Boot CDs (installation)

## Reactos

### live cd
get the livecd: https://reactos.org/getbuilds/

start it:

	$ ISO=~/Downloads/reactos-livecd-0.4.15-dev-2770-g13073e1-x86-gcc-lin-dbg.iso
	$ DISK=~/qemu_disk_images/ReactOS.qcow2
	$ qemu-system-i386 -m 64M -drive if=ide,index=2,media=cdrom,file=$ISO

### boot cd

create disk:

	$ qemu-img create -f qcow2  $DISK 1200M

install:
	
	qemu-system-i386 -m 1G -drive if=ide,index=0,media=disk,file=$ISO -boot order=d -serial file:ReactOS.log

see https://reactos.org/wiki/QEMU

## windows 7

	$ ISO=~/Downloads/en_windows_7_ultimate_with_sp1_x64_dvd_u_677332.iso
	$ DISK=~/qemu_disk_images/win7.qcow2
	$ qemu-img create -f qcow2 $DISK 15G
	
	$ qemu-system-x86_64 -m 2G -cdrom $ISO -boot d $DISK


# windows 10
## creating a disk image

You need this if you want to install to disk:

	$ ISO=~/Downloads/en_windows_10_multiple_editions_x64_dvd_6846432.iso
	$ DISK=~/qemu_disk_images/win10.qcow2
	qemu-img create -f qcow2 $DISK 20G

> **qcow2** - The file format we are using, in this case qcow2. qcow2 is the recommended since it is dynamically allocated - e.g. it only allocates space when needed, but at a (pretty much) unnoticeable speed loss. There are many other file formats, which will be listed below.

You can also create virtualbox-compatible disk images if you like. For a list of file formats see [here](https://computernewb.com/wiki/How_to_create_a_disk_image_in_QEMU)

## running the ISO
	
To give the ISO the disk you created earlier:

	qemu-system-x86_64 -m 2G -cdrom $ISO -boot d $DISK