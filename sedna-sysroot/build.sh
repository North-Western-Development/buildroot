#!/bin/sh
cd "$(realpath "${0%/*}")" || { printf '%s\n' "Failed to cd to the script's directory"; exit 1; }
[ -d ../output/host ] || make -C ..

mkdir -p sysroot/usr
cp -a ../output/staging/usr/include sysroot/usr
cp -a ../output/staging/usr/lib sysroot/usr
cp -a ../output/staging/lib sysroot
cp ../output/host/lib/gcc/riscv64-buildroot-linux-musl/*/crtbegin*.o ../output/host/lib/gcc/riscv64-buildroot-linux-musl/*/crtend*.o ../output/host/lib/gcc/riscv64-buildroot-linux-musl/*/libgcc.a sysroot/lib
rm -f sysroot/usr/lib/*.a sysroot/lib/libatomic.a sysroot/lib/libc.a
tar --owner=0 --group=0 -cJf sysroot.tar.xz sysroot
