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
PACKAGES-$(PTXCONF_PYTHON3_FLASK_LOGIN) += python3-flask-login

#
# Paths and names
#
PYTHON3_FLASK_LOGIN_VERSION	:= 0.6.2
PYTHON3_FLASK_LOGIN_MD5		:= 8020b22ad7ec6f17034f90117a520633
PYTHON3_FLASK_LOGIN		:= Flask-Login-$(PYTHON3_FLASK_LOGIN_VERSION)
PYTHON3_FLASK_LOGIN_SUFFIX	:= tar.gz
PYTHON3_FLASK_LOGIN_URL		:= $(call ptx/mirror-pypi, Flask-Login, $(PYTHON3_FLASK_LOGIN).$(PYTHON3_FLASK_LOGIN_SUFFIX))
PYTHON3_FLASK_LOGIN_SOURCE	:= $(SRCDIR)/$(PYTHON3_FLASK_LOGIN).$(PYTHON3_FLASK_LOGIN_SUFFIX)
PYTHON3_FLASK_LOGIN_DIR		:= $(BUILDDIR)/$(PYTHON3_FLASK_LOGIN)
PYTHON3_FLASK_LOGIN_LICENSE	:= unknown
PYTHON3_FLASK_LOGIN_LICENSE_FILES	:=

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

PYTHON3_FLASK_LOGIN_CONF_TOOL	:= python3

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-flask-login.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-flask-login)
	@$(call install_fixup, python3-flask-login,PRIORITY,optional)
	@$(call install_fixup, python3-flask-login,SECTION,base)
	@$(call install_fixup, python3-flask-login,AUTHOR,"Oleksij Rempel <Oleksij Rempel <o.rempel@pengutronix.de>>")
	@$(call install_fixup, python3-flask-login,DESCRIPTION,missing)

	@$(call install_glob, python3-flask-login, 0, 0, -, \
		$(PYTHON3_SITEPACKAGES),, *.py)

	@$(call install_finish, python3-flask-login)

	@$(call touch)

# vim: syntax=make
