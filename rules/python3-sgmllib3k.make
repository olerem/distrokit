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
PACKAGES-$(PTXCONF_PYTHON3_SGMLLIB3K) += python3-sgmllib3k

#
# Paths and names
#
PYTHON3_SGMLLIB3K_VERSION	:= 1.0.0
PYTHON3_SGMLLIB3K_MD5		:= d70efde06e40797f37e867123aa080ec
PYTHON3_SGMLLIB3K		:= sgmllib3k-$(PYTHON3_SGMLLIB3K_VERSION)
PYTHON3_SGMLLIB3K_SUFFIX	:= tar.gz
PYTHON3_SGMLLIB3K_URL		:= $(call ptx/mirror-pypi, sgmllib3k, $(PYTHON3_SGMLLIB3K).$(PYTHON3_SGMLLIB3K_SUFFIX))
PYTHON3_SGMLLIB3K_SOURCE	:= $(SRCDIR)/$(PYTHON3_SGMLLIB3K).$(PYTHON3_SGMLLIB3K_SUFFIX)
PYTHON3_SGMLLIB3K_DIR		:= $(BUILDDIR)/$(PYTHON3_SGMLLIB3K)
PYTHON3_SGMLLIB3K_LICENSE	:= unknown
PYTHON3_SGMLLIB3K_LICENSE_FILES	:=

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

PYTHON3_SGMLLIB3K_CONF_TOOL	:= python3

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-sgmllib3k.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-sgmllib3k)
	@$(call install_fixup, python3-sgmllib3k,PRIORITY,optional)
	@$(call install_fixup, python3-sgmllib3k,SECTION,base)
	@$(call install_fixup, python3-sgmllib3k,AUTHOR,"Oleksij Rempel <Oleksij Rempel <o.rempel@pengutronix.de>>")
	@$(call install_fixup, python3-sgmllib3k,DESCRIPTION,missing)

	@$(call install_glob, python3-sgmllib3k, 0, 0, -, \
		$(PYTHON3_SITEPACKAGES),, *.py)

	@$(call install_finish, python3-sgmllib3k)

	@$(call touch)

# vim: syntax=make
