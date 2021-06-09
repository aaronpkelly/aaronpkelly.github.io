# choosing an upstream DNS
a great tool: https://github.com/cleanbrowsing/dnsperftest 

output:

					  test1   test2   test3   test4   test5   test6   test7   test8   test9   test10  Average 
	127.0.0.53        1 ms    1 ms    1 ms    1 ms    20 ms   1 ms    1 ms    1 ms    1 ms    1 ms      2.90
	cloudflare        13 ms   13 ms   17 ms   14 ms   15 ms   14 ms   14 ms   17 ms   14 ms   16 ms     14.70
	level3            28 ms   28 ms   24 ms   31 ms   29 ms   28 ms   28 ms   24 ms   25 ms   30 ms     27.50
	google            15 ms   19 ms   31 ms   14 ms   15 ms   108 ms  34 ms   71 ms   16 ms   29 ms     35.20
	quad9             12 ms   19 ms   16 ms   15 ms   13 ms   336 ms  19 ms   25 ms   16 ms   42 ms     51.30
	freenom           32 ms   36 ms   36 ms   41 ms   46 ms   33 ms   32 ms   38 ms   33 ms   42 ms     36.90
	opendns           22 ms   16 ms   15 ms   15 ms   24 ms   45 ms   13 ms   27 ms   15 ms   110 ms    30.20
	norton            27 ms   27 ms   26 ms   26 ms   24 ms   22 ms   24 ms   25 ms   25 ms   30 ms     25.60
	cleanbrowsing     23 ms   27 ms   28 ms   23 ms   26 ms   25 ms   26 ms   23 ms   25 ms   24 ms     25.00
	yandex            57 ms   57 ms   83 ms   77 ms   59 ms   59 ms   63 ms   65 ms   62 ms   60 ms     64.20
	adguard           36 ms   35 ms   32 ms   29 ms   159 ms  34 ms   34 ms   34 ms   33 ms   38 ms     46.40
	neustar           29 ms   26 ms   24 ms   26 ms   26 ms   25 ms   31 ms   26 ms   23 ms   23 ms     25.90
	comodo            23 ms   59 ms   27 ms   22 ms   60 ms   52 ms   72 ms   56 ms   27 ms   26 ms     42.40
	
cloudflare wins!

Previously I had been using nextdns, but that was a bit overkill (twice the amount of overhead with respect to whitelists+blacklists+unblocking things)

# installation end messages

	Configure your devices to use the Pi-hole as their DNS server

	IPv4:        192.168.0.59
	IPv6:        2a02:8084:20c2:c180:c520:4c71:2efa:a80f
	If you set a new IP address, you should restart the Pi.

	View the web interface at http://pi.hole/admin or
	  http://192.168.0.59/admin  

	  Your Admin Webpage login password is ****


# updating
to update the system:

	$ pihole -up

to update gravity:

	$ pihole -g

# filesystem corruption

## reinstall new raspbian image

if you are copying a raspbian image, you don't need to make a partition table + filesystem. Just use:

	dd if=2021-03-04-raspios-buster-armhf-lite.img \
		of=/dev/sdX \
		bs=4M \
		conv=fsync \
		status=progress

## no, I want to wipe the whole SD card, and make a partition table + filesystem

