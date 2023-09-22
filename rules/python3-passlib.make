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
PACKAGES-$(PTXCONF_PYTHON3_PASSLIB) += python3-passlib

#
# Paths and names
#
PYTHON3_PASSLIB_VERSION	:= 1.7.4
PYTHON3_PASSLIB_MD5		:= 3a229cbd00dfb33e99885b43325e0591
PYTHON3_PASSLIB		:= passlib-$(PYTHON3_PASSLIB_VERSION)
PYTHON3_PASSLIB_SUFFIX	:= tar.gz
PYTHON3_PASSLIB_URL		:= $(call ptx/mirror-pypi, passlib, $(PYTHON3_PASSLIB).$(PYTHON3_PASSLIB_SUFFIX))
PYTHON3_PASSLIB_SOURCE	:= $(SRCDIR)/$(PYTHON3_PASSLIB).$(PYTHON3_PASSLIB_SUFFIX)
PYTHON3_PASSLIB_DIR		:= $(BUILDDIR)/$(PYTHON3_PASSLIB)
PYTHON3_PASSLIB_LICENSE	:= unknown
PYTHON3_PASSLIB_LICENSE_FILES	:=

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

PYTHON3_PASSLIB_CONF_TOOL	:= python3

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-passlib.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-passlib)
	@$(call install_fixup, python3-passlib,PRIORITY,optional)
	@$(call install_fixup, python3-passlib,SECTION,base)
	@$(call install_fixup, python3-passlib,AUTHOR,"Oleksij Rempel <o.rempel@pengutronix.de>")
	@$(call install_fixup, python3-passlib,DESCRIPTION,missing)

	@$(call install_glob, python3-passlib, 0, 0, -, \
		$(PYTHON3_SITEPACKAGES),, *.py)

	@$(call install_finish, python3-passlib)

	@$(call touch)

# vim: syntax=make
