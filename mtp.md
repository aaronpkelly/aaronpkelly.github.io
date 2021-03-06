# getting started
if you just want to communicate with the device, install `libmtp`

then as `root` user, check you can contact the device using `mtp-detect`:

```
[nix-shell:/home/aaron/dump]# mtp-detect | head
libmtp version: 1.1.17

Listing raw device(s)
Device 0 (VID=041e and PID=4152) is a Creative ZEN V Plus.
   Found 1 device(s):
   Creative: ZEN V Plus (041e:4152) @ bus 1, dev 37
Attempting to connect device(s)
USB low-level info:
   bcdUSB: 512
   bDeviceClass: 25
...
```

and `mtp-connect`:

```
[nix-shell:/home/aaron/dump]# mtp-connect
libmtp version: 1.1.17

Device 0 (VID=041e and PID=4152) is a Creative ZEN V Plus.
Usage: connect <command1> <command2>
Commands: --delete [filename]
          --sendfile [source] [destination]
          --sendtrack [source] [destination]
          --getfile [source] [destination]
          --newfolder [foldername
```

# dumping all files

I did find a perl script: https://github.com/grepwood/mtp-dump

But I wrote a python script and it works much better

```
import subprocess

rst = subprocess.run('mtp-files', capture_output=True, text=True)

file_id = ''
filename = ''

for line in rst.stdout.split('\n'):

    if 'File ID' in line:
        file_id = line.split(' ')[2]

    if 'Filename' in line:
        filename = line.split(' ')[4:]

        filename_join = ' '.join(filename)

        print('running: mtp-getfile {} {}'.format(file_id, filename_join))

        stdout = subprocess.run(['mtp-getfile', file_id, filename_join], capture_output = True)
        print(stdout)
```