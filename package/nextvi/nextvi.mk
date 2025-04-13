################################################################################
#
# nextvi
#
################################################################################

NEXTVI_VERSION = 78a5ea269c1e1b5d18c0acc9e138476385ab1c3a
NEXTVI_SITE = https://github.com/Un1q32/nextvi/archive
NEXTVI_SOURCE = $(NEXTVI_VERSION).tar.gz
NEXTVI_LICENSE = MIT

define NEXTVI_BUILD_CMDS
	"$(TARGET_CC)" $(TARGET_CFLAGS) -D_POSIX_C_SOURCE=200809L -flto $(@D)/vi.c -o "$(TARGET_DIR)/bin/vi"
endef

$(eval $(generic-package))
