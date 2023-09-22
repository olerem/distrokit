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
PACKAGES-$(PTXCONF_HOST_PYTHON3_FLASK) += host-python3-flask

#
# Paths and names
#
HOST_PYTHON3_FLASK_VERSION		:= 2.3.2
HOST_PYTHON3_FLASK_MD5		:= a5d5fe05dff5c6e0d28ece3fb03ef5cd
HOST_PYTHON3_FLASK			:= Flask-$(HOST_PYTHON3_FLASK_VERSION)
HOST_PYTHON3_FLASK_SUFFIX		:= tar.gz
HOST_PYTHON3_FLASK_URL		:= $(call ptx/mirror-pypi, Flask, $(HOST_PYTHON3_FLASK).$(HOST_PYTHON3_FLASK_SUFFIX))
HOST_PYTHON3_FLASK_SOURCE		:= $(SRCDIR)/$(HOST_PYTHON3_FLASK).$(HOST_PYTHON3_FLASK_SUFFIX)
HOST_PYTHON3_FLASK_DIR		:= $(HOST_BUILDDIR)/$(HOST_PYTHON3_FLASK)
HOST_PYTHON3_FLASK_LICENSE		:= unknown
HOST_PYTHON3_FLASK_LICENSE_FILES	:=

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

HOST_PYTHON3_FLASK_CONF_TOOL	:= python3

# vim: syntax=make
