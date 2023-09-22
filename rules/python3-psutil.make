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
PACKAGES-$(PTXCONF_PYTHON3_PSUTIL) += python3-psutil

#
# Paths and names
#
PYTHON3_PSUTIL_VERSION	:= 5.9.5
PYTHON3_PSUTIL_MD5		:= 864717cda1e2577b65da1f30cd37b537
PYTHON3_PSUTIL		:= psutil-$(PYTHON3_PSUTIL_VERSION)
PYTHON3_PSUTIL_SUFFIX	:= tar.gz
PYTHON3_PSUTIL_URL		:= $(call ptx/mirror-pypi, psutil, $(PYTHON3_PSUTIL).$(PYTHON3_PSUTIL_SUFFIX))
PYTHON3_PSUTIL_SOURCE	:= $(SRCDIR)/$(PYTHON3_PSUTIL).$(PYTHON3_PSUTIL_SUFFIX)
PYTHON3_PSUTIL_DIR		:= $(BUILDDIR)/$(PYTHON3_PSUTIL)
PYTHON3_PSUTIL_LICENSE	:= unknown
PYTHON3_PSUTIL_LICENSE_FILES	:=

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

PYTHON3_PSUTIL_CONF_TOOL	:= python3

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-psutil.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-psutil)
	@$(call install_fixup, python3-psutil,PRIORITY,optional)
	@$(call install_fixup, python3-psutil,SECTION,base)
	@$(call install_fixup, python3-psutil,AUTHOR,"Oleksij Rempel <o.rempel@pengutronix.de>")
	@$(call install_fixup, python3-psutil,DESCRIPTION,missing)

	@$(call install_glob, python3-psutil, 0, 0, -, \
		$(PYTHON3_SITEPACKAGES),, *.py)

	@$(call install_finish, python3-psutil)

	@$(call touch)

# vim: syntax=make
