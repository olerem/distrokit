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
PACKAGES-$(PTXCONF_PYTHON3_ITSDANGEROUS) += python3-itsdangerous

#
# Paths and names
#
PYTHON3_ITSDANGEROUS_VERSION	:= 2.1.2
PYTHON3_ITSDANGEROUS_MD5		:= c1bc730ddf53b8374eaa823f24eb6438
PYTHON3_ITSDANGEROUS		:= itsdangerous-$(PYTHON3_ITSDANGEROUS_VERSION)
PYTHON3_ITSDANGEROUS_SUFFIX	:= tar.gz
PYTHON3_ITSDANGEROUS_URL		:= $(call ptx/mirror-pypi, itsdangerous, $(PYTHON3_ITSDANGEROUS).$(PYTHON3_ITSDANGEROUS_SUFFIX))
PYTHON3_ITSDANGEROUS_SOURCE	:= $(SRCDIR)/$(PYTHON3_ITSDANGEROUS).$(PYTHON3_ITSDANGEROUS_SUFFIX)
PYTHON3_ITSDANGEROUS_DIR		:= $(BUILDDIR)/$(PYTHON3_ITSDANGEROUS)
PYTHON3_ITSDANGEROUS_LICENSE	:= unknown
PYTHON3_ITSDANGEROUS_LICENSE_FILES	:=

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

PYTHON3_ITSDANGEROUS_CONF_TOOL	:= python3

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-itsdangerous.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-itsdangerous)
	@$(call install_fixup, python3-itsdangerous,PRIORITY,optional)
	@$(call install_fixup, python3-itsdangerous,SECTION,base)
	@$(call install_fixup, python3-itsdangerous,AUTHOR,"Oleksij Rempel <Oleksij Rempel <o.rempel@pengutronix.de>>")
	@$(call install_fixup, python3-itsdangerous,DESCRIPTION,missing)

	@$(call install_glob, python3-itsdangerous, 0, 0, -, \
		$(PYTHON3_SITEPACKAGES),, *.py)

	@$(call install_finish, python3-itsdangerous)

	@$(call touch)

# vim: syntax=make