# -*-makefile-*-
#
# Copyright (C) 2023 by Michael Olbrich <m.olbrich@pengutronix.de>
#
# For further information about the PTXdist project and license conditions
# see the README file.
#

#
# We provide this package
#
PACKAGES-$(PTXCONF_HOST_PYTHON3_TOMLI) += host-python3-tomli

#
# Paths and names
#
HOST_PYTHON3_TOMLI_VERSION		:= 1.2.3
HOST_PYTHON3_TOMLI_MD5			:= 807cc80e6a2697375f431b757994b7c5
HOST_PYTHON3_TOMLI			:= tomli-$(HOST_PYTHON3_TOMLI_VERSION)
HOST_PYTHON3_TOMLI_SUFFIX		:= tar.gz
HOST_PYTHON3_TOMLI_URL			:= $(call ptx/mirror-pypi, tomli, $(HOST_PYTHON3_TOMLI).$(HOST_PYTHON3_TOMLI_SUFFIX))
HOST_PYTHON3_TOMLI_SOURCE		:= $(SRCDIR)/$(HOST_PYTHON3_TOMLI).$(HOST_PYTHON3_TOMLI_SUFFIX)
HOST_PYTHON3_TOMLI_DIR			:= $(HOST_BUILDDIR)/$(HOST_PYTHON3_TOMLI)
HOST_PYTHON3_TOMLI_LICENSE		:= MIT
HOST_PYTHON3_TOMLI_LICENSE_FILES	:= \
	file://LICENSE;md5=aaaaf0879d17df0110d1aa8c8c9f46f5

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

HOST_PYTHON3_TOMLI_CONF_TOOL	:= python3

# vim: syntax=make
