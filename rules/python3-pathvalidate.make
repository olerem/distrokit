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
PACKAGES-$(PTXCONF_PYTHON3_PATHVALIDATE) += python3-pathvalidate

#
# Paths and names
#
PYTHON3_PATHVALIDATE_VERSION	:= 2.5.2
PYTHON3_PATHVALIDATE_MD5		:= 541238984572fb21db2da2af1d70a993
PYTHON3_PATHVALIDATE		:= pathvalidate-$(PYTHON3_PATHVALIDATE_VERSION)
PYTHON3_PATHVALIDATE_SUFFIX	:= tar.gz
PYTHON3_PATHVALIDATE_URL		:= $(call ptx/mirror-pypi, pathvalidate, $(PYTHON3_PATHVALIDATE).$(PYTHON3_PATHVALIDATE_SUFFIX))
PYTHON3_PATHVALIDATE_SOURCE	:= $(SRCDIR)/$(PYTHON3_PATHVALIDATE).$(PYTHON3_PATHVALIDATE_SUFFIX)
PYTHON3_PATHVALIDATE_DIR		:= $(BUILDDIR)/$(PYTHON3_PATHVALIDATE)
PYTHON3_PATHVALIDATE_LICENSE	:= unknown
PYTHON3_PATHVALIDATE_LICENSE_FILES	:=

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

PYTHON3_PATHVALIDATE_CONF_TOOL	:= python3

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-pathvalidate.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-pathvalidate)
	@$(call install_fixup, python3-pathvalidate,PRIORITY,optional)
	@$(call install_fixup, python3-pathvalidate,SECTION,base)
	@$(call install_fixup, python3-pathvalidate,AUTHOR,"Oleksij Rempel <o.rempel@pengutronix.de>")
	@$(call install_fixup, python3-pathvalidate,DESCRIPTION,missing)

	@$(call install_glob, python3-pathvalidate, 0, 0, -, \
		$(PYTHON3_SITEPACKAGES),, *.py)

	@$(call install_finish, python3-pathvalidate)

	@$(call touch)

# vim: syntax=make
