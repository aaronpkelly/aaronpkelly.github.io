# booting and installing a win10 iso
## creating a disk image

You need this if you want to install to disk:

	qemu-img create -f qcow2 win10.img 15G

> **qcow2** - The file format we are using, in this case qcow2. qcow2 is the recommended since it is dynamically allocated - e.g. it only allocates space when needed, but at a (pretty much) unnoticeable speed loss. There are many other file formats, which will be listed below.

You can also create virtualbox-compatible disk images if you like. For a list of file formats see [here](https://computernewb.com/wiki/How_to_create_a_disk_image_in_QEMU)

## running the ISO

First, to test that the ISO works:

	qemu-system-x86_64 -m 2G -cdrom Win10Pro.iso
	
To give the ISO the disk you created earlier:

	qemu-system-x86_64 -m 2G -cdrom Win10Pro.iso -boot d win10.img