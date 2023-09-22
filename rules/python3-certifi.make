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
PACKAGES-$(PTXCONF_PYTHON3_CERTIFI) += python3-certifi

#
# Paths and names
#
PYTHON3_CERTIFI_VERSION	:= 2023.5.7
PYTHON3_CERTIFI_MD5		:= 2232d79817980d8d3de24d598078f871
PYTHON3_CERTIFI		:= certifi-$(PYTHON3_CERTIFI_VERSION)
PYTHON3_CERTIFI_SUFFIX	:= tar.gz
PYTHON3_CERTIFI_URL		:= $(call ptx/mirror-pypi, certifi, $(PYTHON3_CERTIFI).$(PYTHON3_CERTIFI_SUFFIX))
PYTHON3_CERTIFI_SOURCE	:= $(SRCDIR)/$(PYTHON3_CERTIFI).$(PYTHON3_CERTIFI_SUFFIX)
PYTHON3_CERTIFI_DIR		:= $(BUILDDIR)/$(PYTHON3_CERTIFI)
PYTHON3_CERTIFI_LICENSE	:= unknown
PYTHON3_CERTIFI_LICENSE_FILES	:=

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

PYTHON3_CERTIFI_CONF_TOOL	:= python3

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-certifi.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-certifi)
	@$(call install_fixup, python3-certifi,PRIORITY,optional)
	@$(call install_fixup, python3-certifi,SECTION,base)
	@$(call install_fixup, python3-certifi,AUTHOR,"Oleksij Rempel <o.rempel@pengutronix.de>")
	@$(call install_fixup, python3-certifi,DESCRIPTION,missing)

	@$(call install_glob, python3-certifi, 0, 0, -, \
		$(PYTHON3_SITEPACKAGES),, *.py)

	@$(call install_finish, python3-certifi)

	@$(call touch)

# vim: syntax=make
