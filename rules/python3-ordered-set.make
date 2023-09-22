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
PACKAGES-$(PTXCONF_PYTHON3_ORDERED_SET) += python3-ordered-set

#
# Paths and names
#
PYTHON3_ORDERED_SET_VERSION	:= 4.1.0
PYTHON3_ORDERED_SET_MD5		:= 2a9ba8d1a962c26f9a4fbe246b62ee77
PYTHON3_ORDERED_SET		:= ordered-set-$(PYTHON3_ORDERED_SET_VERSION)
PYTHON3_ORDERED_SET_SUFFIX	:= tar.gz
PYTHON3_ORDERED_SET_URL		:= $(call ptx/mirror-pypi, ordered-set, $(PYTHON3_ORDERED_SET).$(PYTHON3_ORDERED_SET_SUFFIX))
PYTHON3_ORDERED_SET_SOURCE	:= $(SRCDIR)/$(PYTHON3_ORDERED_SET).$(PYTHON3_ORDERED_SET_SUFFIX)
PYTHON3_ORDERED_SET_DIR		:= $(BUILDDIR)/$(PYTHON3_ORDERED_SET)
PYTHON3_ORDERED_SET_LICENSE	:= unknown
PYTHON3_ORDERED_SET_LICENSE_FILES	:=

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

PYTHON3_ORDERED_SET_CONF_TOOL	:= python3

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-ordered-set.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-ordered-set)
	@$(call install_fixup, python3-ordered-set,PRIORITY,optional)
	@$(call install_fixup, python3-ordered-set,SECTION,base)
	@$(call install_fixup, python3-ordered-set,AUTHOR,"Oleksij Rempel <Oleksij Rempel <o.rempel@pengutronix.de>>")
	@$(call install_fixup, python3-ordered-set,DESCRIPTION,missing)

	@$(call install_glob, python3-ordered-set, 0, 0, -, \
		$(PYTHON3_SITEPACKAGES),, *.py)

	@$(call install_finish, python3-ordered-set)

	@$(call touch)

# vim: syntax=make
