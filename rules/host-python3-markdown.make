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
PACKAGES-$(PTXCONF_HOST_PYTHON3_MARKDOWN) += host-python3-markdown

#
# Paths and names
#
HOST_PYTHON3_MARKDOWN_VERSION	:= 3.1.1
HOST_PYTHON3_MARKDOWN_MD5	:= d84732ecc65b3a1bff693d9d4c24277f
HOST_PYTHON3_MARKDOWN		:= Markdown-$(HOST_PYTHON3_MARKDOWN_VERSION)
HOST_PYTHON3_MARKDOWN_SUFFIX	:= tar.gz
HOST_PYTHON3_MARKDOWN_URL	:= $(call ptx/mirror-pypi, markdown, $(HOST_PYTHON3_MARKDOWN).$(HOST_PYTHON3_MARKDOWN_SUFFIX))
HOST_PYTHON3_MARKDOWN_SOURCE	:= $(SRCDIR)/$(HOST_PYTHON3_MARKDOWN).$(HOST_PYTHON3_MARKDOWN_SUFFIX)
HOST_PYTHON3_MARKDOWN_DIR	:= $(HOST_BUILDDIR)/$(HOST_PYTHON3_MARKDOWN)
HOST_PYTHON3_MARKDOWN_LICENSE	:= unknown
HOST_PYTHON3_MARKDOWN_LICENSE_FILES	:=

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

HOST_PYTHON3_MARKDOWN_CONF_TOOL	:= python3

# vim: syntax=make
