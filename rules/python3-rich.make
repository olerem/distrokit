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
PACKAGES-$(PTXCONF_PYTHON3_RICH) += python3-rich

#
# Paths and names
#
PYTHON3_RICH_VERSION	:= 13.4.2
PYTHON3_RICH_MD5		:= 67df537898c4d7c22219c2a6881d4ea3
PYTHON3_RICH		:= rich-$(PYTHON3_RICH_VERSION)
PYTHON3_RICH_SUFFIX	:= tar.gz
PYTHON3_RICH_URL		:= $(call ptx/mirror-pypi, rich, $(PYTHON3_RICH).$(PYTHON3_RICH_SUFFIX))
PYTHON3_RICH_SOURCE	:= $(SRCDIR)/$(PYTHON3_RICH).$(PYTHON3_RICH_SUFFIX)
PYTHON3_RICH_DIR		:= $(BUILDDIR)/$(PYTHON3_RICH)
PYTHON3_RICH_LICENSE	:= unknown
PYTHON3_RICH_LICENSE_FILES	:=

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

PYTHON3_RICH_CONF_TOOL	:= python3

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-rich.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-rich)
	@$(call install_fixup, python3-rich,PRIORITY,optional)
	@$(call install_fixup, python3-rich,SECTION,base)
	@$(call install_fixup, python3-rich,AUTHOR,"Oleksij Rempel <Oleksij Rempel <o.rempel@pengutronix.de>>")
	@$(call install_fixup, python3-rich,DESCRIPTION,missing)

	@$(call install_glob, python3-rich, 0, 0, -, \
		$(PYTHON3_SITEPACKAGES),, *.py)

	@$(call install_finish, python3-rich)

	@$(call touch)

# vim: syntax=make
