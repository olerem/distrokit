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
PACKAGES-$(PTXCONF_PYTHON3_SEMANTIC_VERSION) += python3-semantic-version

#
# Paths and names
#
PYTHON3_SEMANTIC_VERSION_VERSION	:= 2.10.0
PYTHON3_SEMANTIC_VERSION_MD5		:= e48abef93ba69abcd4eaf4640edfc38b
PYTHON3_SEMANTIC_VERSION		:= semantic_version-$(PYTHON3_SEMANTIC_VERSION_VERSION)
PYTHON3_SEMANTIC_VERSION_SUFFIX	:= tar.gz
PYTHON3_SEMANTIC_VERSION_URL		:= $(call ptx/mirror-pypi, semantic_version, $(PYTHON3_SEMANTIC_VERSION).$(PYTHON3_SEMANTIC_VERSION_SUFFIX))
PYTHON3_SEMANTIC_VERSION_SOURCE	:= $(SRCDIR)/$(PYTHON3_SEMANTIC_VERSION).$(PYTHON3_SEMANTIC_VERSION_SUFFIX)
PYTHON3_SEMANTIC_VERSION_DIR		:= $(BUILDDIR)/$(PYTHON3_SEMANTIC_VERSION)
PYTHON3_SEMANTIC_VERSION_LICENSE	:= unknown
PYTHON3_SEMANTIC_VERSION_LICENSE_FILES	:=

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

PYTHON3_SEMANTIC_VERSION_CONF_TOOL	:= python3

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-semantic-version.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-semantic-version)
	@$(call install_fixup, python3-semantic-version,PRIORITY,optional)
	@$(call install_fixup, python3-semantic-version,SECTION,base)
	@$(call install_fixup, python3-semantic-version,AUTHOR,"Oleksij Rempel <o.rempel@pengutronix.de>")
	@$(call install_fixup, python3-semantic-version,DESCRIPTION,missing)

	@$(call install_glob, python3-semantic-version, 0, 0, -, \
		$(PYTHON3_SITEPACKAGES),, *.py)

	@$(call install_finish, python3-semantic-version)

	@$(call touch)

# vim: syntax=make
