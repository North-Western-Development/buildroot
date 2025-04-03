#!/bin/sh
cd "$(realpath "${0%/*}")" || { printf '%s\n' "Failed to cd to the script's directory"; exit 1; }
[ -d ../output/host ] || make -C ..

mkdir -p sysroot/usr
cp -a ../output/staging/usr/include sysroot/usr
cp -a ../output/staging/usr/lib sysroot/usr
cp -a ../output/staging/lib sysroot
rm -f sysroot/lib/*.a sysroot/usr/lib/*.a
tar --owner=0 --group=0 -cJf sysroot.tar.xz sysroot
