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
PACKAGES-$(PTXCONF_PYTHON3_UNIDECODE) += python3-unidecode

#
# Paths and names
#
PYTHON3_UNIDECODE_VERSION	:= 1.3.6
PYTHON3_UNIDECODE_MD5		:= 05d6d2fa527ba8538eadd5c611e9e0d8
PYTHON3_UNIDECODE		:= Unidecode-$(PYTHON3_UNIDECODE_VERSION)
PYTHON3_UNIDECODE_SUFFIX	:= tar.gz
PYTHON3_UNIDECODE_URL		:= $(call ptx/mirror-pypi, Unidecode, $(PYTHON3_UNIDECODE).$(PYTHON3_UNIDECODE_SUFFIX))
PYTHON3_UNIDECODE_SOURCE	:= $(SRCDIR)/$(PYTHON3_UNIDECODE).$(PYTHON3_UNIDECODE_SUFFIX)
PYTHON3_UNIDECODE_DIR		:= $(BUILDDIR)/$(PYTHON3_UNIDECODE)
PYTHON3_UNIDECODE_LICENSE	:= unknown
PYTHON3_UNIDECODE_LICENSE_FILES	:=

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

PYTHON3_UNIDECODE_CONF_TOOL	:= python3

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-unidecode.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-unidecode)
	@$(call install_fixup, python3-unidecode,PRIORITY,optional)
	@$(call install_fixup, python3-unidecode,SECTION,base)
	@$(call install_fixup, python3-unidecode,AUTHOR,"Oleksij Rempel <o.rempel@pengutronix.de>")
	@$(call install_fixup, python3-unidecode,DESCRIPTION,missing)

	@$(call install_glob, python3-unidecode, 0, 0, -, \
		$(PYTHON3_SITEPACKAGES),, *.py)

	@$(call install_finish, python3-unidecode)

	@$(call touch)

# vim: syntax=make
