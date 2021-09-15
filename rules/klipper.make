# -*-makefile-*-
#
# Copyright (C) 2021 by Oleksij Rempel <o.rempel@pengutronix.de>
#
# For further information about the PTXdist project and license conditions
# see the README file.
#

#
# We provide this package
#
PACKAGES-$(PTXCONF_KLIPPER) += klipper

#
# Paths and names
#
KLIPPER_VERSION		:= c148f17ea339
KLIPPER_MD5		:= d625b87f079464b62b317eb01633f38d
KLIPPER			:= klipper-$(KLIPPER_VERSION)
KLIPPER_SUFFIX		:= tar.gz
KLIPPER_URL		:= https://github.com/KevinOConnor/klipper/archive/$(KLIPPER_VERSION).$(KLIPPER_SUFFIX)
KLIPPER_SOURCE		:= $(SRCDIR)/$(KLIPPER).$(KLIPPER_SUFFIX)
KLIPPER_DIR		:= $(BUILDDIR)/$(KLIPPER)
KLIPPER_LICENSE		:= GPL-3.0
KLIPPER_LICENSE_FILES	:=

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

KLIPPER_CONF_TOOL	:= python3

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/klipper.targetinstall:
	@$(call targetinfo)

	@$(call install_init, klipper)
	@$(call install_fixup, klipper,PRIORITY,optional)
	@$(call install_fixup, klipper,SECTION,base)
	@$(call install_fixup, klipper,AUTHOR,"Oleksij Rempel <o.rempel@pengutronix.de>")
	@$(call install_fixup, klipper,DESCRIPTION,missing)

	@$(call install_glob, klipper, 0, 0, -, \
		$(PYTHON3_SITEPACKAGES),, *.py)
	@$(call install_copy, klipper, 0, 0, 0775, -, /usr/bin/klippy)

	@$(call install_finish, klipper)

	@$(call touch)

# vim: syntax=make
