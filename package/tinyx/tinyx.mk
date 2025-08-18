################################################################################
#
# diffutils
#
################################################################################

TINYX_VERSION = feab72ca891bc04b18763763e15ee4e532369cdf
TINYX_SOURCE = $(TINYX_VERSION).tar.gz
TINYX_SITE = https://github.com/tinycorelinux/tinyx/archive
TINYX_LICENSE = GPL-3.0
TINYX_LICENSE_FILES = COPYING
TINYX_AUTORECONF = YES
TINYX_DEPENDENCIES = xlib_libXfont xlib_libXtst

define TINYX_SYMLINK_X
	ln -sf Xfbdev $(TARGET_DIR)/usr/bin/X
endef

TINYX_POST_INSTALL_TARGET_HOOKS += TINYX_SYMLINK_X

$(eval $(autotools-package))
