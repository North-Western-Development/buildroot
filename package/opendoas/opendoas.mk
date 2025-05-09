################################################################################
#
# opendoas
#
################################################################################

OPENDOAS_VERSION = 6.8.2
OPENDOAS_SITE = https://github.com/Duncaen/OpenDoas/releases/download/v$(OPENDOAS_VERSION)
OPENDOAS_SOURCE = opendoas-$(OPENDOAS_VERSION).tar.xz
OPENDOAS_LICENSE = MIT
OPENDOAS_LICENSE_FILES = LICENSE

OPENDOAS_CFLAGS = $(TARGET_CFLAGS)

define OPENDOAS_CONFIGURE_CMDS
	(cd $(@D); \
		$(TARGET_CONFIGURE_OPTS) \
		./configure \
			--prefix="/usr" \
			--with-timestamp \
	)
endef

define OPENDOAS_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) CC=$(TARGET_CC) -C $(@D)
endef

define OPENDOAS_INSTALL_TARGET_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) DESTDIR="$(TARGET_DIR)" -C $(@D) install
	printf 'permit nopass 0\npermit persist :wheel\n' > "$(TARGET_DIR)/etc/doas.conf"
	chmod 640 "$(TARGET_DIR)/etc/doas.conf"
endef

$(eval $(generic-package))
