# Live USB ISO that runs docker
SOLUTION FOUND - use a different storage driver for live isos. see below

# How to get around aufs error
https://docs.docker.com/storage/storagedriver/device-mapper-driver/
https://stackoverflow.com/questions/30248794/run-docker-in-ubuntu-live-disk

## !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
## XFCE does not have a wifi manager !
## !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
So don't download any distros with it

## debian
testing now

## gentoo
success - was about to build docker from source (jeez), but this took a long time

## Manjaro
awesome - bit strange, maybe good?
architect - install only, couldn't boot a desktop
i3 - really liked it, but no docker
xfce - wifi didn't work out of the box

## Mint
need to retest, I previously used xfce (no wifi)

## project atomic
untested

## RancherOS
untested

## Ubuntu core
untested
