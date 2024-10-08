#!/bin/sh
cd "$(realpath "${0%/*}")" || { printf '%s\n' 'Failed to cd to the scripts directory'; exit 1; }
[ -d ../output/host ] || make -C ..

cp -a ../output/host/riscv64-buildroot-linux-musl/sysroot/usr/include .
cd include || { printf '%s\n' 'Failed to cd to include directory'; exit 1; }
rm -rf asm asm-generic drm linux misc mtd rdma regulator scsi sound video xen
tar --owner=0 --group=0 -cJf ../headers.tar.xz ./*
