#!/bin/sh
rm -f "$TARGET_DIR/var/lib/dpkg/info/.keep" "$TARGET_DIR/etc/bashrc.d/.keep" "$TARGET_DIR/etc/resolv.conf"
cp -a "$STAGING_DIR/usr/include" "$TARGET_DIR/usr"
cp os-release "$TARGET_DIR/usr/lib"
sed -i '/^root/s|/bin/sh|/bin/bash|' "$TARGET_DIR/etc/passwd"
