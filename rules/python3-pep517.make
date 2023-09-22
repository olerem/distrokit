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
PACKAGES-$(PTXCONF_PYTHON3_PEP517) += python3-pep517

#
# Paths and names
#
PYTHON3_PEP517_VERSION	:= 0.13.0
PYTHON3_PEP517_MD5		:= 7fd08b11215256601a8a4940c1ba3d34
PYTHON3_PEP517		:= pep517-$(PYTHON3_PEP517_VERSION)
PYTHON3_PEP517_SUFFIX	:= tar.gz
PYTHON3_PEP517_URL		:= $(call ptx/mirror-pypi, pep517, $(PYTHON3_PEP517).$(PYTHON3_PEP517_SUFFIX))
PYTHON3_PEP517_SOURCE	:= $(SRCDIR)/$(PYTHON3_PEP517).$(PYTHON3_PEP517_SUFFIX)
PYTHON3_PEP517_DIR		:= $(BUILDDIR)/$(PYTHON3_PEP517)
PYTHON3_PEP517_LICENSE	:= unknown
PYTHON3_PEP517_LICENSE_FILES	:=

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

PYTHON3_PEP517_CONF_TOOL	:= python3

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-pep517.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-pep517)
	@$(call install_fixup, python3-pep517,PRIORITY,optional)
	@$(call install_fixup, python3-pep517,SECTION,base)
	@$(call install_fixup, python3-pep517,AUTHOR,"Oleksij Rempel <Oleksij Rempel <o.rempel@pengutronix.de>>")
	@$(call install_fixup, python3-pep517,DESCRIPTION,missing)

	@$(call install_glob, python3-pep517, 0, 0, -, \
		$(PYTHON3_SITEPACKAGES),, *.py)

	@$(call install_finish, python3-pep517)

	@$(call touch)

# vim: syntax=make
