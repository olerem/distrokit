# -*-makefile-*-
#
# Copyright (C) 2021 by Oleksij Rempel <o.rempel@pengutronix.de>
#
# For further information about the PTXdist project and license conditions
# see the README file.
#

#
# We provide this package
#
PACKAGES-$(PTXCONF_HOST_PYTHON3_WHEEL) += host-python3-wheel

#
# Paths and names
#
HOST_PYTHON3_WHEEL_VERSION	:= 0.37.0
HOST_PYTHON3_WHEEL_MD5		:= 79f55b898e6f274f5586bbde39f6fe8e
HOST_PYTHON3_WHEEL		:= wheel-$(HOST_PYTHON3_WHEEL_VERSION)
HOST_PYTHON3_WHEEL_SUFFIX	:= tar.gz
HOST_PYTHON3_WHEEL_URL		:= $(call ptx/mirror-pypi, wheel, $(HOST_PYTHON3_WHEEL).$(HOST_PYTHON3_WHEEL_SUFFIX))
HOST_PYTHON3_WHEEL_SOURCE	:= $(SRCDIR)/$(HOST_PYTHON3_WHEEL).$(HOST_PYTHON3_WHEEL_SUFFIX)
HOST_PYTHON3_WHEEL_DIR		:= $(HOST_BUILDDIR)/$(HOST_PYTHON3_WHEEL)
HOST_PYTHON3_WHEEL_LICENSE	:= unknown
HOST_PYTHON3_WHEEL_LICENSE_FILES	:=

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

HOST_PYTHON3_WHEEL_CONF_TOOL	:= python3

# vim: syntax=make
