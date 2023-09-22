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
PACKAGES-$(PTXCONF_PYTHON3_NETIFACES) += python3-netifaces

#
# Paths and names
#
PYTHON3_NETIFACES_VERSION	:= 0.11.0
PYTHON3_NETIFACES_MD5		:= 3146dcb3297dd018ae5eb9a52b440419
PYTHON3_NETIFACES		:= netifaces-$(PYTHON3_NETIFACES_VERSION)
PYTHON3_NETIFACES_SUFFIX	:= tar.gz
PYTHON3_NETIFACES_URL		:= $(call ptx/mirror-pypi, netifaces, $(PYTHON3_NETIFACES).$(PYTHON3_NETIFACES_SUFFIX))
PYTHON3_NETIFACES_SOURCE	:= $(SRCDIR)/$(PYTHON3_NETIFACES).$(PYTHON3_NETIFACES_SUFFIX)
PYTHON3_NETIFACES_DIR		:= $(BUILDDIR)/$(PYTHON3_NETIFACES)
PYTHON3_NETIFACES_LICENSE	:= unknown
PYTHON3_NETIFACES_LICENSE_FILES	:=

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

PYTHON3_NETIFACES_CONF_TOOL	:= python3

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-netifaces.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-netifaces)
	@$(call install_fixup, python3-netifaces,PRIORITY,optional)
	@$(call install_fixup, python3-netifaces,SECTION,base)
	@$(call install_fixup, python3-netifaces,AUTHOR,"Oleksij Rempel <Oleksij Rempel <o.rempel@pengutronix.de>>")
	@$(call install_fixup, python3-netifaces,DESCRIPTION,missing)

	@$(call install_glob, python3-netifaces, 0, 0, -, \
		$(PYTHON3_SITEPACKAGES),, *.py)

	@$(call install_finish, python3-netifaces)

	@$(call touch)

# vim: syntax=make
