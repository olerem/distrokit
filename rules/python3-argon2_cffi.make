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
PACKAGES-$(PTXCONF_PYTHON3_ARGON2_CFFI) += python3-argon2_cffi

#
# Paths and names
#
PYTHON3_ARGON2_CFFI_VERSION	:= 23.1.0
PYTHON3_ARGON2_CFFI_MD5		:= 7371c126f21a895b33c4fe7e00ac6fc1
PYTHON3_ARGON2_CFFI		:= argon2_cffi-$(PYTHON3_ARGON2_CFFI_VERSION)
PYTHON3_ARGON2_CFFI_SUFFIX	:= tar.gz
PYTHON3_ARGON2_CFFI_URL		:= $(call ptx/mirror-pypi, argon2_cffi, $(PYTHON3_ARGON2_CFFI).$(PYTHON3_ARGON2_CFFI_SUFFIX))
PYTHON3_ARGON2_CFFI_SOURCE	:= $(SRCDIR)/$(PYTHON3_ARGON2_CFFI).$(PYTHON3_ARGON2_CFFI_SUFFIX)
PYTHON3_ARGON2_CFFI_DIR		:= $(BUILDDIR)/$(PYTHON3_ARGON2_CFFI)
PYTHON3_ARGON2_CFFI_LICENSE	:= unknown
PYTHON3_ARGON2_CFFI_LICENSE_FILES	:=

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

PYTHON3_ARGON2_CFFI_CONF_TOOL	:= python3

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-argon2_cffi.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-argon2_cffi)
	@$(call install_fixup, python3-argon2_cffi,PRIORITY,optional)
	@$(call install_fixup, python3-argon2_cffi,SECTION,base)
	@$(call install_fixup, python3-argon2_cffi,AUTHOR,"Oleksij Rempel <o.rempel@pengutronix.de>")
	@$(call install_fixup, python3-argon2_cffi,DESCRIPTION,missing)

	@$(call install_glob, python3-argon2_cffi, 0, 0, -, \
		$(PYTHON3_SITEPACKAGES),,)

	@$(call install_finish, python3-argon2_cffi)

	@$(call touch)

# vim: syntax=make
