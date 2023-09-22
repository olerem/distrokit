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
PACKAGES-$(PTXCONF_PYTHON3_SENTRY_SDK) += python3-sentry-sdk

#
# Paths and names
#
PYTHON3_SENTRY_SDK_VERSION	:= 1.27.1
PYTHON3_SENTRY_SDK_MD5		:= ae368e60b50befe6a7bdd0841495ee89
PYTHON3_SENTRY_SDK		:= sentry-sdk-$(PYTHON3_SENTRY_SDK_VERSION)
PYTHON3_SENTRY_SDK_SUFFIX	:= tar.gz
PYTHON3_SENTRY_SDK_URL		:= $(call ptx/mirror-pypi, sentry-sdk, $(PYTHON3_SENTRY_SDK).$(PYTHON3_SENTRY_SDK_SUFFIX))
PYTHON3_SENTRY_SDK_SOURCE	:= $(SRCDIR)/$(PYTHON3_SENTRY_SDK).$(PYTHON3_SENTRY_SDK_SUFFIX)
PYTHON3_SENTRY_SDK_DIR		:= $(BUILDDIR)/$(PYTHON3_SENTRY_SDK)
PYTHON3_SENTRY_SDK_LICENSE	:= unknown
PYTHON3_SENTRY_SDK_LICENSE_FILES	:=

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

PYTHON3_SENTRY_SDK_CONF_TOOL	:= python3

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-sentry-sdk.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-sentry-sdk)
	@$(call install_fixup, python3-sentry-sdk,PRIORITY,optional)
	@$(call install_fixup, python3-sentry-sdk,SECTION,base)
	@$(call install_fixup, python3-sentry-sdk,AUTHOR,"Oleksij Rempel <o.rempel@pengutronix.de>")
	@$(call install_fixup, python3-sentry-sdk,DESCRIPTION,missing)

	@$(call install_glob, python3-sentry-sdk, 0, 0, -, \
		$(PYTHON3_SITEPACKAGES),, *.py)

	@$(call install_finish, python3-sentry-sdk)

	@$(call touch)

# vim: syntax=make
