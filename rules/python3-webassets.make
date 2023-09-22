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
PACKAGES-$(PTXCONF_PYTHON3_WEBASSETS) += python3-webassets

#
# Paths and names
#
PYTHON3_WEBASSETS_VERSION	:= 2.0
PYTHON3_WEBASSETS_MD5		:= 25270b7a0452cf8a0af29898e0411c2e
PYTHON3_WEBASSETS		:= webassets-$(PYTHON3_WEBASSETS_VERSION)
PYTHON3_WEBASSETS_SUFFIX	:= tar.gz
PYTHON3_WEBASSETS_URL		:= $(call ptx/mirror-pypi, webassets, $(PYTHON3_WEBASSETS).$(PYTHON3_WEBASSETS_SUFFIX))
PYTHON3_WEBASSETS_SOURCE	:= $(SRCDIR)/$(PYTHON3_WEBASSETS).$(PYTHON3_WEBASSETS_SUFFIX)
PYTHON3_WEBASSETS_DIR		:= $(BUILDDIR)/$(PYTHON3_WEBASSETS)
PYTHON3_WEBASSETS_LICENSE	:= unknown
PYTHON3_WEBASSETS_LICENSE_FILES	:=

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

PYTHON3_WEBASSETS_CONF_TOOL	:= python3

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-webassets.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-webassets)
	@$(call install_fixup, python3-webassets,PRIORITY,optional)
	@$(call install_fixup, python3-webassets,SECTION,base)
	@$(call install_fixup, python3-webassets,AUTHOR,"Oleksij Rempel <Oleksij Rempel <o.rempel@pengutronix.de>>")
	@$(call install_fixup, python3-webassets,DESCRIPTION,missing)

	@$(call install_glob, python3-webassets, 0, 0, -, \
		$(PYTHON3_SITEPACKAGES),, *.py)

	@$(call install_finish, python3-webassets)

	@$(call touch)

# vim: syntax=make
