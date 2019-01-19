#!/bin/bash
set -x

printf "Hello and welcome to my Linux from Scratch shell script!\n"
printf "The purpose of this script is to make it easier to get started with\n"
printf "working on the LFS system by automatically creating users and setting\n"
printf "environment variables.\n"
printf "Please make sure you have read the LFS book from chapters 1-4"
printf "Please make sure you have downloaded all sources and patches into the\n"
printf "\sources directory\n"
printf "********"
printf "Please make sure you have met all host system requirements:"
printf "http://linuxfromscratch.org/lfs/view/stable/prologue/hostreqs.html"
printf "... you will get errors otherwise!"
printf "********"
printf "This script will now begin at Chapter 4. Final preparations...\n\n"

function pause() {
	read -p "$*"
}

printf "Note!!!\n"
printf "Please make sure that you have mounted the lfs filesystem to /mnt/lfs\n"
pause "Setting \$LFS variable to /mnt/lfs..."
export LFS=/mnt/lfs

pause "Creating symbolic links, target: $LFS/tools, source: /..."
ln -sv $LFS/tools /

pause "Adding group lfs..."
groupadd lfs

pause "Adding user lfs to group lfs and setting some other variables..."
useradd -s /bin/bash -g lfs -m -k /dev/null lfs

pause "Please set a password for the user lfs..."
passwd lfs

pause "Changing ownership of $LFS/tools and $LFS/sources to the user lfs..."
chown -v lfs $LFS/tools
chown -v lfs $LFS/sources

pause "Logging in as the user lfs..."
su - lfs

printf "You should be now logged in as the user lfs! Please run the next part of the script which deals with setting bash and environment variables!\n"
