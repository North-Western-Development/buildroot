################################################################################
#
# apt
#
################################################################################

APT_VERSION = 3.1.3
APT_SITE = https://salsa.debian.org/apt-team/apt/-/archive/$(APT_VERSION)
APT_SOURCE = apt-$(APT_VERSION).tar.bz2
APT_LICENSE = GPL-2.0
APT_LICENSE_FILES = COPYING
APT_DEPENDENCIES = host-triehash host-dpkg openssl berkeleydb zlib xz bzip2 lz4 xxhash $(if $(BR2_PACKAGE_ZSTD),zstd)

APT_CONF_OPTS = -DWITH_DOC=OFF -DWITH_TESTS=OFF

ifeq ($(BR2_SYSTEM_ENABLE_NLS),y)
APT_CONF_OPTS += -DUSE_NLS=ON
else
APT_CONF_OPTS += -DUSE_NLS=OFF
endif

$(eval $(cmake-package))
