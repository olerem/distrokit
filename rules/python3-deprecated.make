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
PACKAGES-$(PTXCONF_PYTHON3_DEPRECATED) += python3-deprecated

#
# Paths and names
#
PYTHON3_DEPRECATED_VERSION       := 1.2.14
PYTHON3_DEPRECATED_MD5           := 57e0ded86d04f22c65033dea230ad035
PYTHON3_DEPRECATED               := Deprecated-${PYTHON3_DEPRECATED_VERSION}
PYTHON3_DEPRECATED_SUFFIX        := tar.gz
PYTHON3_DEPRECATED_URL           := $(call ptx/mirror-pypi, Deprecated, ${PYTHON3_DEPRECATED}.${PYTHON3_DEPRECATED_SUFFIX})
PYTHON3_DEPRECATED_SOURCE        := $(SRCDIR)/${PYTHON3_DEPRECATED}.${PYTHON3_DEPRECATED_SUFFIX}
PYTHON3_DEPRECATED_DIR           := $(BUILDDIR)/${PYTHON3_DEPRECATED}
PYTHON3_DEPRECATED_LICENSE       := unknown

#
# Prepare
#
PYTHON3_DEPRECATED_CONF_TOOL := python3

#
# Target-Install
#
$(STATEDIR)/python3-deprecated.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-deprecated)
	@$(call install_fixup, python3-deprecated,PRIORITY,optional)
	@$(call install_fixup, python3-deprecated,SECTION,base)
	@$(call install_fixup, python3-deprecated,AUTHOR,"Oleksij Rempel <o.rempel@pengutronix.de>")
	@$(call install_fixup, python3-deprecated,DESCRIPTION,missing)

	@$(call install_glob, python3-deprecated, 0, 0, -, \
		$(PYTHON3_SITEPACKAGES),, *.py)

	@$(call install_finish, python3-deprecated)

	@$(call touch)

# vim: syntax=make
