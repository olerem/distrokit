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
PACKAGES-$(PTXCONF_PYTHON3_FUTURE) += python3-future

#
# Paths and names
#
PYTHON3_FUTURE_VERSION	:= 0.18.3
PYTHON3_FUTURE_MD5		:= dedcb70d14b23388670d54145aab8be4
PYTHON3_FUTURE		:= future-$(PYTHON3_FUTURE_VERSION)
PYTHON3_FUTURE_SUFFIX	:= tar.gz
PYTHON3_FUTURE_URL		:= $(call ptx/mirror-pypi, future, $(PYTHON3_FUTURE).$(PYTHON3_FUTURE_SUFFIX))
PYTHON3_FUTURE_SOURCE	:= $(SRCDIR)/$(PYTHON3_FUTURE).$(PYTHON3_FUTURE_SUFFIX)
PYTHON3_FUTURE_DIR		:= $(BUILDDIR)/$(PYTHON3_FUTURE)
PYTHON3_FUTURE_LICENSE	:= unknown
PYTHON3_FUTURE_LICENSE_FILES	:=

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

PYTHON3_FUTURE_CONF_TOOL	:= python3

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-future.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-future)
	@$(call install_fixup, python3-future,PRIORITY,optional)
	@$(call install_fixup, python3-future,SECTION,base)
	@$(call install_fixup, python3-future,AUTHOR,"Oleksij Rempel <Oleksij Rempel <o.rempel@pengutronix.de>>")
	@$(call install_fixup, python3-future,DESCRIPTION,missing)

	@$(call install_glob, python3-future, 0, 0, -, \
		$(PYTHON3_SITEPACKAGES),, *.py)

	@$(call install_finish, python3-future)

	@$(call touch)

# vim: syntax=make
