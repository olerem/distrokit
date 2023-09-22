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
PACKAGES-$(PTXCONF_PYTHON3_BLINKER) += python3-blinker

#
# Paths and names
#
PYTHON3_BLINKER_VERSION	:= 1.6.2
PYTHON3_BLINKER_MD5		:= 1c7375d100a67ba368d9cde0ab2d8cfa
PYTHON3_BLINKER		:= blinker-$(PYTHON3_BLINKER_VERSION)
PYTHON3_BLINKER_SUFFIX	:= tar.gz
PYTHON3_BLINKER_URL		:= $(call ptx/mirror-pypi, blinker, $(PYTHON3_BLINKER).$(PYTHON3_BLINKER_SUFFIX))
PYTHON3_BLINKER_SOURCE	:= $(SRCDIR)/$(PYTHON3_BLINKER).$(PYTHON3_BLINKER_SUFFIX)
PYTHON3_BLINKER_DIR		:= $(BUILDDIR)/$(PYTHON3_BLINKER)
PYTHON3_BLINKER_LICENSE	:= unknown
PYTHON3_BLINKER_LICENSE_FILES	:=

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

PYTHON3_BLINKER_CONF_TOOL	:= python3

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-blinker.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-blinker)
	@$(call install_fixup, python3-blinker,PRIORITY,optional)
	@$(call install_fixup, python3-blinker,SECTION,base)
	@$(call install_fixup, python3-blinker,AUTHOR,"Oleksij Rempel <Oleksij Rempel <o.rempel@pengutronix.de>>")
	@$(call install_fixup, python3-blinker,DESCRIPTION,missing)

	@$(call install_glob, python3-blinker, 0, 0, -, \
		$(PYTHON3_SITEPACKAGES),,)

	@$(call install_finish, python3-blinker)

	@$(call touch)

# vim: syntax=make
