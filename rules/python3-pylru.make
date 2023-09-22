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
PACKAGES-$(PTXCONF_PYTHON3_PYLRU) += python3-pylru

#
# Paths and names
#
PYTHON3_PYLRU_VERSION	:= 1.2.1
PYTHON3_PYLRU_MD5		:= 101486c319fa219f147b8811975780d9
PYTHON3_PYLRU		:= pylru-$(PYTHON3_PYLRU_VERSION)
PYTHON3_PYLRU_SUFFIX	:= tar.gz
PYTHON3_PYLRU_URL		:= $(call ptx/mirror-pypi, pylru, $(PYTHON3_PYLRU).$(PYTHON3_PYLRU_SUFFIX))
PYTHON3_PYLRU_SOURCE	:= $(SRCDIR)/$(PYTHON3_PYLRU).$(PYTHON3_PYLRU_SUFFIX)
PYTHON3_PYLRU_DIR		:= $(BUILDDIR)/$(PYTHON3_PYLRU)
PYTHON3_PYLRU_LICENSE	:= unknown
PYTHON3_PYLRU_LICENSE_FILES	:=

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

PYTHON3_PYLRU_CONF_TOOL	:= python3

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-pylru.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-pylru)
	@$(call install_fixup, python3-pylru,PRIORITY,optional)
	@$(call install_fixup, python3-pylru,SECTION,base)
	@$(call install_fixup, python3-pylru,AUTHOR,"Oleksij Rempel <o.rempel@pengutronix.de>")
	@$(call install_fixup, python3-pylru,DESCRIPTION,missing)

	@$(call install_glob, python3-pylru, 0, 0, -, \
		$(PYTHON3_SITEPACKAGES),, *.py)

	@$(call install_finish, python3-pylru)

	@$(call touch)

# vim: syntax=make
