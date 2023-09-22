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
PACKAGES-$(PTXCONF_PYTHON3_FLASK) += python3-flask

#
# Paths and names
#
PYTHON3_FLASK_VERSION	:= 2.2.3
PYTHON3_FLASK_MD5		:= 09a3dfdc4fc622ec49910cfd62f45eaa
PYTHON3_FLASK		:= Flask-$(PYTHON3_FLASK_VERSION)
PYTHON3_FLASK_SUFFIX	:= tar.gz
PYTHON3_FLASK_URL		:= $(call ptx/mirror-pypi, Flask, $(PYTHON3_FLASK).$(PYTHON3_FLASK_SUFFIX))
PYTHON3_FLASK_SOURCE	:= $(SRCDIR)/$(PYTHON3_FLASK).$(PYTHON3_FLASK_SUFFIX)
PYTHON3_FLASK_DIR		:= $(BUILDDIR)/$(PYTHON3_FLASK)
PYTHON3_FLASK_LICENSE	:= unknown
PYTHON3_FLASK_LICENSE_FILES	:=

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

PYTHON3_FLASK_CONF_TOOL	:= python3

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-flask.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-flask)
	@$(call install_fixup, python3-flask,PRIORITY,optional)
	@$(call install_fixup, python3-flask,SECTION,base)
	@$(call install_fixup, python3-flask,AUTHOR,"Oleksij Rempel <Oleksij Rempel <o.rempel@pengutronix.de>>")
	@$(call install_fixup, python3-flask,DESCRIPTION,missing)

	@$(call install_glob, python3-flask, 0, 0, -, \
		$(PYTHON3_SITEPACKAGES),, *.py)

	@$(call install_finish, python3-flask)

	@$(call touch)

# vim: syntax=make
