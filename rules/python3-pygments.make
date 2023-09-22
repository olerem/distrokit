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
PACKAGES-$(PTXCONF_PYTHON3_PYGMENTS) += python3-pygments

#
# Paths and names
#
PYTHON3_PYGMENTS_VERSION	:= 2.15.1
PYTHON3_PYGMENTS_MD5		:= e40631bb812bbd15954027c23b23013a
PYTHON3_PYGMENTS		:= Pygments-$(PYTHON3_PYGMENTS_VERSION)
PYTHON3_PYGMENTS_SUFFIX	:= tar.gz
PYTHON3_PYGMENTS_URL		:= $(call ptx/mirror-pypi, Pygments, $(PYTHON3_PYGMENTS).$(PYTHON3_PYGMENTS_SUFFIX))
PYTHON3_PYGMENTS_SOURCE	:= $(SRCDIR)/$(PYTHON3_PYGMENTS).$(PYTHON3_PYGMENTS_SUFFIX)
PYTHON3_PYGMENTS_DIR		:= $(BUILDDIR)/$(PYTHON3_PYGMENTS)
PYTHON3_PYGMENTS_LICENSE	:= unknown
PYTHON3_PYGMENTS_LICENSE_FILES	:=

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

PYTHON3_PYGMENTS_CONF_TOOL	:= python3

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-pygments.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-pygments)
	@$(call install_fixup, python3-pygments,PRIORITY,optional)
	@$(call install_fixup, python3-pygments,SECTION,base)
	@$(call install_fixup, python3-pygments,AUTHOR,"Oleksij Rempel <Oleksij Rempel <o.rempel@pengutronix.de>>")
	@$(call install_fixup, python3-pygments,DESCRIPTION,missing)

	@$(call install_glob, python3-pygments, 0, 0, -, \
		$(PYTHON3_SITEPACKAGES),, *.py)

	@$(call install_finish, python3-pygments)

	@$(call touch)

# vim: syntax=make
