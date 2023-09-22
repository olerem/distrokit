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
PACKAGES-$(PTXCONF_PYTHON3_OCTOPRINT_FILECHECK) += python3-octoprint-filecheck

#
# Paths and names
#
PYTHON3_OCTOPRINT_FILECHECK_VERSION	:= 2021.2.23
PYTHON3_OCTOPRINT_FILECHECK_MD5		:= 6e25d338e04e1143029b5f723c2180f7
PYTHON3_OCTOPRINT_FILECHECK		:= OctoPrint-FileCheck-$(PYTHON3_OCTOPRINT_FILECHECK_VERSION)
PYTHON3_OCTOPRINT_FILECHECK_SUFFIX	:= tar.gz
PYTHON3_OCTOPRINT_FILECHECK_URL		:= $(call ptx/mirror-pypi, OctoPrint-FileCheck, $(PYTHON3_OCTOPRINT_FILECHECK).$(PYTHON3_OCTOPRINT_FILECHECK_SUFFIX))
PYTHON3_OCTOPRINT_FILECHECK_SOURCE	:= $(SRCDIR)/$(PYTHON3_OCTOPRINT_FILECHECK).$(PYTHON3_OCTOPRINT_FILECHECK_SUFFIX)
PYTHON3_OCTOPRINT_FILECHECK_DIR		:= $(BUILDDIR)/$(PYTHON3_OCTOPRINT_FILECHECK)
PYTHON3_OCTOPRINT_FILECHECK_LICENSE	:= unknown
PYTHON3_OCTOPRINT_FILECHECK_LICENSE_FILES	:=

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

PYTHON3_OCTOPRINT_FILECHECK_CONF_TOOL	:= python3

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-octoprint-filecheck.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-octoprint-filecheck)
	@$(call install_fixup, python3-octoprint-filecheck,PRIORITY,optional)
	@$(call install_fixup, python3-octoprint-filecheck,SECTION,base)
	@$(call install_fixup, python3-octoprint-filecheck,AUTHOR,"Oleksij Rempel <o.rempel@pengutronix.de>")
	@$(call install_fixup, python3-octoprint-filecheck,DESCRIPTION,missing)

	@$(call install_glob, python3-octoprint-filecheck, 0, 0, -, \
		$(PYTHON3_SITEPACKAGES),, *.py)

	@$(call install_finish, python3-octoprint-filecheck)

	@$(call touch)

# vim: syntax=make
