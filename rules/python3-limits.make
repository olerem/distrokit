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
PACKAGES-$(PTXCONF_PYTHON3_LIMITS) += python3-limits

#
# Paths and names
#
PYTHON3_LIMITS_VERSION	:= 3.5.0
PYTHON3_LIMITS_MD5		:= feedbc077763e4f0bb8e97c71dcd2176
PYTHON3_LIMITS		:= limits-$(PYTHON3_LIMITS_VERSION)
PYTHON3_LIMITS_SUFFIX	:= tar.gz
PYTHON3_LIMITS_URL		:= $(call ptx/mirror-pypi, limits, $(PYTHON3_LIMITS).$(PYTHON3_LIMITS_SUFFIX))
PYTHON3_LIMITS_SOURCE	:= $(SRCDIR)/$(PYTHON3_LIMITS).$(PYTHON3_LIMITS_SUFFIX)
PYTHON3_LIMITS_DIR		:= $(BUILDDIR)/$(PYTHON3_LIMITS)
PYTHON3_LIMITS_LICENSE	:= unknown
PYTHON3_LIMITS_LICENSE_FILES	:=

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

PYTHON3_LIMITS_CONF_TOOL	:= python3

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-limits.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-limits)
	@$(call install_fixup, python3-limits,PRIORITY,optional)
	@$(call install_fixup, python3-limits,SECTION,base)
	@$(call install_fixup, python3-limits,AUTHOR,"Oleksij Rempel <Oleksij Rempel <o.rempel@pengutronix.de>>")
	@$(call install_fixup, python3-limits,DESCRIPTION,missing)

	@$(call install_glob, python3-limits, 0, 0, -, \
		$(PYTHON3_SITEPACKAGES),, *.py)

	@$(call install_finish, python3-limits)

	@$(call touch)

# vim: syntax=make
