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
PACKAGES-$(PTXCONF_PYTHON3_FILETYPE) += python3-filetype

#
# Paths and names
#
PYTHON3_FILETYPE_VERSION	:= 1.2.0
PYTHON3_FILETYPE_MD5		:= 915c437718ad93c2cd347eb5aa465af1
PYTHON3_FILETYPE		:= filetype-$(PYTHON3_FILETYPE_VERSION)
PYTHON3_FILETYPE_SUFFIX	:= tar.gz
PYTHON3_FILETYPE_URL		:= $(call ptx/mirror-pypi, filetype, $(PYTHON3_FILETYPE).$(PYTHON3_FILETYPE_SUFFIX))
PYTHON3_FILETYPE_SOURCE	:= $(SRCDIR)/$(PYTHON3_FILETYPE).$(PYTHON3_FILETYPE_SUFFIX)
PYTHON3_FILETYPE_DIR		:= $(BUILDDIR)/$(PYTHON3_FILETYPE)
PYTHON3_FILETYPE_LICENSE	:= unknown
PYTHON3_FILETYPE_LICENSE_FILES	:=

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

PYTHON3_FILETYPE_CONF_TOOL	:= python3

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-filetype.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-filetype)
	@$(call install_fixup, python3-filetype,PRIORITY,optional)
	@$(call install_fixup, python3-filetype,SECTION,base)
	@$(call install_fixup, python3-filetype,AUTHOR,"Oleksij Rempel <Oleksij Rempel <o.rempel@pengutronix.de>>")
	@$(call install_fixup, python3-filetype,DESCRIPTION,missing)

	@$(call install_glob, python3-filetype, 0, 0, -, \
		$(PYTHON3_SITEPACKAGES),, *.py)

	@$(call install_finish, python3-filetype)

	@$(call touch)

# vim: syntax=make
