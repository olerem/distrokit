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
PACKAGES-$(PTXCONF_PYTHON3_FROZENDICT) += python3-frozendict

#
# Paths and names
#
PYTHON3_FROZENDICT_VERSION	:= 2.3.8
PYTHON3_FROZENDICT_MD5		:= 51ca98638ae8b3f427037dfde18d378f
PYTHON3_FROZENDICT		:= frozendict-$(PYTHON3_FROZENDICT_VERSION)
PYTHON3_FROZENDICT_SUFFIX	:= tar.gz
PYTHON3_FROZENDICT_URL		:= $(call ptx/mirror-pypi, frozendict, $(PYTHON3_FROZENDICT).$(PYTHON3_FROZENDICT_SUFFIX))
PYTHON3_FROZENDICT_SOURCE	:= $(SRCDIR)/$(PYTHON3_FROZENDICT).$(PYTHON3_FROZENDICT_SUFFIX)
PYTHON3_FROZENDICT_DIR		:= $(BUILDDIR)/$(PYTHON3_FROZENDICT)
PYTHON3_FROZENDICT_LICENSE	:= unknown
PYTHON3_FROZENDICT_LICENSE_FILES	:=

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

PYTHON3_FROZENDICT_CONF_TOOL	:= python3

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-frozendict.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-frozendict)
	@$(call install_fixup, python3-frozendict,PRIORITY,optional)
	@$(call install_fixup, python3-frozendict,SECTION,base)
	@$(call install_fixup, python3-frozendict,AUTHOR,"Oleksij Rempel <Oleksij Rempel <o.rempel@pengutronix.de>>")
	@$(call install_fixup, python3-frozendict,DESCRIPTION,missing)

	@$(call install_glob, python3-frozendict, 0, 0, -, \
		$(PYTHON3_SITEPACKAGES),, *.py)

	@$(call install_finish, python3-frozendict)

	@$(call touch)

# vim: syntax=make
