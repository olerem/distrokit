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
PACKAGES-$(PTXCONF_PYTHON3_COLORLOG) += python3-colorlog

#
# Paths and names
#
PYTHON3_COLORLOG_VERSION	:= 6.7.0
PYTHON3_COLORLOG_MD5		:= 80b79f7824d39d4f3b11c75d1cba094e
PYTHON3_COLORLOG		:= colorlog-$(PYTHON3_COLORLOG_VERSION)
PYTHON3_COLORLOG_SUFFIX	:= tar.gz
PYTHON3_COLORLOG_URL		:= $(call ptx/mirror-pypi, colorlog, $(PYTHON3_COLORLOG).$(PYTHON3_COLORLOG_SUFFIX))
PYTHON3_COLORLOG_SOURCE	:= $(SRCDIR)/$(PYTHON3_COLORLOG).$(PYTHON3_COLORLOG_SUFFIX)
PYTHON3_COLORLOG_DIR		:= $(BUILDDIR)/$(PYTHON3_COLORLOG)
PYTHON3_COLORLOG_LICENSE	:= unknown
PYTHON3_COLORLOG_LICENSE_FILES	:=

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

PYTHON3_COLORLOG_CONF_TOOL	:= python3

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-colorlog.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-colorlog)
	@$(call install_fixup, python3-colorlog,PRIORITY,optional)
	@$(call install_fixup, python3-colorlog,SECTION,base)
	@$(call install_fixup, python3-colorlog,AUTHOR,"Oleksij Rempel <Oleksij Rempel <o.rempel@pengutronix.de>>")
	@$(call install_fixup, python3-colorlog,DESCRIPTION,missing)

	@$(call install_glob, python3-colorlog, 0, 0, -, \
		$(PYTHON3_SITEPACKAGES),, *.py)

	@$(call install_finish, python3-colorlog)

	@$(call touch)

# vim: syntax=make
