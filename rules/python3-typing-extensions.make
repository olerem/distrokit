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
PACKAGES-$(PTXCONF_PYTHON3_TYPING_EXTENSIONS) += python3-typing-extensions

#
# Paths and names
#
PYTHON3_TYPING_EXTENSIONS_VERSION	:= 4.7.1
PYTHON3_TYPING_EXTENSIONS_MD5		:= 06e7fff4b1d51f8dc6f49b16e71de54e
PYTHON3_TYPING_EXTENSIONS		:= typing_extensions-$(PYTHON3_TYPING_EXTENSIONS_VERSION)
PYTHON3_TYPING_EXTENSIONS_SUFFIX	:= tar.gz
PYTHON3_TYPING_EXTENSIONS_URL		:= $(call ptx/mirror-pypi, typing_extensions, $(PYTHON3_TYPING_EXTENSIONS).$(PYTHON3_TYPING_EXTENSIONS_SUFFIX))
PYTHON3_TYPING_EXTENSIONS_SOURCE	:= $(SRCDIR)/$(PYTHON3_TYPING_EXTENSIONS).$(PYTHON3_TYPING_EXTENSIONS_SUFFIX)
PYTHON3_TYPING_EXTENSIONS_DIR		:= $(BUILDDIR)/$(PYTHON3_TYPING_EXTENSIONS)
PYTHON3_TYPING_EXTENSIONS_LICENSE	:= unknown
PYTHON3_TYPING_EXTENSIONS_LICENSE_FILES	:=

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

PYTHON3_TYPING_EXTENSIONS_CONF_TOOL	:= python3

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-typing-extensions.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-typing-extensions)
	@$(call install_fixup, python3-typing-extensions,PRIORITY,optional)
	@$(call install_fixup, python3-typing-extensions,SECTION,base)
	@$(call install_fixup, python3-typing-extensions,AUTHOR,"Oleksij Rempel <Oleksij Rempel <o.rempel@pengutronix.de>>")
	@$(call install_fixup, python3-typing-extensions,DESCRIPTION,missing)

	# FIXME: no pyc files are generated
	@$(call install_glob, python3-typing-extensions, 0, 0, -, \
		$(PYTHON3_SITEPACKAGES),,)

	@$(call install_finish, python3-typing-extensions)

	@$(call touch)

# vim: syntax=make
