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
PACKAGES-$(PTXCONF_PYTHON3_MDURL) += python3-mdurl

#
# Paths and names
#
PYTHON3_MDURL_VERSION	:= 0.1.2
PYTHON3_MDURL_MD5		:= f18eca6522b438354be2378f216a5a94
PYTHON3_MDURL		:= mdurl-$(PYTHON3_MDURL_VERSION)
PYTHON3_MDURL_SUFFIX	:= tar.gz
PYTHON3_MDURL_URL		:= $(call ptx/mirror-pypi, mdurl, $(PYTHON3_MDURL).$(PYTHON3_MDURL_SUFFIX))
PYTHON3_MDURL_SOURCE	:= $(SRCDIR)/$(PYTHON3_MDURL).$(PYTHON3_MDURL_SUFFIX)
PYTHON3_MDURL_DIR		:= $(BUILDDIR)/$(PYTHON3_MDURL)
PYTHON3_MDURL_LICENSE	:= unknown
PYTHON3_MDURL_LICENSE_FILES	:=

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

PYTHON3_MDURL_CONF_TOOL	:= python3

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-mdurl.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-mdurl)
	@$(call install_fixup, python3-mdurl,PRIORITY,optional)
	@$(call install_fixup, python3-mdurl,SECTION,base)
	@$(call install_fixup, python3-mdurl,AUTHOR,"Oleksij Rempel <Oleksij Rempel <o.rempel@pengutronix.de>>")
	@$(call install_fixup, python3-mdurl,DESCRIPTION,missing)

	@$(call install_glob, python3-mdurl, 0, 0, -, \
		$(PYTHON3_SITEPACKAGES),, *.py)

	@$(call install_finish, python3-mdurl)

	@$(call touch)

# vim: syntax=make
