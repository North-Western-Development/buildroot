################################################################################
#
# nextvi
#
################################################################################

NEXTVI_VERSION = 692f686b8845a0128bb61fbe57f2e2aa0c6ca94b
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
