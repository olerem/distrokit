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
PACKAGES-$(PTXCONF_PYTHON3_BABEL) += python3-babel

#
# Paths and names
#
PYTHON3_BABEL_VERSION	:= 2.12.1
PYTHON3_BABEL_MD5		:= 9ac7d8aac42c17a1e6d922017058d2c8
PYTHON3_BABEL		:= Babel-$(PYTHON3_BABEL_VERSION)
PYTHON3_BABEL_SUFFIX	:= tar.gz
PYTHON3_BABEL_URL		:= $(call ptx/mirror-pypi, Babel, $(PYTHON3_BABEL).$(PYTHON3_BABEL_SUFFIX))
PYTHON3_BABEL_SOURCE	:= $(SRCDIR)/$(PYTHON3_BABEL).$(PYTHON3_BABEL_SUFFIX)
PYTHON3_BABEL_DIR		:= $(BUILDDIR)/$(PYTHON3_BABEL)
PYTHON3_BABEL_LICENSE	:= unknown
PYTHON3_BABEL_LICENSE_FILES	:=

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

PYTHON3_BABEL_CONF_TOOL	:= python3

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-babel.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-babel)
	@$(call install_fixup, python3-babel,PRIORITY,optional)
	@$(call install_fixup, python3-babel,SECTION,base)
	@$(call install_fixup, python3-babel,AUTHOR,"Oleksij Rempel <o.rempel@pengutronix.de>")
	@$(call install_fixup, python3-babel,DESCRIPTION,missing)

	@$(call install_glob, python3-babel, 0, 0, -, \
		$(PYTHON3_SITEPACKAGES),, *.py)

	@$(call install_finish, python3-babel)

	@$(call touch)

# vim: syntax=make
