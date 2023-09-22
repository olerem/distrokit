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
PACKAGES-$(PTXCONF_PYTHON3_CLASS_DOC) += python3-class-doc

#
# Paths and names
#
PYTHON3_CLASS_DOC_VERSION	:= 0.2.6
PYTHON3_CLASS_DOC_MD5		:= e624e059fd5d2b6f6e5a6c479f1f9208
PYTHON3_CLASS_DOC		:= class-doc-$(PYTHON3_CLASS_DOC_VERSION)
PYTHON3_CLASS_DOC_SUFFIX	:= tar.gz
PYTHON3_CLASS_DOC_URL		:= $(call ptx/mirror-pypi, class-doc, $(PYTHON3_CLASS_DOC).$(PYTHON3_CLASS_DOC_SUFFIX))
PYTHON3_CLASS_DOC_SOURCE	:= $(SRCDIR)/$(PYTHON3_CLASS_DOC).$(PYTHON3_CLASS_DOC_SUFFIX)
PYTHON3_CLASS_DOC_DIR		:= $(BUILDDIR)/$(PYTHON3_CLASS_DOC)
PYTHON3_CLASS_DOC_LICENSE	:= unknown
PYTHON3_CLASS_DOC_LICENSE_FILES	:=

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

PYTHON3_CLASS_DOC_CONF_TOOL	:= python3

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-class-doc.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-class-doc)
	@$(call install_fixup, python3-class-doc,PRIORITY,optional)
	@$(call install_fixup, python3-class-doc,SECTION,base)
	@$(call install_fixup, python3-class-doc,AUTHOR,"Oleksij Rempel <Oleksij Rempel <o.rempel@pengutronix.de>>")
	@$(call install_fixup, python3-class-doc,DESCRIPTION,missing)

	@$(call install_glob, python3-class-doc, 0, 0, -, \
		$(PYTHON3_SITEPACKAGES),, *.py)

	@$(call install_finish, python3-class-doc)

	@$(call touch)

# vim: syntax=make
