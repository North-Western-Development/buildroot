################################################################################
#
# dpkg
#
################################################################################

DPKG_VERSION = 1.22.21
DPKG_SITE = https://salsa.debian.org/dpkg-team/dpkg/-/archive/$(DPKG_VERSION)
DPKG_SOURCE = dpkg-$(DPKG_VERSION).tar.bz2
DPKG_DEPENDENCIES = host-perl host-gettext libmd $(if $(BR2_PACKAGE_ZLIB),zlib) $(if $(BR2_PACKAGE_BZIP2),bzip2) $(if $(BR2_PACKAGE_XZ),xz) $(if $(BR2_PACKAGE_ZSTD),zstd)
DPKG_LICENSE = GPL-2.0
DPKG_LICENSE_FILES = COPYING

define DPKG_AUTOCONF
	printf "$(DPKG_VERSION)" > $(@D)/.dist-version
	cd $(@D); $(AUTORECONF) -f
endef
DPKG_PRE_CONFIGURE_HOOKS += DPKG_AUTOCONF

DPKG_CONF_OPTS = \
	--disable-dselect \
	--disable-start-stop-daemon \
	--disable-shared \
	--with-polkitactionsdir=/removeme \
	--with-perllibdir=/removeme \
	--with-deb-compressor=gzip \
	PERL="$(HOST_DIR)/bin/perl"

define DPKG_REMOVE_EXTRAS
	grep -Erl '#! ?$(HOST_DIR)/bin/perl' $(TARGET_DIR)/usr/bin | while IFS= read -r file; do \
		$(RM) -f "$$file"; \
	done
	$(RM) -rf "$(TARGET_DIR)/removeme"
endef
DPKG_POST_INSTALL_TARGET_HOOKS += DPKG_REMOVE_EXTRAS

$(eval $(autotools-package))
