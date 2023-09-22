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
PACKAGES-$(PTXCONF_PYTHON3_JINJA2) += python3-jinja2

#
# Paths and names
#
PYTHON3_JINJA2_VERSION	:= 3.1.2
PYTHON3_JINJA2_MD5		:= d31148abd89c1df1cdb077a55db27d02
PYTHON3_JINJA2		:= Jinja2-$(PYTHON3_JINJA2_VERSION)
PYTHON3_JINJA2_SUFFIX	:= tar.gz
PYTHON3_JINJA2_URL		:= $(call ptx/mirror-pypi, Jinja2, $(PYTHON3_JINJA2).$(PYTHON3_JINJA2_SUFFIX))
PYTHON3_JINJA2_SOURCE	:= $(SRCDIR)/$(PYTHON3_JINJA2).$(PYTHON3_JINJA2_SUFFIX)
PYTHON3_JINJA2_DIR		:= $(BUILDDIR)/$(PYTHON3_JINJA2)
PYTHON3_JINJA2_LICENSE	:= unknown
PYTHON3_JINJA2_LICENSE_FILES	:=

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

PYTHON3_JINJA2_CONF_TOOL	:= python3

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-jinja2.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-jinja2)
	@$(call install_fixup, python3-jinja2,PRIORITY,optional)
	@$(call install_fixup, python3-jinja2,SECTION,base)
	@$(call install_fixup, python3-jinja2,AUTHOR,"Oleksij Rempel <Oleksij Rempel <o.rempel@pengutronix.de>>")
	@$(call install_fixup, python3-jinja2,DESCRIPTION,missing)

	@$(call install_glob, python3-jinja2, 0, 0, -, \
		$(PYTHON3_SITEPACKAGES),, *.py)

	@$(call install_finish, python3-jinja2)

	@$(call touch)

# vim: syntax=make