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
PACKAGES-$(PTXCONF_PYTHON3_PYSERIAL) += python3-pyserial

#
# Paths and names
#
PYTHON3_PYSERIAL_VERSION	:= 3.5
PYTHON3_PYSERIAL_MD5		:= 1cf25a76da59b530dbfc2cf99392dc83
PYTHON3_PYSERIAL		:= pyserial-$(PYTHON3_PYSERIAL_VERSION)
PYTHON3_PYSERIAL_SUFFIX	:= tar.gz
PYTHON3_PYSERIAL_URL		:= $(call ptx/mirror-pypi, pyserial, $(PYTHON3_PYSERIAL).$(PYTHON3_PYSERIAL_SUFFIX))
PYTHON3_PYSERIAL_SOURCE	:= $(SRCDIR)/$(PYTHON3_PYSERIAL).$(PYTHON3_PYSERIAL_SUFFIX)
PYTHON3_PYSERIAL_DIR		:= $(BUILDDIR)/$(PYTHON3_PYSERIAL)
PYTHON3_PYSERIAL_LICENSE	:= unknown
PYTHON3_PYSERIAL_LICENSE_FILES	:=

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

PYTHON3_PYSERIAL_CONF_TOOL	:= python3

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-pyserial.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-pyserial)
	@$(call install_fixup, python3-pyserial,PRIORITY,optional)
	@$(call install_fixup, python3-pyserial,SECTION,base)
	@$(call install_fixup, python3-pyserial,AUTHOR,"Oleksij Rempel <o.rempel@pengutronix.de>")
	@$(call install_fixup, python3-pyserial,DESCRIPTION,missing)

	@$(call install_glob, python3-pyserial, 0, 0, -, \
		$(PYTHON3_SITEPACKAGES),, *.py)

	@$(call install_finish, python3-pyserial)

	@$(call touch)

# vim: syntax=make
