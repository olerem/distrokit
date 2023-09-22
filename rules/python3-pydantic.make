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
PACKAGES-$(PTXCONF_PYTHON3_PYDANTIC) += python3-pydantic

#
# Paths and names
#
PYTHON3_PYDANTIC_VERSION	:= 1.10.11
PYTHON3_PYDANTIC_MD5		:= ee25a519c329ec8932458ab2c852da23
PYTHON3_PYDANTIC		:= pydantic-$(PYTHON3_PYDANTIC_VERSION)
PYTHON3_PYDANTIC_SUFFIX	:= tar.gz
PYTHON3_PYDANTIC_URL		:= $(call ptx/mirror-pypi, pydantic, $(PYTHON3_PYDANTIC).$(PYTHON3_PYDANTIC_SUFFIX))
PYTHON3_PYDANTIC_SOURCE	:= $(SRCDIR)/$(PYTHON3_PYDANTIC).$(PYTHON3_PYDANTIC_SUFFIX)
PYTHON3_PYDANTIC_DIR		:= $(BUILDDIR)/$(PYTHON3_PYDANTIC)
PYTHON3_PYDANTIC_LICENSE	:= unknown
PYTHON3_PYDANTIC_LICENSE_FILES	:=

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

PYTHON3_PYDANTIC_CONF_TOOL	:= python3

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-pydantic.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-pydantic)
	@$(call install_fixup, python3-pydantic,PRIORITY,optional)
	@$(call install_fixup, python3-pydantic,SECTION,base)
	@$(call install_fixup, python3-pydantic,AUTHOR,"Oleksij Rempel <o.rempel@pengutronix.de>")
	@$(call install_fixup, python3-pydantic,DESCRIPTION,missing)

	@$(call install_glob, python3-pydantic, 0, 0, -, \
		$(PYTHON3_SITEPACKAGES),, *.py)

	@$(call install_finish, python3-pydantic)

	@$(call touch)

# vim: syntax=make
