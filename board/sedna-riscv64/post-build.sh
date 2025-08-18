#!/bin/sh
rm -f "$TARGET_DIR/var/lib/dpkg/info/.keep" "$TARGET_DIR/etc/bashrc.d/.keep" "$TARGET_DIR/etc/resolv.conf" "$TARGET_DIR/home/.keep" "$TARGET_DIR/etc/init.d/S40xorg"
cp -a "$STAGING_DIR/usr/include" "$TARGET_DIR/usr"
cp os-release "$TARGET_DIR/usr/lib"
