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
PACKAGES-$(PTXCONF_PYTHON3_WATCHDOG) += python3-watchdog

#
# Paths and names
#
PYTHON3_WATCHDOG_VERSION	:= 2.3.1
PYTHON3_WATCHDOG_MD5		:= a1c410a91204340adfb231a4909f70d1
PYTHON3_WATCHDOG		:= watchdog-$(PYTHON3_WATCHDOG_VERSION)
PYTHON3_WATCHDOG_SUFFIX	:= tar.gz
PYTHON3_WATCHDOG_URL		:= $(call ptx/mirror-pypi, watchdog, $(PYTHON3_WATCHDOG).$(PYTHON3_WATCHDOG_SUFFIX))
PYTHON3_WATCHDOG_SOURCE	:= $(SRCDIR)/$(PYTHON3_WATCHDOG).$(PYTHON3_WATCHDOG_SUFFIX)
PYTHON3_WATCHDOG_DIR		:= $(BUILDDIR)/$(PYTHON3_WATCHDOG)
PYTHON3_WATCHDOG_LICENSE	:= unknown
PYTHON3_WATCHDOG_LICENSE_FILES	:=

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

PYTHON3_WATCHDOG_CONF_TOOL	:= python3

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-watchdog.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-watchdog)
	@$(call install_fixup, python3-watchdog,PRIORITY,optional)
	@$(call install_fixup, python3-watchdog,SECTION,base)
	@$(call install_fixup, python3-watchdog,AUTHOR,"Oleksij Rempel <o.rempel@pengutronix.de>")
	@$(call install_fixup, python3-watchdog,DESCRIPTION,missing)

	@$(call install_glob, python3-watchdog, 0, 0, -, \
		$(PYTHON3_SITEPACKAGES),, *.py)

	@$(call install_finish, python3-watchdog)

	@$(call touch)

# vim: syntax=make
