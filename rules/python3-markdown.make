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
PACKAGES-$(PTXCONF_PYTHON3_MARKDOWN) += python3-markdown

#
# Paths and names
#
PYTHON3_MARKDOWN_VERSION       := 3.4.3
PYTHON3_MARKDOWN_MD5           := 39083df5b9a5e70286fe7c557ef61312
PYTHON3_MARKDOWN               := Markdown-${PYTHON3_MARKDOWN_VERSION}
PYTHON3_MARKDOWN_SUFFIX        := tar.gz
PYTHON3_MARKDOWN_URL           := $(call ptx/mirror-pypi, Markdown, ${PYTHON3_MARKDOWN}.${PYTHON3_MARKDOWN_SUFFIX})
PYTHON3_MARKDOWN_SOURCE        := $(SRCDIR)/${PYTHON3_MARKDOWN}.${PYTHON3_MARKDOWN_SUFFIX}
PYTHON3_MARKDOWN_DIR           := $(BUILDDIR)/${PYTHON3_MARKDOWN}
PYTHON3_MARKDOWN_LICENSE       := unknown

#
# Prepare
#
PYTHON3_MARKDOWN_CONF_TOOL := python3

#
# Target-Install
#
$(STATEDIR)/python3-markdown.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-markdown)
	@$(call install_fixup, python3-markdown,PRIORITY,optional)
	@$(call install_fixup, python3-markdown,SECTION,base)
	@$(call install_fixup, python3-markdown,AUTHOR,"Oleksij Rempel <o.rempel@pengutronix.de>")
	@$(call install_fixup, python3-markdown,DESCRIPTION,missing)

	@$(call install_glob, python3-markdown, 0, 0, -, \
		$(PYTHON3_SITEPACKAGES),,)

	@$(call install_finish, python3-markdown)

	@$(call touch)

# vim: syntax=make
