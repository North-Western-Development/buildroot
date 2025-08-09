#!/bin/sh
cd "$(realpath "${0%/*}")" || { printf '%s\n' "Failed to cd to the script's directory"; exit 1; }
[ -f output/images/rootfs.cramfs ] || make
[ -f sedna-bootfs/bootfs.squashfs ] || sedna-bootfs/build.sh
qemu-system-riscv64 -M virt -m 64M -nographic -bios output/images/fw_jump.bin -kernel output/images/Image -drive file=sedna-bootfs/bootfs.squashfs,format=raw,if=none,id=hd0 -device virtio-blk-device,drive=hd0 -drive file=output/images/rootfs.cramfs,format=raw,if=none,id=hd1 -device virtio-blk-device,drive=hd1 -append "root=/dev/vda rw" #-drive file=disk.img,format=raw,if=none,id=hd2 -device virtio-blk-device,drive=hd2
