# -*-makefile-*-
#
# Copyright (C) 2023 by Oleksij Rempel <Oleksij Rempel <o.rempel@pengutronix.de>
#
# For further information about the PTXdist project and license conditions
# see the README file.
#

#
# We provide this package
#
PACKAGES-$(PTXCONF_PYTHON3_EMOJI) += python3-emoji

#
# Paths and names
#
PYTHON3_EMOJI_VERSION	:= 2.6.0
PYTHON3_EMOJI_MD5		:= dc70520ffccc70c94f63294e816da757
PYTHON3_EMOJI		:= emoji-$(PYTHON3_EMOJI_VERSION)
PYTHON3_EMOJI_SUFFIX	:= tar.gz
PYTHON3_EMOJI_URL		:= $(call ptx/mirror-pypi, emoji, $(PYTHON3_EMOJI).$(PYTHON3_EMOJI_SUFFIX))
PYTHON3_EMOJI_SOURCE	:= $(SRCDIR)/$(PYTHON3_EMOJI).$(PYTHON3_EMOJI_SUFFIX)
PYTHON3_EMOJI_DIR		:= $(BUILDDIR)/$(PYTHON3_EMOJI)
PYTHON3_EMOJI_LICENSE	:= unknown
PYTHON3_EMOJI_LICENSE_FILES	:=

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

PYTHON3_EMOJI_CONF_TOOL	:= python3

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-emoji.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-emoji)
	@$(call install_fixup, python3-emoji,PRIORITY,optional)
	@$(call install_fixup, python3-emoji,SECTION,base)
	@$(call install_fixup, python3-emoji,AUTHOR,"Oleksij Rempel <Oleksij Rempel <o.rempel@pengutronix.de>")
	@$(call install_fixup, python3-emoji,DESCRIPTION,missing)

	@$(call install_glob, python3-emoji, 0, 0, -, \
		$(PYTHON3_SITEPACKAGES),, *.py)

	@$(call install_finish, python3-emoji)

	@$(call touch)

# vim: syntax=make
