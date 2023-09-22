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
PACKAGES-$(PTXCONF_PYTHON3_WERKZEUG) += python3-werkzeug

#
# Paths and names
#
PYTHON3_WERKZEUG_VERSION	:= 2.2.3
PYTHON3_WERKZEUG_MD5		:= 28c3ec6a4b1ce8f06c85612c1dfa351a
PYTHON3_WERKZEUG		:= Werkzeug-$(PYTHON3_WERKZEUG_VERSION)
PYTHON3_WERKZEUG_SUFFIX	:= tar.gz
PYTHON3_WERKZEUG_URL		:= $(call ptx/mirror-pypi, Werkzeug, $(PYTHON3_WERKZEUG).$(PYTHON3_WERKZEUG_SUFFIX))
PYTHON3_WERKZEUG_SOURCE	:= $(SRCDIR)/$(PYTHON3_WERKZEUG).$(PYTHON3_WERKZEUG_SUFFIX)
PYTHON3_WERKZEUG_DIR		:= $(BUILDDIR)/$(PYTHON3_WERKZEUG)
PYTHON3_WERKZEUG_LICENSE	:= unknown
PYTHON3_WERKZEUG_LICENSE_FILES	:=

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

PYTHON3_WERKZEUG_CONF_TOOL	:= python3

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-werkzeug.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-werkzeug)
	@$(call install_fixup, python3-werkzeug,PRIORITY,optional)
	@$(call install_fixup, python3-werkzeug,SECTION,base)
	@$(call install_fixup, python3-werkzeug,AUTHOR,"Oleksij Rempel <Oleksij Rempel <o.rempel@pengutronix.de>>")
	@$(call install_fixup, python3-werkzeug,DESCRIPTION,missing)

	@$(call install_glob, python3-werkzeug, 0, 0, -, \
		$(PYTHON3_SITEPACKAGES),, *.py)

	@$(call install_finish, python3-werkzeug)

	@$(call touch)

# vim: syntax=make