Ok... so wipe the entire disk (fsync  flushes to disk any data written to this file. The fsync call doesn't return until the data has physically been written), this means you don't have to run the `sync` command afterward:
	
	sudo dd \
		if=/dev/zero \
		of=/dev/sdX \
		bs=4M \
		conv=fsync
	
make a partition table:

	$ parted
	$ (parted) help mklabel
	LABEL-TYPE is one of: aix, amiga, bsd, dvh, gpt, mac, msdos, pc98, sun, atari, loop

The above command was taken from here: https://www.raspberrypi.org/documentation/installation/installing-images/linux.md

 As for making the file system, have a look at all available partition tables by typing `mkfs.` and pressing tab:

	mkfs.bfs     mkfs.cramfs  mkfs.ext2    mkfs.ext3    mkfs.ext4    mkfs.fat     mkfs.minix   mkfs.msdos   mkfs.vfat 

And create it. `ext4` is great for linux

	sudo mkfs.ext4 /dev/sdX

## seeing the signs of corruption
you may see this:

	$ dmesg
	[  438.977328] JBD2: Spotted dirty metadata buffer (dev = mmcblk0p2, blocknr = 0). There's a risk of filesystem corruption in case of system crash.
	[  439.141268] EXT4-fs (mmcblk0p2): pa a5b53570: logic 0, phys. 380928, len 2048
	[  439.150658] JBD2: Spotted dirty metadata buffer (dev = mmcblk0p2, blocknr = 0). There's a risk of filesystem corruption in case of system crash.
	[  440.716244] JBD2: Spotted dirty metadata buffer (dev = mmcblk0p2, blocknr = 0). There's a risk of filesystem corruption in case of system crash.
	[  475.568695] EXT4-fs error: 3 callbacks suppressed
	[  475.568710] EXT4-fs error (device mmcblk0p2): ext4_mb_generate_buddy:747: group 16, block bitmap and bg descriptor inconsistent: 23472 vs 23471 free clusters
	[  475.699099] JBD2: Spotted dirty metadata buffer (dev = mmcblk0p2, blocknr = 0). There's a risk of filesystem corruption in case of system crash.
	[  646.478596] EXT4-fs error (device mmcblk0p2): __ext4_new_inode:1114: comm cron: failed to insert inode 42177: doubly allocated?
	[  677.282191] EXT4-fs error (device mmcblk0p2) in ext4_free_inode:355: Corrupt filesystem
	[  677.299878] EXT4-fs error (device mmcblk0p2) in ext4_free_inode:355: Corrupt filesystem
	[  677.340999] EXT4-fs error (device mmcblk0p2) in ext4_free_inode:355: Corrupt filesystem
	[  677.358940] EXT4-fs error (device mmcblk0p2) in ext4_free_inode:355: Corrupt filesystem
	[  677.366161] EXT4-fs error (device mmcblk0p2) in ext4_free_inode:355: Corrupt filesystem

as raspbian uses systemd, add this to _/boot/cmdline.txt_ to force a repair of your filesystem:

	fsck.mode=force fsck.repair=yes

normally, you could just do this on non-systemd systems (but not in this case):

	touch /forcefsck
	
# sqlite database (gravity)
## fixing corruption
if you database is corrupted, just delete it, re-add your blocklists, and update your database again:

	$ sudo rm /etc/pihole/gravity.db
	$ sudo rm /etc/pihole/gravity.db_temp
	$ # add blocklists
	$ pihole -g
	
	pi@raspberrypi:~ $ pihole -g
	  [i] Neutrino emissions detected...
	  [✓] Pulling blocklist source list into range

	  [✓] Preparing new gravity database
	  [i] Using libz compression

	  [i] Target: https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/fakenews-gambling-porn-social/hosts
	  [✓] Status: Retrieval successful
	  [i] Analyzed 114107 domains
	sha1sum: /etc/pihole/list.1.raw.githubusercontent.com.domains.sha1: no properly formatted SHA1 checksum lines found
	  [i] List has been updated

	  [i] Target: https://www.github.developerdan.com/hosts/lists/ads-and-tracking-extended.txt
	  [✓] Status: Retrieval successful
	  [i] Analyzed 356890 domains

	  [i] Target: https://www.github.developerdan.com/hosts/lists/facebook-extended.txt
	  [✓] Status: Retrieval successful
	  [i] Analyzed 21587 domains

	  [i] Target: https://www.github.developerdan.com/hosts/lists/amp-hosts-extended.txt
	  [✓] Status: Retrieval successful
	  [i] Analyzed 11218 domains

	  [i] Target: https://www.github.developerdan.com/hosts/lists/hate-and-junk-extended.txt
	  [✓] Status: Retrieval successful
	  [i] Analyzed 1393 domains
	sha1sum: /etc/pihole/list.5.www.github.developerdan.com.domains.sha1: no properly formatted SHA1 checksum lines found
	  [i] List has been updated

	  [✓] Storing downloaded domains in new gravity database
	  [✓] Building tree
	  [✓] Swapping databases
	  [i] Number of gravity domains: 505195 (495233 unique domains)
	  [i] Number of exact blacklisted domains: 0
	  [i] Number of regex blacklist filters: 0
	  [i] Number of exact whitelisted domains: 0
	  [i] Number of regex whitelist filters: 0
	  [✓] Flushing DNS cache
	  [✓] Cleaning up stray matter

	  [✓] DNS service is listening
		 [✓] UDP (IPv4)
		 [✓] TCP (IPv4)
		 [✓] UDP (IPv6)
		 [✓] TCP (IPv6)

	  [✓] Pi-hole blocking is enabled
	pi@raspberrypi:~ $ 
	
