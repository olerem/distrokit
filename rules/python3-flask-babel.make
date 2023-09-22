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
PACKAGES-$(PTXCONF_PYTHON3_FLASK_BABEL) += python3-flask-babel

#
# Paths and names
#
PYTHON3_FLASK_BABEL_VERSION	:= 3.1.0
PYTHON3_FLASK_BABEL_MD5		:= ad0a1b69044dde430ad9319d3a2f7b47
PYTHON3_FLASK_BABEL		:= flask_babel-$(PYTHON3_FLASK_BABEL_VERSION)
PYTHON3_FLASK_BABEL_SUFFIX	:= tar.gz
PYTHON3_FLASK_BABEL_URL		:= $(call ptx/mirror-pypi, flask_babel, $(PYTHON3_FLASK_BABEL).$(PYTHON3_FLASK_BABEL_SUFFIX))
PYTHON3_FLASK_BABEL_SOURCE	:= $(SRCDIR)/$(PYTHON3_FLASK_BABEL).$(PYTHON3_FLASK_BABEL_SUFFIX)
PYTHON3_FLASK_BABEL_DIR		:= $(BUILDDIR)/$(PYTHON3_FLASK_BABEL)
PYTHON3_FLASK_BABEL_LICENSE	:= unknown
PYTHON3_FLASK_BABEL_LICENSE_FILES	:=

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

PYTHON3_FLASK_BABEL_CONF_TOOL	:= python3

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-flask-babel.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-flask-babel)
	@$(call install_fixup, python3-flask-babel,PRIORITY,optional)
	@$(call install_fixup, python3-flask-babel,SECTION,base)
	@$(call install_fixup, python3-flask-babel,AUTHOR,"Oleksij Rempel <o.rempel@pengutronix.de>")
	@$(call install_fixup, python3-flask-babel,DESCRIPTION,missing)

	@$(call install_glob, python3-flask-babel, 0, 0, -, \
		$(PYTHON3_SITEPACKAGES),,)

	@$(call install_finish, python3-flask-babel)

	@$(call touch)

# vim: syntax=make
