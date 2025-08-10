#!/bin/sh
rm -f "$TARGET_DIR/etc/bashrc.d/.keep" "$TARGET_DIR/etc/resolv.conf" "$TARGET_DIR/home/.keep"
cp -a "$STAGING_DIR/usr/include" "$TARGET_DIR/usr"
cp os-release "$TARGET_DIR/usr/lib"
#printf '%s\n' '_apt:x:420:420:APT account for owning persistent & cache data:/var/lib/apt:/usr/sbin/nologin' >> "$TARGET_DIR/etc/passwd"
