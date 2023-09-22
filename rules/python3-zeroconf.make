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
PACKAGES-$(PTXCONF_PYTHON3_ZEROCONF) += python3-zeroconf

#
# Paths and names
#
PYTHON3_ZEROCONF_VERSION	:= 0.39.4
PYTHON3_ZEROCONF_MD5		:= f85fb9d239397b53836495fd49b85e5f
PYTHON3_ZEROCONF		:= zeroconf-$(PYTHON3_ZEROCONF_VERSION)
PYTHON3_ZEROCONF_SUFFIX	:= tar.gz
PYTHON3_ZEROCONF_URL		:= $(call ptx/mirror-pypi, zeroconf, $(PYTHON3_ZEROCONF).$(PYTHON3_ZEROCONF_SUFFIX))
PYTHON3_ZEROCONF_SOURCE	:= $(SRCDIR)/$(PYTHON3_ZEROCONF).$(PYTHON3_ZEROCONF_SUFFIX)
PYTHON3_ZEROCONF_DIR		:= $(BUILDDIR)/$(PYTHON3_ZEROCONF)
PYTHON3_ZEROCONF_LICENSE	:= unknown
PYTHON3_ZEROCONF_LICENSE_FILES	:=

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

PYTHON3_ZEROCONF_CONF_TOOL	:= python3

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-zeroconf.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-zeroconf)
	@$(call install_fixup, python3-zeroconf,PRIORITY,optional)
	@$(call install_fixup, python3-zeroconf,SECTION,base)
	@$(call install_fixup, python3-zeroconf,AUTHOR,"Oleksij Rempel <o.rempel@pengutronix.de>")
	@$(call install_fixup, python3-zeroconf,DESCRIPTION,missing)

	@$(call install_glob, python3-zeroconf, 0, 0, -, \
		$(PYTHON3_SITEPACKAGES),, *.py)

	@$(call install_finish, python3-zeroconf)

	@$(call touch)

# vim: syntax=make
