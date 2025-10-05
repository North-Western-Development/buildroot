################################################################################
#
# nextvi
#
################################################################################

NEXTVI_VERSION = ae7437c6f7e22266317c0f5ae11f2b65a783f64a
NEXTVI_SITE = https://github.com/Un1q32/nextvi/archive
NEXTVI_SOURCE = $(NEXTVI_VERSION).tar.gz
NEXTVI_LICENSE = ISC
NEXTVI_LICENSE_FILES = LICENSE

define NEXTVI_BUILD_CMDS
	"$(TARGET_CC)" $(TARGET_CFLAGS) -D_POSIX_C_SOURCE=200809L -flto $(@D)/vi.c -o "$(TARGET_DIR)/bin/vi"
	printf '#!/bin/sh\nexec /bin/vi -e "$$@"' > "$(TARGET_DIR)/bin/ex"
	printf '#!/bin/sh\nexec /bin/vi -R "$$@"' > "$(TARGET_DIR)/bin/view"
	chmod +x "$(TARGET_DIR)/bin/ex" "$(TARGET_DIR)/bin/view"
endef

$(eval $(generic-package))
