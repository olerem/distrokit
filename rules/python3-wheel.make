# -*-makefile-*-
#
# Copyright (C) 2023 by Oleksij Rempel <o.rempel@pengutronix.de>
#
# For further information about the PTXdist project and license conditions
# see the README file.
#

#
# We provide this package
#
PACKAGES-$(PTXCONF_PYTHON3_WHEEL) += python3-wheel

#
# Paths and names
#
PYTHON3_WHEEL_VERSION	:= 0.40.0
PYTHON3_WHEEL_MD5		:= ec5004c46d1905da98bb5bc1a10ddd21
PYTHON3_WHEEL		:= wheel-$(PYTHON3_WHEEL_VERSION)
PYTHON3_WHEEL_SUFFIX	:= tar.gz
PYTHON3_WHEEL_URL		:= $(call ptx/mirror-pypi, wheel, $(PYTHON3_WHEEL).$(PYTHON3_WHEEL_SUFFIX))
PYTHON3_WHEEL_SOURCE	:= $(SRCDIR)/$(PYTHON3_WHEEL).$(PYTHON3_WHEEL_SUFFIX)
PYTHON3_WHEEL_DIR		:= $(BUILDDIR)/$(PYTHON3_WHEEL)
PYTHON3_WHEEL_LICENSE	:= unknown
PYTHON3_WHEEL_LICENSE_FILES	:=

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

PYTHON3_WHEEL_CONF_TOOL	:= python3

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-wheel.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-wheel)
	@$(call install_fixup, python3-wheel,PRIORITY,optional)
	@$(call install_fixup, python3-wheel,SECTION,base)
	@$(call install_fixup, python3-wheel,AUTHOR,"Oleksij Rempel <o.rempel@pengutronix.de>")
	@$(call install_fixup, python3-wheel,DESCRIPTION,missing)

	@$(call install_glob, python3-wheel, 0, 0, -, \
		$(PYTHON3_SITEPACKAGES),, *.py)

	@$(call install_finish, python3-wheel)

	@$(call touch)

# vim: syntax=make
