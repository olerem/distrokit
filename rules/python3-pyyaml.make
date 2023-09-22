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
PACKAGES-$(PTXCONF_PYTHON3_PYYAML) += python3-pyyaml

#
# Paths and names
#
PYTHON3_PYYAML_VERSION	:= 5.4.1
PYTHON3_PYYAML_MD5		:= 46e25294c7efec23d4072ed6a7777f46
PYTHON3_PYYAML		:= PyYAML-$(PYTHON3_PYYAML_VERSION)
PYTHON3_PYYAML_SUFFIX	:= tar.gz
PYTHON3_PYYAML_URL		:= $(call ptx/mirror-pypi, PyYAML, $(PYTHON3_PYYAML).$(PYTHON3_PYYAML_SUFFIX))
PYTHON3_PYYAML_SOURCE	:= $(SRCDIR)/$(PYTHON3_PYYAML).$(PYTHON3_PYYAML_SUFFIX)
PYTHON3_PYYAML_DIR		:= $(BUILDDIR)/$(PYTHON3_PYYAML)
PYTHON3_PYYAML_LICENSE	:= unknown
PYTHON3_PYYAML_LICENSE_FILES	:=

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

PYTHON3_PYYAML_CONF_TOOL	:= python3

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-pyyaml.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-pyyaml)
	@$(call install_fixup, python3-pyyaml,PRIORITY,optional)
	@$(call install_fixup, python3-pyyaml,SECTION,base)
	@$(call install_fixup, python3-pyyaml,AUTHOR,"Oleksij Rempel <o.rempel@pengutronix.de>")
	@$(call install_fixup, python3-pyyaml,DESCRIPTION,missing)

	@$(call install_glob, python3-pyyaml, 0, 0, -, \
		$(PYTHON3_SITEPACKAGES),, *.py)

	@$(call install_finish, python3-pyyaml)

	@$(call touch)

# vim: syntax=make
