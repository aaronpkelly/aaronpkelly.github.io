#!/bin/bash
set -x
function pause () {
	read -p "$*"
}
pause "Create an clean environment by nuking .bash_profile"
cat > ~/.bash_profile << "EOF"

pause "Set three new global environment variables"
exec env -i HOME=$HOME TERM=$TERM PS1='\u:\w\$ ' /bin/bash
EOF

pause "Create the .bashrc file"
cat > ~/.bashrc << "EOF"
set +h
umask 022
LFS=/mnt/lfs
LC_ALL=POSIX
LFS_TGT=$(uname -m)-lfs-linux-gnu
PATH=/tools/bin:/bin:/usr/bin
export LFS LC_ALL LFS_TGT PATH
EOF

pause "Source the bash profile"
source ~/.bash_profile
