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
PACKAGES-$(PTXCONF_PYTHON3_TOMLI) += python3-tomli

#
# Paths and names
#
PYTHON3_TOMLI_VERSION	:= 2.0.1
PYTHON3_TOMLI_MD5		:= d4341621d423a7ca6822e23d6d52bb9a
PYTHON3_TOMLI		:= tomli-$(PYTHON3_TOMLI_VERSION)
PYTHON3_TOMLI_SUFFIX	:= tar.gz
PYTHON3_TOMLI_URL		:= $(call ptx/mirror-pypi, tomli, $(PYTHON3_TOMLI).$(PYTHON3_TOMLI_SUFFIX))
PYTHON3_TOMLI_SOURCE	:= $(SRCDIR)/$(PYTHON3_TOMLI).$(PYTHON3_TOMLI_SUFFIX)
PYTHON3_TOMLI_DIR		:= $(BUILDDIR)/$(PYTHON3_TOMLI)
PYTHON3_TOMLI_LICENSE	:= unknown
PYTHON3_TOMLI_LICENSE_FILES	:=

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

PYTHON3_TOMLI_CONF_TOOL	:= python3

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-tomli.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-tomli)
	@$(call install_fixup, python3-tomli,PRIORITY,optional)
	@$(call install_fixup, python3-tomli,SECTION,base)
	@$(call install_fixup, python3-tomli,AUTHOR,"Oleksij Rempel <o.rempel@pengutronix.de>")
	@$(call install_fixup, python3-tomli,DESCRIPTION,missing)

	@$(call install_glob, python3-tomli, 0, 0, -, \
		$(PYTHON3_SITEPACKAGES),, *.py)

	@$(call install_finish, python3-tomli)

	@$(call touch)

# vim: syntax=make
