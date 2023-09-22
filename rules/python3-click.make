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
PACKAGES-$(PTXCONF_PYTHON3_CLICK) += python3-click

#
# Paths and names
#
PYTHON3_CLICK_VERSION	:= 8.1.4
PYTHON3_CLICK_MD5		:= d19686712c4a599bc8bf1f6f3ea7947d
PYTHON3_CLICK		:= click-$(PYTHON3_CLICK_VERSION)
PYTHON3_CLICK_SUFFIX	:= tar.gz
PYTHON3_CLICK_URL		:= $(call ptx/mirror-pypi, click, $(PYTHON3_CLICK).$(PYTHON3_CLICK_SUFFIX))
PYTHON3_CLICK_SOURCE	:= $(SRCDIR)/$(PYTHON3_CLICK).$(PYTHON3_CLICK_SUFFIX)
PYTHON3_CLICK_DIR		:= $(BUILDDIR)/$(PYTHON3_CLICK)
PYTHON3_CLICK_LICENSE	:= unknown
PYTHON3_CLICK_LICENSE_FILES	:=

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

PYTHON3_CLICK_CONF_TOOL	:= python3

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-click.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-click)
	@$(call install_fixup, python3-click,PRIORITY,optional)
	@$(call install_fixup, python3-click,SECTION,base)
	@$(call install_fixup, python3-click,AUTHOR,"Oleksij Rempel <Oleksij Rempel <o.rempel@pengutronix.de>>")
	@$(call install_fixup, python3-click,DESCRIPTION,missing)

	@$(call install_glob, python3-click, 0, 0, -, \
		$(PYTHON3_SITEPACKAGES),, *.py)

	@$(call install_finish, python3-click)

	@$(call touch)

# vim: syntax=make
