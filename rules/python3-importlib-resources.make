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
PACKAGES-$(PTXCONF_PYTHON3_IMPORTLIB_RESOURCES) += python3-importlib-resources

#
# Paths and names
#
PYTHON3_IMPORTLIB_RESOURCES_VERSION	:= 6.0.0
PYTHON3_IMPORTLIB_RESOURCES_MD5		:= 81b4070989c8ae661532543049ca528d
PYTHON3_IMPORTLIB_RESOURCES		:= importlib_resources-$(PYTHON3_IMPORTLIB_RESOURCES_VERSION)
PYTHON3_IMPORTLIB_RESOURCES_SUFFIX	:= tar.gz
PYTHON3_IMPORTLIB_RESOURCES_URL		:= $(call ptx/mirror-pypi, importlib_resources, $(PYTHON3_IMPORTLIB_RESOURCES).$(PYTHON3_IMPORTLIB_RESOURCES_SUFFIX))
PYTHON3_IMPORTLIB_RESOURCES_SOURCE	:= $(SRCDIR)/$(PYTHON3_IMPORTLIB_RESOURCES).$(PYTHON3_IMPORTLIB_RESOURCES_SUFFIX)
PYTHON3_IMPORTLIB_RESOURCES_DIR		:= $(BUILDDIR)/$(PYTHON3_IMPORTLIB_RESOURCES)
PYTHON3_IMPORTLIB_RESOURCES_LICENSE	:= unknown
PYTHON3_IMPORTLIB_RESOURCES_LICENSE_FILES	:=

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

PYTHON3_IMPORTLIB_RESOURCES_CONF_TOOL	:= python3

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-importlib-resources.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-importlib-resources)
	@$(call install_fixup, python3-importlib-resources,PRIORITY,optional)
	@$(call install_fixup, python3-importlib-resources,SECTION,base)
	@$(call install_fixup, python3-importlib-resources,AUTHOR,"Oleksij Rempel <Oleksij Rempel <o.rempel@pengutronix.de>>")
	@$(call install_fixup, python3-importlib-resources,DESCRIPTION,missing)

	@$(call install_glob, python3-importlib-resources, 0, 0, -, \
		$(PYTHON3_SITEPACKAGES),,)

	@$(call install_finish, python3-importlib-resources)

	@$(call touch)

# vim: syntax=make
