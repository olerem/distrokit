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
PACKAGES-$(PTXCONF_PYTHON3_ZIPSTREAM_NG) += python3-zipstream-ng

#
# Paths and names
#
PYTHON3_ZIPSTREAM_NG_VERSION	:= 1.6.0
PYTHON3_ZIPSTREAM_NG_MD5		:= 2471b33fc2f46682bc9d5b197b98350b
PYTHON3_ZIPSTREAM_NG		:= zipstream-ng-$(PYTHON3_ZIPSTREAM_NG_VERSION)
PYTHON3_ZIPSTREAM_NG_SUFFIX	:= tar.gz
PYTHON3_ZIPSTREAM_NG_URL		:= $(call ptx/mirror-pypi, zipstream-ng, $(PYTHON3_ZIPSTREAM_NG).$(PYTHON3_ZIPSTREAM_NG_SUFFIX))
PYTHON3_ZIPSTREAM_NG_SOURCE	:= $(SRCDIR)/$(PYTHON3_ZIPSTREAM_NG).$(PYTHON3_ZIPSTREAM_NG_SUFFIX)
PYTHON3_ZIPSTREAM_NG_DIR		:= $(BUILDDIR)/$(PYTHON3_ZIPSTREAM_NG)
PYTHON3_ZIPSTREAM_NG_LICENSE	:= unknown
PYTHON3_ZIPSTREAM_NG_LICENSE_FILES	:=

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

PYTHON3_ZIPSTREAM_NG_CONF_TOOL	:= python3

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-zipstream-ng.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-zipstream-ng)
	@$(call install_fixup, python3-zipstream-ng,PRIORITY,optional)
	@$(call install_fixup, python3-zipstream-ng,SECTION,base)
	@$(call install_fixup, python3-zipstream-ng,AUTHOR,"Oleksij Rempel <o.rempel@pengutronix.de>")
	@$(call install_fixup, python3-zipstream-ng,DESCRIPTION,missing)

	@$(call install_glob, python3-zipstream-ng, 0, 0, -, \
		$(PYTHON3_SITEPACKAGES),, *.py)

	@$(call install_finish, python3-zipstream-ng)

	@$(call touch)

# vim: syntax=make
