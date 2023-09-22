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
PACKAGES-$(PTXCONF_PYTHON3_NETADDR) += python3-netaddr

#
# Paths and names
#
PYTHON3_NETADDR_VERSION       := 0.8.0
PYTHON3_NETADDR_MD5           := 34cad578473b66ad77bc3b2a7613ed4a
PYTHON3_NETADDR               := netaddr-${PYTHON3_NETADDR_VERSION}
PYTHON3_NETADDR_SUFFIX        := tar.gz
PYTHON3_NETADDR_URL           := $(call ptx/mirror-pypi, netaddr, ${PYTHON3_NETADDR}.${PYTHON3_NETADDR_SUFFIX})
PYTHON3_NETADDR_SOURCE        := $(SRCDIR)/${PYTHON3_NETADDR}.${PYTHON3_NETADDR_SUFFIX}
PYTHON3_NETADDR_DIR           := $(BUILDDIR)/${PYTHON3_NETADDR}
PYTHON3_NETADDR_LICENSE       := unknown

#
# Prepare
#
PYTHON3_NETADDR_CONF_TOOL := python3

#
# Target-Install
#
$(STATEDIR)/python3-netaddr.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-netaddr)
	@$(call install_fixup, python3-netaddr,PRIORITY,optional)
	@$(call install_fixup, python3-netaddr,SECTION,base)
	@$(call install_fixup, python3-netaddr,AUTHOR,"Oleksij Rempel <o.rempel@pengutronix.de>")
	@$(call install_fixup, python3-netaddr,DESCRIPTION,missing)

	@$(call install_glob, python3-netaddr, 0, 0, -, \
		$(PYTHON3_SITEPACKAGES),, *.py)

	@$(call install_finish, python3-netaddr)

	@$(call touch)

# vim: syntax=make
