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
PACKAGES-$(PTXCONF_PYTHON3_FEEDPARSER) += python3-feedparser

#
# Paths and names
#
PYTHON3_FEEDPARSER_VERSION	:= 6.0.10
PYTHON3_FEEDPARSER_MD5		:= 45716da638688577c7b0587a0a839a21
PYTHON3_FEEDPARSER		:= feedparser-$(PYTHON3_FEEDPARSER_VERSION)
PYTHON3_FEEDPARSER_SUFFIX	:= tar.gz
PYTHON3_FEEDPARSER_URL		:= $(call ptx/mirror-pypi, feedparser, $(PYTHON3_FEEDPARSER).$(PYTHON3_FEEDPARSER_SUFFIX))
PYTHON3_FEEDPARSER_SOURCE	:= $(SRCDIR)/$(PYTHON3_FEEDPARSER).$(PYTHON3_FEEDPARSER_SUFFIX)
PYTHON3_FEEDPARSER_DIR		:= $(BUILDDIR)/$(PYTHON3_FEEDPARSER)
PYTHON3_FEEDPARSER_LICENSE	:= unknown
PYTHON3_FEEDPARSER_LICENSE_FILES	:=

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

PYTHON3_FEEDPARSER_CONF_TOOL	:= python3

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-feedparser.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-feedparser)
	@$(call install_fixup, python3-feedparser,PRIORITY,optional)
	@$(call install_fixup, python3-feedparser,SECTION,base)
	@$(call install_fixup, python3-feedparser,AUTHOR,"Oleksij Rempel <Oleksij Rempel <o.rempel@pengutronix.de>>")
	@$(call install_fixup, python3-feedparser,DESCRIPTION,missing)

	@$(call install_glob, python3-feedparser, 0, 0, -, \
		$(PYTHON3_SITEPACKAGES),, *.py)

	@$(call install_finish, python3-feedparser)

	@$(call touch)

# vim: syntax=make
