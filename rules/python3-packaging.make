# -*-makefile-*-
#
# Copyright (C) 2023 by Oleksij Rempel <Oleksij Rempel <o.rempel@pengutronix.de>>
#
# For further information about the PTXdist project and license conditions
# see the README file.
#

#
# We provide this package
#
PACKAGES-$(PTXCONF_PYTHON3_PACKAGING) += python3-packaging

#
# Paths and names
#
PYTHON3_PACKAGING_VERSION	:= 23.1
PYTHON3_PACKAGING_MD5		:= f7d5c39c6f92cc2dfa1293ba8f6c097c
PYTHON3_PACKAGING		:= packaging-$(PYTHON3_PACKAGING_VERSION)
PYTHON3_PACKAGING_SUFFIX	:= tar.gz
PYTHON3_PACKAGING_URL		:= $(call ptx/mirror-pypi, packaging, $(PYTHON3_PACKAGING).$(PYTHON3_PACKAGING_SUFFIX))
PYTHON3_PACKAGING_SOURCE	:= $(SRCDIR)/$(PYTHON3_PACKAGING).$(PYTHON3_PACKAGING_SUFFIX)
PYTHON3_PACKAGING_DIR		:= $(BUILDDIR)/$(PYTHON3_PACKAGING)
PYTHON3_PACKAGING_LICENSE	:= unknown
PYTHON3_PACKAGING_LICENSE_FILES	:=

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

PYTHON3_PACKAGING_CONF_TOOL	:= python3

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-packaging.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-packaging)
	@$(call install_fixup, python3-packaging,PRIORITY,optional)
	@$(call install_fixup, python3-packaging,SECTION,base)
	@$(call install_fixup, python3-packaging,AUTHOR,"Oleksij Rempel <Oleksij Rempel <o.rempel@pengutronix.de>>")
	@$(call install_fixup, python3-packaging,DESCRIPTION,missing)

	@$(call install_glob, python3-packaging, 0, 0, -, \
		$(PYTHON3_SITEPACKAGES),,)

	@$(call install_finish, python3-packaging)

	@$(call touch)

# vim: syntax=make
