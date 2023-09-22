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
PACKAGES-$(PTXCONF_PYTHON3_FLASK_ASSETS) += python3-flask-assets

#
# Paths and names
#
PYTHON3_FLASK_ASSETS_VERSION	:= 2.0
PYTHON3_FLASK_ASSETS_MD5		:= 796f5c29b253e01c9cbf62c5d00cc15f
PYTHON3_FLASK_ASSETS		:= Flask-Assets-$(PYTHON3_FLASK_ASSETS_VERSION)
PYTHON3_FLASK_ASSETS_SUFFIX	:= tar.gz
PYTHON3_FLASK_ASSETS_URL		:= $(call ptx/mirror-pypi, Flask-Assets, $(PYTHON3_FLASK_ASSETS).$(PYTHON3_FLASK_ASSETS_SUFFIX))
PYTHON3_FLASK_ASSETS_SOURCE	:= $(SRCDIR)/$(PYTHON3_FLASK_ASSETS).$(PYTHON3_FLASK_ASSETS_SUFFIX)
PYTHON3_FLASK_ASSETS_DIR		:= $(BUILDDIR)/$(PYTHON3_FLASK_ASSETS)
PYTHON3_FLASK_ASSETS_LICENSE	:= unknown
PYTHON3_FLASK_ASSETS_LICENSE_FILES	:=

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

PYTHON3_FLASK_ASSETS_CONF_TOOL	:= python3

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-flask-assets.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-flask-assets)
	@$(call install_fixup, python3-flask-assets,PRIORITY,optional)
	@$(call install_fixup, python3-flask-assets,SECTION,base)
	@$(call install_fixup, python3-flask-assets,AUTHOR,"Oleksij Rempel <Oleksij Rempel <o.rempel@pengutronix.de>>")
	@$(call install_fixup, python3-flask-assets,DESCRIPTION,missing)

	@$(call install_glob, python3-flask-assets, 0, 0, -, \
		$(PYTHON3_SITEPACKAGES),, *.py)

	@$(call install_finish, python3-flask-assets)

	@$(call touch)

# vim: syntax=make
