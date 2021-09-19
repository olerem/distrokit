# -*-makefile-*-
#
# Copyright (C) 2021 by Oleksij Rempel <Oleksij Rempel <o.rempel@pengutronix.de>>
#
# For further information about the PTXdist project and license conditions
# see the README file.
#

#
# We provide this package
#
PACKAGES-$(PTXCONF_PYTHON3_OCTOPRINT) += python3-octoprint

#
# Paths and names
#
PYTHON3_OCTOPRINT_VERSION	:= 1.6.1
PYTHON3_OCTOPRINT_MD5		:=
PYTHON3_OCTOPRINT		:= octoprint-$(PYTHON3_OCTOPRINT_VERSION)
PYTHON3_OCTOPRINT_SUFFIX	:= tar.gz
PYTHON3_OCTOPRINT_URL		:= $(call ptx/mirror-pypi, octoprint, $(PYTHON3_OCTOPRINT).$(PYTHON3_OCTOPRINT_SUFFIX))
PYTHON3_OCTOPRINT_SOURCE	:= $(SRCDIR)/$(PYTHON3_OCTOPRINT).$(PYTHON3_OCTOPRINT_SUFFIX)
PYTHON3_OCTOPRINT_DIR		:= $(BUILDDIR)/$(PYTHON3_OCTOPRINT)
PYTHON3_OCTOPRINT_LICENSE	:= unknown
PYTHON3_OCTOPRINT_LICENSE_FILES	:=

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

PYTHON3_OCTOPRINT_CONF_TOOL	:= python3

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-octoprint.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-octoprint)
	@$(call install_fixup, python3-octoprint,PRIORITY,optional)
	@$(call install_fixup, python3-octoprint,SECTION,base)
	@$(call install_fixup, python3-octoprint,AUTHOR,"Oleksij Rempel <Oleksij Rempel <o.rempel@pengutronix.de>>")
	@$(call install_fixup, python3-octoprint,DESCRIPTION,missing)

	@$(call install_glob, python3-octoprint, 0, 0, -, \
		$(PYTHON3_SITEPACKAGES),, *.py)

	@$(call install_finish, python3-octoprint)

	@$(call touch)

# vim: syntax=make
