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
PACKAGES-$(PTXCONF_OCTOPRINT) += octoprint

#
# Paths and names
#
OCTOPRINT_VERSION	:= 1.6.1
OCTOPRINT_MD5		:=
OCTOPRINT		:= octoprint-$(OCTOPRINT_VERSION)
OCTOPRINT_SUFFIX	:= tar.gz
OCTOPRINT_URL		:= https://github.com/OctoPrint/OctoPrint/archive/$(OCTOPRINT_VERSION).$(OCTOPRINT_SUFFIX)
OCTOPRINT_SOURCE	:= $(SRCDIR)/$(OCTOPRINT).$(OCTOPRINT_SUFFIX)
OCTOPRINT_DIR		:= $(BUILDDIR)/$(OCTOPRINT)
OCTOPRINT_LICENSE	:= unknown
OCTOPRINT_LICENSE_FILES	:=

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

OCTOPRINT_CONF_TOOL	:= python3

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/octoprint.targetinstall:
	@$(call targetinfo)

	@$(call install_init, octoprint)
	@$(call install_fixup, octoprint,PRIORITY,optional)
	@$(call install_fixup, octoprint,SECTION,base)
	@$(call install_fixup, octoprint,AUTHOR,"Oleksij Rempel <Oleksij Rempel <o.rempel@pengutronix.de>>")
	@$(call install_fixup, octoprint,DESCRIPTION,missing)

	@$(call install_glob, octoprint, 0, 0, -, \
		$(PYTHON3_SITEPACKAGES),, *.py)

	@$(call install_finish, octoprint)

	@$(call touch)

# vim: syntax=make
