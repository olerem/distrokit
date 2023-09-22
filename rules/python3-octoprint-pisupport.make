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
PACKAGES-$(PTXCONF_PYTHON3_OCTOPRINT_PISUPPORT) += python3-octoprint-pisupport

#
# Paths and names
#
PYTHON3_OCTOPRINT_PISUPPORT_VERSION       := 2023.5.24
PYTHON3_OCTOPRINT_PISUPPORT_MD5           := 398f6ebbdabcb6191391ce654357837d
PYTHON3_OCTOPRINT_PISUPPORT               := OctoPrint-PiSupport-${PYTHON3_OCTOPRINT_PISUPPORT_VERSION}
PYTHON3_OCTOPRINT_PISUPPORT_SUFFIX        := tar.gz
PYTHON3_OCTOPRINT_PISUPPORT_URL           := $(call ptx/mirror-pypi, OctoPrint-PiSupport, ${PYTHON3_OCTOPRINT_PISUPPORT}.${PYTHON3_OCTOPRINT_PISUPPORT_SUFFIX})
PYTHON3_OCTOPRINT_PISUPPORT_SOURCE        := $(SRCDIR)/${PYTHON3_OCTOPRINT_PISUPPORT}.${PYTHON3_OCTOPRINT_PISUPPORT_SUFFIX}
PYTHON3_OCTOPRINT_PISUPPORT_DIR           := $(BUILDDIR)/${PYTHON3_OCTOPRINT_PISUPPORT}
PYTHON3_OCTOPRINT_PISUPPORT_LICENSE       := unknown

#
# Prepare
#
PYTHON3_OCTOPRINT_PISUPPORT_CONF_TOOL := python3

#
# Target-Install
#
$(STATEDIR)/python3-octoprint-pisupport.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-octoprint-pisupport)
	@$(call install_fixup, python3-octoprint-pisupport,PRIORITY,optional)
	@$(call install_fixup, python3-octoprint-pisupport,SECTION,base)
	@$(call install_fixup, python3-octoprint-pisupport,AUTHOR,"Oleksij Rempel <o.rempel@pengutronix.de>")
	@$(call install_fixup, python3-octoprint-pisupport,DESCRIPTION,missing)

	@$(call install_glob, python3-octoprint-pisupport, 0, 0, -, \
		$(PYTHON3_SITEPACKAGES),, *.py)

	@$(call install_finish, python3-octoprint-pisupport)

	@$(call touch)

# vim: syntax=make
