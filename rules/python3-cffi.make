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
PACKAGES-$(PTXCONF_PYTHON3_CFFI) += python3-cffi

#
# Paths and names
#
PYTHON3_CFFI_VERSION	:= 1.15.1
PYTHON3_CFFI_MD5		:= f493860a6e98cd0c4178149568a6b4f6
PYTHON3_CFFI		:= cffi-$(PYTHON3_CFFI_VERSION)
PYTHON3_CFFI_SUFFIX	:= tar.gz
PYTHON3_CFFI_URL		:= $(call ptx/mirror-pypi, cffi, $(PYTHON3_CFFI).$(PYTHON3_CFFI_SUFFIX))
PYTHON3_CFFI_SOURCE	:= $(SRCDIR)/$(PYTHON3_CFFI).$(PYTHON3_CFFI_SUFFIX)
PYTHON3_CFFI_DIR		:= $(BUILDDIR)/$(PYTHON3_CFFI)
PYTHON3_CFFI_LICENSE	:= unknown
PYTHON3_CFFI_LICENSE_FILES	:=

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

PYTHON3_CFFI_CONF_TOOL	:= python3

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-cffi.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-cffi)
	@$(call install_fixup, python3-cffi,PRIORITY,optional)
	@$(call install_fixup, python3-cffi,SECTION,base)
	@$(call install_fixup, python3-cffi,AUTHOR,"Oleksij Rempel <o.rempel@pengutronix.de>")
	@$(call install_fixup, python3-cffi,DESCRIPTION,missing)

	@$(call install_glob, python3-cffi, 0, 0, -, \
		$(PYTHON3_SITEPACKAGES),,)

	@$(call install_finish, python3-cffi)

	@$(call touch)

# vim: syntax=make
