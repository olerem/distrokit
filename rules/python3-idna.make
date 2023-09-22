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
PACKAGES-$(PTXCONF_PYTHON3_IDNA) += python3-idna

#
# Paths and names
#
PYTHON3_IDNA_VERSION	:= 2.5
PYTHON3_IDNA_MD5		:= fc1d992bef73e8824db411bb5d21f012
PYTHON3_IDNA		:= idna-$(PYTHON3_IDNA_VERSION)
PYTHON3_IDNA_SUFFIX	:= tar.gz
PYTHON3_IDNA_URL		:= $(call ptx/mirror-pypi, idna, $(PYTHON3_IDNA).$(PYTHON3_IDNA_SUFFIX))
PYTHON3_IDNA_SOURCE	:= $(SRCDIR)/$(PYTHON3_IDNA).$(PYTHON3_IDNA_SUFFIX)
PYTHON3_IDNA_DIR		:= $(BUILDDIR)/$(PYTHON3_IDNA)
PYTHON3_IDNA_LICENSE	:= unknown
PYTHON3_IDNA_LICENSE_FILES	:=

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

PYTHON3_IDNA_CONF_TOOL	:= python3

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-idna.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-idna)
	@$(call install_fixup, python3-idna,PRIORITY,optional)
	@$(call install_fixup, python3-idna,SECTION,base)
	@$(call install_fixup, python3-idna,AUTHOR,"Oleksij Rempel <o.rempel@pengutronix.de>")
	@$(call install_fixup, python3-idna,DESCRIPTION,missing)

	@$(call install_glob, python3-idna, 0, 0, -, \
		$(PYTHON3_SITEPACKAGES),, *.py)

	@$(call install_finish, python3-idna)

	@$(call touch)

# vim: syntax=make
