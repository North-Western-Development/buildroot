#!/bin/sh -x
scriptdir="$(realpath "${0%/*}")"
cd "$scriptdir" || { printf '%s\n' 'Failed to cd to the scripts directory'; exit 1; }
make -C ..
export PATH="$scriptdir/../output/host/bin:$PATH"

rm -rf tccsrc sdk
wget -O- https://repo.or.cz/tinycc.git/snapshot/ebaa5c81f43fc7963ee50fbb01729290e2349aa5.tar.gz | tar -xz
mv tinycc-* tccsrc

(
cd tccsrc || { printf '%s\n' 'Failed to cd to tcc source directory'; exit 1; }
patch -p0 < ../fix-riscv64-link.patch
./configure --prefix=/opt/sdk --cpu=riscv64 --crtprefix=/opt/sdk/lib --sysincludepaths=/opt/sdk/lib/tcc/include:/opt/sdk/include --cross-prefix=riscv64-linux- --elfinterp=/lib/ld-musl-riscv64.so.1 --extra-cflags="-Os -DTCC_LIBTCC1='\\\"\\\"' -DTCC_LIBGCC='\\\"libgcc_s.so.1\\\"'" --config-musl --with-libgcc --config-backtrace=no --config-bcheck=no --config-predefs=no
make XCC=riscv64-linux-gcc XAR=riscv64-linux-ar CONFIG_strip=no
export DESTDIR="$scriptdir/sdk"
make install CONFIG_strip=no
rm -rf "$DESTDIR/opt/sdk/lib/libtcc.a" "$DESTDIR/opt/sdk/include" "$DESTDIR/opt/sdk/share" "$DESTDIR/opt/sdk/lib/tcc/libtcc1.a" "$DESTDIR/opt/sdk/lib/tcc/runmain.o"
riscv64-linux-strip "$DESTDIR/opt/sdk/bin/tcc"
sysrootdir="$scriptdir/../output/host/riscv64-buildroot-linux-musl/sysroot"
cp -a "$sysrootdir/usr/include" "$DESTDIR/opt/sdk"
cp "$sysrootdir/lib/crt1.o" "$sysrootdir/lib/crti.o" "$sysrootdir/lib/crtn.o" "$DESTDIR/opt/sdk/lib"
cd "$DESTDIR/opt/sdk/include" || { printf '%s\n' 'Failed to cd to sdk include directory'; exit 1; }
rm -rf asm asm-generic drm linux misc mtd rdma regulator scsi sound video xen
)
mv sdk/opt/sdk/* sdk
rm -r sdk/opt
tar --owner=0 --group=0 -cJf sdk.tar.xz -C sdk bin include lib
