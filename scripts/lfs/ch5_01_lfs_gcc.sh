#!/bin/bash
set -x
function pause() {
	read -p "$*"
}

pause "Extracting gcc..."
cd sources
tar -xvf gcc-4.8.2.tar.bz2
cd gcc-4.8.2

pause "Untarring and renaming directories..."
tar -Jxf ../mpfr-3.1.2.tar.xz
mv -v mpfr-3.1.2 mpfr
tar -Jxf ../gmp-5.1.3.tar.xz
mv -v gmp-5.1.3 gmp
tar -zxf ../mpc-1.0.2.tar.gz
mv -v mpc-1.0.2 mpc

pause "Changing the default location of GCC's default dynamic linker..."
for file in \
 $(find gcc/config -name linux64.h -o -name linux.h -o -name sysv4.h)
do
  cp -uv $file{,.orig}
  sed -e 's@/lib\(64\)\?\(32\)\?/ld@/tools&@g' \
      -e 's@/usr@/tools@g' $file.orig > $file
  echo '
#undef STANDARD_STARTFILE_PREFIX_1
#undef STANDARD_STARTFILE_PREFIX_2
#define STANDARD_STARTFILE_PREFIX_1 "/tools/lib/"
#define STANDARD_STARTFILE_PREFIX_2 ""' >> $file
  touch $file.orig
done

pause "Configure stack protection..."
sed -i '/k prot/agcc_cv_libc_provides_ssp=yes' gcc/configure

pause "Make a new directory for the build..."
mkdir -v ../gcc-build
cd ../gcc-build

pause "Prepare GCC for compilation..."
../gcc-4.8.2/configure                               \
    --target=$LFS_TGT                                \
    --prefix=/tools                                  \
    --with-sysroot=$LFS                              \
    --with-newlib                                    \
    --without-headers                                \
    --with-local-prefix=/tools                       \
    --with-native-system-header-dir=/tools/include   \
    --disable-nls                                    \
    --disable-shared                                 \
    --disable-multilib                               \
    --disable-decimal-float                          \
    --disable-threads                                \
    --disable-libatomic                              \
    --disable-libgomp                                \
    --disable-libitm                                 \
    --disable-libmudflap                             \
    --disable-libquadmath                            \
    --disable-libsanitizer                           \
    --disable-libssp                                 \
    --disable-libstdc++-v3                           \
    --enable-languages=c,c++                         \
    --with-mpfr-include=$(pwd)/../gcc-4.8.2/mpfr/src \
    --with-mpfr-lib=$(pwd)/mpfr/src/.libs

pause "Compile GCC by running make..."
make

pause "Install the package..."
make install

pause "Create a simlink to a needed file..."
ln -sv libgcc.a `$LFS_TGT-gcc -print-libgcc-file-name | sed 's/libgcc/&_eh/'`

printf "Script complete!\n"
