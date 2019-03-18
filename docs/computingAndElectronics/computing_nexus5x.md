# how i fixed my phone
general info about problem, but provided fix didn't work: https://www.xda-developers.com/nexus-5x-bootloop-fix-boot-phone/
- froze phone in freezer in order to boot into dev settings and enable oem unlocking
- downloaded the tools that are suggested in the article

then went here: https://forum.xda-developers.com/nexus-5x/general/nexus-5x-bootloop-death-blod-andorid-t3683926

downloaded the files for "November - 8.1":
- system image (bullhead-opm7.181105.004-factory-37df0288.zip)
- boot-fixed.img
- recovery-fixed.img

## start in fastboot mode
hold power+volume down

## unlock flashing
fastboot flashing unlock

## system image
unpack the zip
run `flash-all.bat`

## boot-fixed.img
go back into bootloader and run:
`fastboot flash boot boot-fixed.img`

## recovery-fixed.img
then run `fastboot flash recovery recovery-fixed.img`

## reboot
`fastboot reboot`

## recovery mode
go to the bootloader menu
start recovery mode
at the 'no command' screen, press power + volume up, then immediately release the volume up button while
still holding the power button, you will get a menu!
