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
PACKAGES-$(PTXCONF_PYTHON3_CACHELIB) += python3-cachelib

#
# Paths and names
#
PYTHON3_CACHELIB_VERSION	:= 0.10.2
PYTHON3_CACHELIB_MD5		:= c3ed6f78aebb05a9d2454cb0f0e3184b
PYTHON3_CACHELIB		:= cachelib-$(PYTHON3_CACHELIB_VERSION)
PYTHON3_CACHELIB_SUFFIX	:= tar.gz
PYTHON3_CACHELIB_URL		:= $(call ptx/mirror-pypi, cachelib, $(PYTHON3_CACHELIB).$(PYTHON3_CACHELIB_SUFFIX))
PYTHON3_CACHELIB_SOURCE	:= $(SRCDIR)/$(PYTHON3_CACHELIB).$(PYTHON3_CACHELIB_SUFFIX)
PYTHON3_CACHELIB_DIR		:= $(BUILDDIR)/$(PYTHON3_CACHELIB)
PYTHON3_CACHELIB_LICENSE	:= unknown
PYTHON3_CACHELIB_LICENSE_FILES	:=

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

PYTHON3_CACHELIB_CONF_TOOL	:= python3

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-cachelib.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-cachelib)
	@$(call install_fixup, python3-cachelib,PRIORITY,optional)
	@$(call install_fixup, python3-cachelib,SECTION,base)
	@$(call install_fixup, python3-cachelib,AUTHOR,"Oleksij Rempel <Oleksij Rempel <o.rempel@pengutronix.de>>")
	@$(call install_fixup, python3-cachelib,DESCRIPTION,missing)

	@$(call install_glob, python3-cachelib, 0, 0, -, \
		$(PYTHON3_SITEPACKAGES),, *.py)

	@$(call install_finish, python3-cachelib)

	@$(call touch)

# vim: syntax=make
