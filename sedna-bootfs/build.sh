#!/bin/sh
cd "$(realpath "${0%/*}")" || { printf '%s\n' "Failed to cd to the script's directory"; exit 1; }
[ -d ../output/host ] || make -C ..

export PATH="$PWD/../output/host/bin:$PATH"

busyboxver='1.37.0'
rm -rf busyboxsrc bootfs bootfs.squashfs
cp -a "../output/build/busybox-$busyboxver" busyboxsrc
cp busybox.config busyboxsrc/.config

(
cd busyboxsrc
make clean
make -j"$(nproc)"
)

mkdir -p bootfs/bin bootfs/proc bootfs/dev/pts bootfs/sys bootfs/mnt/scratch bootfs/mnt/builtin bootfs/mnt/upper bootfs/mnt/lower bootfs/sbin bootfs/newroot

cp busyboxsrc/busybox bootfs/bin
cp init bootfs/sbin
mksquashfs bootfs bootfs.squashfs -all-root -comp zstd
