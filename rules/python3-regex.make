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
PACKAGES-$(PTXCONF_PYTHON3_REGEX) += python3-regex

#
# Paths and names
#
PYTHON3_REGEX_VERSION	:= 2023.6.3
PYTHON3_REGEX_MD5		:= 8bd710d62b727ca92c89ab566bdf5128
PYTHON3_REGEX		:= regex-$(PYTHON3_REGEX_VERSION)
PYTHON3_REGEX_SUFFIX	:= tar.gz
PYTHON3_REGEX_URL		:= $(call ptx/mirror-pypi, regex, $(PYTHON3_REGEX).$(PYTHON3_REGEX_SUFFIX))
PYTHON3_REGEX_SOURCE	:= $(SRCDIR)/$(PYTHON3_REGEX).$(PYTHON3_REGEX_SUFFIX)
PYTHON3_REGEX_DIR		:= $(BUILDDIR)/$(PYTHON3_REGEX)
PYTHON3_REGEX_LICENSE	:= unknown
PYTHON3_REGEX_LICENSE_FILES	:=

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

PYTHON3_REGEX_CONF_TOOL	:= python3

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-regex.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-regex)
	@$(call install_fixup, python3-regex,PRIORITY,optional)
	@$(call install_fixup, python3-regex,SECTION,base)
	@$(call install_fixup, python3-regex,AUTHOR,"Oleksij Rempel <o.rempel@pengutronix.de>")
	@$(call install_fixup, python3-regex,DESCRIPTION,missing)

	@$(call install_glob, python3-regex, 0, 0, -, \
		$(PYTHON3_SITEPACKAGES),, *.py)

	@$(call install_finish, python3-regex)

	@$(call touch)

# vim: syntax=make
