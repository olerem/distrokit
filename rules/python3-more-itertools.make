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
PACKAGES-$(PTXCONF_PYTHON3_MORE_ITERTOOLS) += python3-more-itertools

#
# Paths and names
#
PYTHON3_MORE_ITERTOOLS_VERSION	:= 5.0.0
PYTHON3_MORE_ITERTOOLS_MD5		:= f2ea58aa336ce6c13b7b225b3bbe305d
PYTHON3_MORE_ITERTOOLS		:= more-itertools-$(PYTHON3_MORE_ITERTOOLS_VERSION)
PYTHON3_MORE_ITERTOOLS_SUFFIX	:= tar.gz
PYTHON3_MORE_ITERTOOLS_URL		:= $(call ptx/mirror-pypi, more-itertools, $(PYTHON3_MORE_ITERTOOLS).$(PYTHON3_MORE_ITERTOOLS_SUFFIX))
PYTHON3_MORE_ITERTOOLS_SOURCE	:= $(SRCDIR)/$(PYTHON3_MORE_ITERTOOLS).$(PYTHON3_MORE_ITERTOOLS_SUFFIX)
PYTHON3_MORE_ITERTOOLS_DIR		:= $(BUILDDIR)/$(PYTHON3_MORE_ITERTOOLS)
PYTHON3_MORE_ITERTOOLS_LICENSE	:= unknown
PYTHON3_MORE_ITERTOOLS_LICENSE_FILES	:=

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

PYTHON3_MORE_ITERTOOLS_CONF_TOOL	:= python3

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-more-itertools.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-more-itertools)
	@$(call install_fixup, python3-more-itertools,PRIORITY,optional)
	@$(call install_fixup, python3-more-itertools,SECTION,base)
	@$(call install_fixup, python3-more-itertools,AUTHOR,"Oleksij Rempel <Oleksij Rempel <o.rempel@pengutronix.de>>")
	@$(call install_fixup, python3-more-itertools,DESCRIPTION,missing)

	@$(call install_glob, python3-more-itertools, 0, 0, -, \
		$(PYTHON3_SITEPACKAGES),, *.py)

	@$(call install_finish, python3-more-itertools)

	@$(call touch)

# vim: syntax=make
