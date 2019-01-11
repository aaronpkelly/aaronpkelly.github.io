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