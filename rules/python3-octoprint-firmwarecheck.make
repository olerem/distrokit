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
PACKAGES-$(PTXCONF_PYTHON3_OCTOPRINT_FIRMWARECHECK) += python3-octoprint-firmwarecheck

#
# Paths and names
#
PYTHON3_OCTOPRINT_FIRMWARECHECK_VERSION       := 2021.10.11
PYTHON3_OCTOPRINT_FIRMWARECHECK_MD5           := 4e881f30c220e63b9d3d37cb95ccdd2e
PYTHON3_OCTOPRINT_FIRMWARECHECK               := OctoPrint-FirmwareCheck-${PYTHON3_OCTOPRINT_FIRMWARECHECK_VERSION}
PYTHON3_OCTOPRINT_FIRMWARECHECK_SUFFIX        := tar.gz
PYTHON3_OCTOPRINT_FIRMWARECHECK_URL           := $(call ptx/mirror-pypi, OctoPrint-FirmwareCheck, ${PYTHON3_OCTOPRINT_FIRMWARECHECK}.${PYTHON3_OCTOPRINT_FIRMWARECHECK_SUFFIX})
PYTHON3_OCTOPRINT_FIRMWARECHECK_SOURCE        := $(SRCDIR)/${PYTHON3_OCTOPRINT_FIRMWARECHECK}.${PYTHON3_OCTOPRINT_FIRMWARECHECK_SUFFIX}
PYTHON3_OCTOPRINT_FIRMWARECHECK_DIR           := $(BUILDDIR)/${PYTHON3_OCTOPRINT_FIRMWARECHECK}
PYTHON3_OCTOPRINT_FIRMWARECHECK_LICENSE       := unknown

#
# Prepare
#
PYTHON3_OCTOPRINT_FIRMWARECHECK_CONF_TOOL := python3

#
# Target-Install
#
$(STATEDIR)/python3-octoprint-firmwarecheck.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-octoprint-firmwarecheck)
	@$(call install_fixup, python3-octoprint-firmwarecheck,PRIORITY,optional)
	@$(call install_fixup, python3-octoprint-firmwarecheck,SECTION,base)
	@$(call install_fixup, python3-octoprint-firmwarecheck,AUTHOR,"Oleksij Rempel <o.rempel@pengutronix.de>")
	@$(call install_fixup, python3-octoprint-firmwarecheck,DESCRIPTION,missing)

	@$(call install_glob, python3-octoprint-firmwarecheck, 0, 0, -, \
		$(PYTHON3_SITEPACKAGES),, *.py)

	@$(call install_finish, python3-octoprint-firmwarecheck)

	@$(call touch)

# vim: syntax=make
