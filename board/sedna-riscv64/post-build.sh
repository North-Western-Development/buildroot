#!/bin/sh
rm -f "$TARGET_DIR/var/lib/dpkg/info/.keep" "$TARGET_DIR/etc/resolv.conf"
cp -a "$STAGING_DIR/usr/include" "$TARGET_DIR/usr"
