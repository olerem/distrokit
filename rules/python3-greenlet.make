# -*-makefile-*-
#
# Copyright (C) 2021 by Oleksij Rempel <o.rempel@pengutronix.de>
#
# For further information about the PTXdist project and license conditions
# see the README file.
#

#
# We provide this package
#
PACKAGES-$(PTXCONF_PYTHON3_GREENLET) += python3-greenlet

#
# Paths and names
#
PYTHON3_GREENLET_VERSION	:= 1.1.1
PYTHON3_GREENLET_MD5		:= a3fbf41851a6b5e1e823e8c18905877c
PYTHON3_GREENLET		:= greenlet-$(PYTHON3_GREENLET_VERSION)
PYTHON3_GREENLET_SUFFIX	:= tar.gz
PYTHON3_GREENLET_URL		:= $(call ptx/mirror-pypi, greenlet, $(PYTHON3_GREENLET).$(PYTHON3_GREENLET_SUFFIX))
PYTHON3_GREENLET_SOURCE	:= $(SRCDIR)/$(PYTHON3_GREENLET).$(PYTHON3_GREENLET_SUFFIX)
PYTHON3_GREENLET_DIR		:= $(BUILDDIR)/$(PYTHON3_GREENLET)
PYTHON3_GREENLET_LICENSE	:= unknown
PYTHON3_GREENLET_LICENSE_FILES	:=

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

PYTHON3_GREENLET_CONF_TOOL	:= python3

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-greenlet.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-greenlet)
	@$(call install_fixup, python3-greenlet,PRIORITY,optional)
	@$(call install_fixup, python3-greenlet,SECTION,base)
	@$(call install_fixup, python3-greenlet,AUTHOR,"Oleksij Rempel <o.rempel@pengutronix.de>")
	@$(call install_fixup, python3-greenlet,DESCRIPTION,missing)

	@$(call install_glob, python3-greenlet, 0, 0, -, \
		$(PYTHON3_SITEPACKAGES),, *.py)

	@$(call install_finish, python3-greenlet)

	@$(call touch)

# vim: syntax=make
