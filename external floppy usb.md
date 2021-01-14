# mounting

you should see a `sda` device appear as soon as you insert a floppy:

```
 aaron@nixos  /proc/scsi  lsblk
NAME                   MAJ:MIN RM   SIZE RO TYPE MOUNTPOINT
loop0                    7:0    0   100G  0 loop 
└─docker-0:29-184-pool 254:0    0   100G  0 dm   
loop1                    7:1    0     2G  0 loop 
└─docker-0:29-184-pool 254:0    0   100G  0 dm   
sda                      8:0    1   1.4M  0 disk 
nvme0n1                259:0    0 238.5G  0 disk 
├─nvme0n1p1            259:1    0   238G  0 part 
└─nvme0n1p2            259:2    0   511M  0 part /
```

Mount that directly, I don't think floppies have partiions:

```
$ sudo mount /dev/sda /mnt
```