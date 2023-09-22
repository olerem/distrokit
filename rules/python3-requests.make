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
PACKAGES-$(PTXCONF_PYTHON3_REQUESTS) += python3-requests

#
# Paths and names
#
PYTHON3_REQUESTS_VERSION	:= 2.31.0
PYTHON3_REQUESTS_MD5		:= 941e175c276cd7d39d098092c56679a4
PYTHON3_REQUESTS		:= requests-$(PYTHON3_REQUESTS_VERSION)
PYTHON3_REQUESTS_SUFFIX	:= tar.gz
PYTHON3_REQUESTS_URL		:= $(call ptx/mirror-pypi, requests, $(PYTHON3_REQUESTS).$(PYTHON3_REQUESTS_SUFFIX))
PYTHON3_REQUESTS_SOURCE	:= $(SRCDIR)/$(PYTHON3_REQUESTS).$(PYTHON3_REQUESTS_SUFFIX)
PYTHON3_REQUESTS_DIR		:= $(BUILDDIR)/$(PYTHON3_REQUESTS)
PYTHON3_REQUESTS_LICENSE	:= unknown
PYTHON3_REQUESTS_LICENSE_FILES	:=

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

PYTHON3_REQUESTS_CONF_TOOL	:= python3

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-requests.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-requests)
	@$(call install_fixup, python3-requests,PRIORITY,optional)
	@$(call install_fixup, python3-requests,SECTION,base)
	@$(call install_fixup, python3-requests,AUTHOR,"Oleksij Rempel <o.rempel@pengutronix.de>")
	@$(call install_fixup, python3-requests,DESCRIPTION,missing)

	@$(call install_glob, python3-requests, 0, 0, -, \
		$(PYTHON3_SITEPACKAGES),, *.py)

	@$(call install_finish, python3-requests)

	@$(call touch)

# vim: syntax=make
