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
PACKAGES-$(PTXCONF_PYTHON3_WRAPT) += python3-wrapt

#
# Paths and names
#
PYTHON3_WRAPT_VERSION	:= 1.15.0
PYTHON3_WRAPT_MD5		:= 1d5b17810f1fb5db543185651ddb0fce
PYTHON3_WRAPT		:= wrapt-$(PYTHON3_WRAPT_VERSION)
PYTHON3_WRAPT_SUFFIX	:= tar.gz
PYTHON3_WRAPT_URL		:= $(call ptx/mirror-pypi, wrapt, $(PYTHON3_WRAPT).$(PYTHON3_WRAPT_SUFFIX))
PYTHON3_WRAPT_SOURCE	:= $(SRCDIR)/$(PYTHON3_WRAPT).$(PYTHON3_WRAPT_SUFFIX)
PYTHON3_WRAPT_DIR		:= $(BUILDDIR)/$(PYTHON3_WRAPT)
PYTHON3_WRAPT_LICENSE	:= unknown
PYTHON3_WRAPT_LICENSE_FILES	:=

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

PYTHON3_WRAPT_CONF_TOOL	:= python3

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-wrapt.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-wrapt)
	@$(call install_fixup, python3-wrapt,PRIORITY,optional)
	@$(call install_fixup, python3-wrapt,SECTION,base)
	@$(call install_fixup, python3-wrapt,AUTHOR,"Oleksij Rempel <Oleksij Rempel <o.rempel@pengutronix.de>>")
	@$(call install_fixup, python3-wrapt,DESCRIPTION,missing)

	@$(call install_glob, python3-wrapt, 0, 0, -, \
		$(PYTHON3_SITEPACKAGES),, *.py)

	@$(call install_finish, python3-wrapt)

	@$(call touch)

# vim: syntax=make
