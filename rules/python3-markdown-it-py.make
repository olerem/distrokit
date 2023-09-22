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
PACKAGES-$(PTXCONF_PYTHON3_MARKDOWN_IT_PY) += python3-markdown-it-py

#
# Paths and names
#
PYTHON3_MARKDOWN_IT_PY_VERSION	:= 3.0.0
PYTHON3_MARKDOWN_IT_PY_MD5		:= a00d59ed2704f6590fdde0e9bad04c7c
PYTHON3_MARKDOWN_IT_PY		:= markdown-it-py-$(PYTHON3_MARKDOWN_IT_PY_VERSION)
PYTHON3_MARKDOWN_IT_PY_SUFFIX	:= tar.gz
PYTHON3_MARKDOWN_IT_PY_URL		:= $(call ptx/mirror-pypi, markdown-it-py, $(PYTHON3_MARKDOWN_IT_PY).$(PYTHON3_MARKDOWN_IT_PY_SUFFIX))
PYTHON3_MARKDOWN_IT_PY_SOURCE	:= $(SRCDIR)/$(PYTHON3_MARKDOWN_IT_PY).$(PYTHON3_MARKDOWN_IT_PY_SUFFIX)
PYTHON3_MARKDOWN_IT_PY_DIR		:= $(BUILDDIR)/$(PYTHON3_MARKDOWN_IT_PY)
PYTHON3_MARKDOWN_IT_PY_LICENSE	:= unknown
PYTHON3_MARKDOWN_IT_PY_LICENSE_FILES	:=

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

PYTHON3_MARKDOWN_IT_PY_CONF_TOOL	:= python3

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-markdown-it-py.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-markdown-it-py)
	@$(call install_fixup, python3-markdown-it-py,PRIORITY,optional)
	@$(call install_fixup, python3-markdown-it-py,SECTION,base)
	@$(call install_fixup, python3-markdown-it-py,AUTHOR,"Oleksij Rempel <Oleksij Rempel <o.rempel@pengutronix.de>>")
	@$(call install_fixup, python3-markdown-it-py,DESCRIPTION,missing)

	@$(call install_glob, python3-markdown-it-py, 0, 0, -, \
		$(PYTHON3_SITEPACKAGES),, *.py)

	@$(call install_finish, python3-markdown-it-py)

	@$(call touch)

# vim: syntax=make
