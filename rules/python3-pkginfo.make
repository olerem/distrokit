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
PACKAGES-$(PTXCONF_PYTHON3_PKGINFO) += python3-pkginfo

#
# Paths and names
#
PYTHON3_PKGINFO_VERSION	:= 1.9.6
PYTHON3_PKGINFO_MD5		:= 8c1c78c8ee593e745c69080663c26df6
PYTHON3_PKGINFO		:= pkginfo-$(PYTHON3_PKGINFO_VERSION)
PYTHON3_PKGINFO_SUFFIX	:= tar.gz
PYTHON3_PKGINFO_URL		:= $(call ptx/mirror-pypi, pkginfo, $(PYTHON3_PKGINFO).$(PYTHON3_PKGINFO_SUFFIX))
PYTHON3_PKGINFO_SOURCE	:= $(SRCDIR)/$(PYTHON3_PKGINFO).$(PYTHON3_PKGINFO_SUFFIX)
PYTHON3_PKGINFO_DIR		:= $(BUILDDIR)/$(PYTHON3_PKGINFO)
PYTHON3_PKGINFO_LICENSE	:= unknown
PYTHON3_PKGINFO_LICENSE_FILES	:=

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

PYTHON3_PKGINFO_CONF_TOOL	:= python3

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-pkginfo.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-pkginfo)
	@$(call install_fixup, python3-pkginfo,PRIORITY,optional)
	@$(call install_fixup, python3-pkginfo,SECTION,base)
	@$(call install_fixup, python3-pkginfo,AUTHOR,"Oleksij Rempel <o.rempel@pengutronix.de>")
	@$(call install_fixup, python3-pkginfo,DESCRIPTION,missing)

	@$(call install_glob, python3-pkginfo, 0, 0, -, \
		$(PYTHON3_SITEPACKAGES),, *.py)

	@$(call install_finish, python3-pkginfo)

	@$(call touch)

# vim: syntax=make
