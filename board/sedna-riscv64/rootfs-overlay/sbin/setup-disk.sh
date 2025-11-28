#!/bin/sh -e

if [ "$(id -u)" != 0 ]; then
    printf 'This must be run as root.\n'
    exit 1
fi

if [ -z "$1" ]; then
    printf 'usage: %s <drive>\n' "${0##*/}"
    exit 1
elif ! [ -e "$1" ]; then
    printf 'Drive %s not found.\n' "$1"
    exit 1
fi

printf 'This will destroy all data on %s.\n' "$1"
read -r -p "Are you sure? [y/N] " response

case $response in
    [Yy]) ;;
    *) exit 1 ;;
esac

mkfs.ext2 "$1"
tmpdir=$(mktemp -d)
mkdir "$tmpdir/mnt"
mount "$1" "$tmpdir/mnt"
mkdir "$tmpdir/mnt/upper"
mkdir "$tmpdir/mnt/work"
umount "$tmpdir/mnt"

printf 'A reboot is required to use this drive.\n'
read -r -p "Reboot now? [Y/n] " response

case $response in
    [Nn]) exit 0 ;;
    *) reboot ;;
esac
