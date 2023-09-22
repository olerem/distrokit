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
PACKAGES-$(PTXCONF_PYTHON3_ARGON2_CFFI_BINDINGS) += python3-argon2-cffi-bindings

#
# Paths and names
#
PYTHON3_ARGON2_CFFI_BINDINGS_VERSION	:= 21.2.0
PYTHON3_ARGON2_CFFI_BINDINGS_MD5		:= f1591e1af7dea9ef3e5b982e2c196c1d
PYTHON3_ARGON2_CFFI_BINDINGS		:= argon2-cffi-bindings-$(PYTHON3_ARGON2_CFFI_BINDINGS_VERSION)
PYTHON3_ARGON2_CFFI_BINDINGS_SUFFIX	:= tar.gz
PYTHON3_ARGON2_CFFI_BINDINGS_URL		:= $(call ptx/mirror-pypi, argon2-cffi-bindings, $(PYTHON3_ARGON2_CFFI_BINDINGS).$(PYTHON3_ARGON2_CFFI_BINDINGS_SUFFIX))
PYTHON3_ARGON2_CFFI_BINDINGS_SOURCE	:= $(SRCDIR)/$(PYTHON3_ARGON2_CFFI_BINDINGS).$(PYTHON3_ARGON2_CFFI_BINDINGS_SUFFIX)
PYTHON3_ARGON2_CFFI_BINDINGS_DIR		:= $(BUILDDIR)/$(PYTHON3_ARGON2_CFFI_BINDINGS)
PYTHON3_ARGON2_CFFI_BINDINGS_LICENSE	:= unknown
PYTHON3_ARGON2_CFFI_BINDINGS_LICENSE_FILES	:=

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

PYTHON3_ARGON2_CFFI_BINDINGS_CONF_TOOL	:= python3

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-argon2-cffi-bindings.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-argon2-cffi-bindings)
	@$(call install_fixup, python3-argon2-cffi-bindings,PRIORITY,optional)
	@$(call install_fixup, python3-argon2-cffi-bindings,SECTION,base)
	@$(call install_fixup, python3-argon2-cffi-bindings,AUTHOR,"Oleksij Rempel <o.rempel@pengutronix.de>")
	@$(call install_fixup, python3-argon2-cffi-bindings,DESCRIPTION,missing)

	@$(call install_glob, python3-argon2-cffi-bindings, 0, 0, -, \
		$(PYTHON3_SITEPACKAGES),, *.py)

	@$(call install_finish, python3-argon2-cffi-bindings)

	@$(call touch)

# vim: syntax=make
