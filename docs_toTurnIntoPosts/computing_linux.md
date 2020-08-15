# amazing linux commands
via: https://raw.githubusercontent.com/engineer-man/youtube/master/058/commands.sh

1. redo last command but as root
`sudo !!`

2. open an editor to run a command
`ctrl+x+e`

3. create a super fast ram disk
```
mkdir -p /mnt/ram
mount -t tmpfs tmpfs /mnt/ram -o size=8192M
```

4. don't add command to history (note the leading space)
` ls -l`

5. fix a really long command that you messed up
`fc`

6. tunnel with ssh (local port 3337 -> remote host's 127.0.0.1 on port 6379)
`ssh -L 3337:127.0.0.1:6379 root@emkc.org -N`

7. quickly create folders
`mkdir -p folder/{sub1,sub2}/{sub1,sub2,sub3}`

8. intercept stdout and log to file
`cat file | tee -a log | cat > /dev/null`

bonus: exit terminal but leave all processes running
`disown -a && exit`

# Changing terminal colours
LS_COLORS is terminal variable that influences the colours on the terminal, there's some git repos for changing that

# distros
## !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
## XFCE does not have a wifi manager !
## !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
So don't download any distros with it

# Manjaro
One of my favourite distros at the moment.

The _i3_ live usb version fits on a 2GB usb drive - perfect!

## Live distros
### Docker - getting it to work
Start the live USB with the 'non-free' drivers.
Install docker: `pacman -S docker`.
Stop the docker service: `sudo systemctl stop docker`

Create/edit _/etc/docker/daemon.json_, and add:
```
{
    "storage-driver": "devicemapper"
}
```
Then restart the docker service

## Window managers
awesome - bit strange, maybe good?
architect - install only, couldn't boot a desktop