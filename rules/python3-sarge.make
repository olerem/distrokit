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
PACKAGES-$(PTXCONF_PYTHON3_SARGE) += python3-sarge

#
# Paths and names
#
PYTHON3_SARGE_VERSION	:= 0.1.7.post1
PYTHON3_SARGE_MD5		:= 3e71764b078181277140d1bc3d08439f
PYTHON3_SARGE		:= sarge-$(PYTHON3_SARGE_VERSION)
PYTHON3_SARGE_SUFFIX	:= tar.gz
PYTHON3_SARGE_URL		:= $(call ptx/mirror-pypi, sarge, $(PYTHON3_SARGE).$(PYTHON3_SARGE_SUFFIX))
PYTHON3_SARGE_SOURCE	:= $(SRCDIR)/$(PYTHON3_SARGE).$(PYTHON3_SARGE_SUFFIX)
PYTHON3_SARGE_DIR		:= $(BUILDDIR)/$(PYTHON3_SARGE)
PYTHON3_SARGE_LICENSE	:= unknown
PYTHON3_SARGE_LICENSE_FILES	:=

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

PYTHON3_SARGE_CONF_TOOL	:= python3

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-sarge.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-sarge)
	@$(call install_fixup, python3-sarge,PRIORITY,optional)
	@$(call install_fixup, python3-sarge,SECTION,base)
	@$(call install_fixup, python3-sarge,AUTHOR,"Oleksij Rempel <o.rempel@pengutronix.de>")
	@$(call install_fixup, python3-sarge,DESCRIPTION,missing)

	@$(call install_glob, python3-sarge, 0, 0, -, \
		$(PYTHON3_SITEPACKAGES),, *.py)

	@$(call install_finish, python3-sarge)

	@$(call touch)

# vim: syntax=make
