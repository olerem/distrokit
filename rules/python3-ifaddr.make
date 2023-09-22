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
PACKAGES-$(PTXCONF_PYTHON3_IFADDR) += python3-ifaddr

#
# Paths and names
#
PYTHON3_IFADDR_VERSION	:= 0.2.0
PYTHON3_IFADDR_MD5		:= b1cac02b5dc354d68dd6d853bc9565a7
PYTHON3_IFADDR		:= ifaddr-$(PYTHON3_IFADDR_VERSION)
PYTHON3_IFADDR_SUFFIX	:= tar.gz
PYTHON3_IFADDR_URL		:= $(call ptx/mirror-pypi, ifaddr, $(PYTHON3_IFADDR).$(PYTHON3_IFADDR_SUFFIX))
PYTHON3_IFADDR_SOURCE	:= $(SRCDIR)/$(PYTHON3_IFADDR).$(PYTHON3_IFADDR_SUFFIX)
PYTHON3_IFADDR_DIR		:= $(BUILDDIR)/$(PYTHON3_IFADDR)
PYTHON3_IFADDR_LICENSE	:= unknown
PYTHON3_IFADDR_LICENSE_FILES	:=

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

PYTHON3_IFADDR_CONF_TOOL	:= python3

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-ifaddr.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-ifaddr)
	@$(call install_fixup, python3-ifaddr,PRIORITY,optional)
	@$(call install_fixup, python3-ifaddr,SECTION,base)
	@$(call install_fixup, python3-ifaddr,AUTHOR,"Oleksij Rempel <o.rempel@pengutronix.de>")
	@$(call install_fixup, python3-ifaddr,DESCRIPTION,missing)

	@$(call install_glob, python3-ifaddr, 0, 0, -, \
		$(PYTHON3_SITEPACKAGES),, *.py)

	@$(call install_finish, python3-ifaddr)

	@$(call touch)

# vim: syntax=make
