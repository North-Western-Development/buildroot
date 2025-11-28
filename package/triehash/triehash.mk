################################################################################
#
# triehash
#
################################################################################

TRIEHASH_VERSION = 0.3-3
TRIEHASH_SITE = https://github.com/julian-klode/triehash/archive/refs/tags/debian
TRIEHASH_SOURCE = $(TRIEHASH_VERSION).tar.gz
TRIEHASH_LICENSE = MIT
TRIEHASH_LICENSE_FILES = LICENSE.md

define HOST_TRIEHASH_INSTALL_CMDS
	$(INSTALL) -m 0755 -D $(@D)/triehash.pl $(HOST_DIR)/bin/triehash
endef

$(eval $(host-generic-package))
