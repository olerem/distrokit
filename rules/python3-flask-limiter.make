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
PACKAGES-$(PTXCONF_PYTHON3_FLASK_LIMITER) += python3-flask-limiter

#
# Paths and names
#
PYTHON3_FLASK_LIMITER_VERSION	:= 3.3.1
PYTHON3_FLASK_LIMITER_MD5		:= 63ea3b1ab2f417b194cf93e3e89a4662
PYTHON3_FLASK_LIMITER		:= Flask-Limiter-$(PYTHON3_FLASK_LIMITER_VERSION)
PYTHON3_FLASK_LIMITER_SUFFIX	:= tar.gz
PYTHON3_FLASK_LIMITER_URL		:= $(call ptx/mirror-pypi, Flask-Limiter, $(PYTHON3_FLASK_LIMITER).$(PYTHON3_FLASK_LIMITER_SUFFIX))
PYTHON3_FLASK_LIMITER_SOURCE	:= $(SRCDIR)/$(PYTHON3_FLASK_LIMITER).$(PYTHON3_FLASK_LIMITER_SUFFIX)
PYTHON3_FLASK_LIMITER_DIR		:= $(BUILDDIR)/$(PYTHON3_FLASK_LIMITER)
PYTHON3_FLASK_LIMITER_LICENSE	:= unknown
PYTHON3_FLASK_LIMITER_LICENSE_FILES	:=

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

PYTHON3_FLASK_LIMITER_CONF_TOOL	:= python3

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-flask-limiter.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-flask-limiter)
	@$(call install_fixup, python3-flask-limiter,PRIORITY,optional)
	@$(call install_fixup, python3-flask-limiter,SECTION,base)
	@$(call install_fixup, python3-flask-limiter,AUTHOR,"Oleksij Rempel <Oleksij Rempel <o.rempel@pengutronix.de>>")
	@$(call install_fixup, python3-flask-limiter,DESCRIPTION,missing)

	@$(call install_glob, python3-flask-limiter, 0, 0, -, \
		$(PYTHON3_SITEPACKAGES),, *.py)

	@$(call install_finish, python3-flask-limiter)

	@$(call touch)

# vim: syntax=make
