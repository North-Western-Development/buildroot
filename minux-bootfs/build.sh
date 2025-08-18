#!/bin/sh -e
cd "$(realpath "${0%/*}")"
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
for applet in sh mkdir mount umount chroot; do
    ln -s busybox "bootfs/bin/$applet"
done
cp init bootfs/sbin
mksquashfs bootfs bootfs.squashfs -all-root -comp zstd
