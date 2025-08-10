################################################################################
#
# tinycc
#
################################################################################

TINYCC_VERSION = fa9795406d4f6579d95e1333bde27cf437023fe4
TINYCC_SITE = https://repo.or.cz/tinycc.git/snapshot
TINYCC_SOURCE = $(TINYCC_VERSION).tar.gz
TINYCC_LICENSE = LGPL-2.1
TINYCC_LICENSE_FILES = COPYING

TINYCC_INSTALL_STAGING = YES

TINYCC_CFLAGS = $(TARGET_CFLAGS)

TINYCC_COMMON_FLAGS = CONFIG_strip=no

TINYCC_CFLAGS += -DTCC_LIBTCC1='\\\"\\\"'
TINYCC_CFLAGS += -DTCC_LIBGCC='\\\"libgcc_s.so.1\\\"'

define TINYCC_CONFIGURE_CMDS
	(cd $(@D); \
		$(TARGET_CONFIGURE_OPTS) \
		./configure \
			--prefix="/usr" \
			--libdir="/usr/lib" \
			--crtprefix="/usr/lib" \
			--cpu=riscv64 \
			--cc="$(TARGET_CC)" \
			--ar="$(TARGET_AR)" \
			--extra-cflags="$(TINYCC_CFLAGS)" \
			--extra-ldflags="$(TARGET_LDFLAGS)" \
			--elfinterp=/lib/ld-musl-riscv64.so.1 \
			--config-musl \
			--with-libgcc \
			--config-backtrace=no \
			--config-bcheck=no \
			--config-predefs=no \
	)
endef

define TINYCC_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) XCC=$(TARGET_CC) XAR=$(TARGET_AR) -C $(@D) $(TINYCC_COMMON_FLAGS)
endef

define TINYCC_INSTALL_STAGING_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) DESTDIR="$(STAGING_DIR)" -C $(@D) install $(TINYCC_COMMON_FLAGS)
endef

define TINYCC_INSTALL_TARGET_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) DESTDIR="$(TARGET_DIR)" -C $(@D) install $(TINYCC_COMMON_FLAGS)
	cp "$(STAGING_DIR)/lib"/*.o "$(TARGET_DIR)/usr/lib"
	rm "$(TARGET_DIR)/usr/lib/tcc/libtcc1.a"
endef

$(eval $(generic-package))
