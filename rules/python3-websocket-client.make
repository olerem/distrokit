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
PACKAGES-$(PTXCONF_PYTHON3_WEBSOCKET_CLIENT) += python3-websocket-client

#
# Paths and names
#
PYTHON3_WEBSOCKET_CLIENT_VERSION	:= 1.6.1
PYTHON3_WEBSOCKET_CLIENT_MD5		:= 86bc69b61947943627afc1b351c0b5db
PYTHON3_WEBSOCKET_CLIENT		:= websocket-client-$(PYTHON3_WEBSOCKET_CLIENT_VERSION)
PYTHON3_WEBSOCKET_CLIENT_SUFFIX	:= tar.gz
PYTHON3_WEBSOCKET_CLIENT_URL		:= $(call ptx/mirror-pypi, websocket-client, $(PYTHON3_WEBSOCKET_CLIENT).$(PYTHON3_WEBSOCKET_CLIENT_SUFFIX))
PYTHON3_WEBSOCKET_CLIENT_SOURCE	:= $(SRCDIR)/$(PYTHON3_WEBSOCKET_CLIENT).$(PYTHON3_WEBSOCKET_CLIENT_SUFFIX)
PYTHON3_WEBSOCKET_CLIENT_DIR		:= $(BUILDDIR)/$(PYTHON3_WEBSOCKET_CLIENT)
PYTHON3_WEBSOCKET_CLIENT_LICENSE	:= unknown
PYTHON3_WEBSOCKET_CLIENT_LICENSE_FILES	:=

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

PYTHON3_WEBSOCKET_CLIENT_CONF_TOOL	:= python3

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-websocket-client.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-websocket-client)
	@$(call install_fixup, python3-websocket-client,PRIORITY,optional)
	@$(call install_fixup, python3-websocket-client,SECTION,base)
	@$(call install_fixup, python3-websocket-client,AUTHOR,"Oleksij Rempel <o.rempel@pengutronix.de>")
	@$(call install_fixup, python3-websocket-client,DESCRIPTION,missing)

	@$(call install_glob, python3-websocket-client, 0, 0, -, \
		$(PYTHON3_SITEPACKAGES),, *.py)

	@$(call install_finish, python3-websocket-client)

	@$(call touch)

# vim: syntax=make
