#!/bin/bash
set -x
function pause() {
	read -p "$*"
}
pause "untar binutils outside of source directory..."
tar -xvf sources/binutils-2.24.tar.bz2 

pause "Rename to binutils-build directory..."
mv binutils-2.24 binutils-build

pause "Running ./configure with custom arguments..."
cd binutils-build
./configure \
    --prefix=/tools            \
    --with-sysroot=$LFS        \
    --with-lib-path=/tools/lib \
    --target=$LFS_TGT          \
    --disable-nls              \
    --disable-werror

pause "Running make..."
make

pause "Running make install..."
make install

printf "script finished!"
