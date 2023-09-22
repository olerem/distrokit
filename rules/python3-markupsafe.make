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
PACKAGES-$(PTXCONF_PYTHON3_MARKUPSAFE) += python3-markupsafe

#
# Paths and names
#
PYTHON3_MARKUPSAFE_VERSION	:= 2.1.3
PYTHON3_MARKUPSAFE_MD5		:= ca33f119bd0551ce15837f58bb180214
PYTHON3_MARKUPSAFE		:= MarkupSafe-$(PYTHON3_MARKUPSAFE_VERSION)
PYTHON3_MARKUPSAFE_SUFFIX	:= tar.gz
PYTHON3_MARKUPSAFE_URL		:= $(call ptx/mirror-pypi, MarkupSafe, $(PYTHON3_MARKUPSAFE).$(PYTHON3_MARKUPSAFE_SUFFIX))
PYTHON3_MARKUPSAFE_SOURCE	:= $(SRCDIR)/$(PYTHON3_MARKUPSAFE).$(PYTHON3_MARKUPSAFE_SUFFIX)
PYTHON3_MARKUPSAFE_DIR		:= $(BUILDDIR)/$(PYTHON3_MARKUPSAFE)
PYTHON3_MARKUPSAFE_LICENSE	:= unknown
PYTHON3_MARKUPSAFE_LICENSE_FILES	:=

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

PYTHON3_MARKUPSAFE_CONF_TOOL	:= python3

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-markupsafe.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-markupsafe)
	@$(call install_fixup, python3-markupsafe,PRIORITY,optional)
	@$(call install_fixup, python3-markupsafe,SECTION,base)
	@$(call install_fixup, python3-markupsafe,AUTHOR,"Oleksij Rempel <Oleksij Rempel <o.rempel@pengutronix.de>>")
	@$(call install_fixup, python3-markupsafe,DESCRIPTION,missing)

	@$(call install_glob, python3-markupsafe, 0, 0, -, \
		$(PYTHON3_SITEPACKAGES),, *.py)

	@$(call install_finish, python3-markupsafe)

	@$(call touch)

# vim: syntax=make
