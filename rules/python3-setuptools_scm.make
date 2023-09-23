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
PACKAGES-$(PTXCONF_PYTHON3_SETUPTOOLS_SCM) += python3-setuptools_scm

#
# Paths and names
#
PYTHON3_SETUPTOOLS_SCM_VERSION	:= 6.2.0
PYTHON3_SETUPTOOLS_SCM_MD5		:= 29c61d2f3d1be7056f5fabce260b3c8f
PYTHON3_SETUPTOOLS_SCM		:= setuptools_scm-$(PYTHON3_SETUPTOOLS_SCM_VERSION)
PYTHON3_SETUPTOOLS_SCM_SUFFIX	:= tar.gz
PYTHON3_SETUPTOOLS_SCM_URL		:= $(call ptx/mirror-pypi, setuptools_scm, $(PYTHON3_SETUPTOOLS_SCM).$(PYTHON3_SETUPTOOLS_SCM_SUFFIX))
PYTHON3_SETUPTOOLS_SCM_SOURCE	:= $(SRCDIR)/$(PYTHON3_SETUPTOOLS_SCM).$(PYTHON3_SETUPTOOLS_SCM_SUFFIX)
PYTHON3_SETUPTOOLS_SCM_DIR		:= $(BUILDDIR)/$(PYTHON3_SETUPTOOLS_SCM)
PYTHON3_SETUPTOOLS_SCM_LICENSE	:= unknown
PYTHON3_SETUPTOOLS_SCM_LICENSE_FILES	:=

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

PYTHON3_SETUPTOOLS_SCM_CONF_TOOL	:= python3

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-setuptools_scm.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-setuptools_scm)
	@$(call install_fixup, python3-setuptools_scm,PRIORITY,optional)
	@$(call install_fixup, python3-setuptools_scm,SECTION,base)
	@$(call install_fixup, python3-setuptools_scm,AUTHOR,"Oleksij Rempel <o.rempel@pengutronix.de>")
	@$(call install_fixup, python3-setuptools_scm,DESCRIPTION,missing)

	@$(call install_glob, python3-setuptools_scm, 0, 0, -, \
		$(PYTHON3_SITEPACKAGES),,)

	@$(call install_finish, python3-setuptools_scm)

	@$(call touch)

# vim: syntax=make
