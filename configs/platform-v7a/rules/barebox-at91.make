# -*-makefile-*-
#
# Copyright (C) 2017 by Sascha Hauer <s.hauer@pengutronix.de>
#
# For further information about the PTXdist project and license conditions
# see the README file.
#

#
# We provide this package
#
PACKAGES-$(PTXCONF_BAREBOX_AT91) += barebox-at91

#
# Paths and names
#
BAREBOX_AT91_VERSION		:= $(call ptx/config-version, PTXCONF_BAREBOX_COMMON)
BAREBOX_AT91_MD5		:= $(call ptx/config-md5, PTXCONF_BAREBOX_COMMON)
BAREBOX_AT91			:= barebox-$(BAREBOX_AT91_VERSION)
BAREBOX_AT91_SUFFIX		:= tar.bz2
BAREBOX_AT91_DIR		:= $(BUILDDIR)/barebox-at91-$(BAREBOX_AT91_VERSION)
BAREBOX_AT91_CONFIG		:= $(call ptx/in-platformconfigdir, barebox-at91.config)
BAREBOX_AT91_REF_CONFIG	:= $(call ptx/in-platformconfigdir, barebox.config)
BAREBOX_AT91_LICENSE		:= GPL-2.0
BAREBOX_AT91_URL		:= $(call barebox-url, BAREBOX_AT91)
BAREBOX_AT91_SOURCE		:= $(SRCDIR)/$(BAREBOX_AT91).$(BAREBOX_AT91_SUFFIX)

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

BAREBOX_AT91_WRAPPER_BLACKLIST := \
	TARGET_HARDEN_RELRO \
	TARGET_HARDEN_BINDNOW \
	TARGET_HARDEN_PIE \
	TARGET_DEBUG \
	TARGET_BUILD_ID

BAREBOX_AT91_CONF_ENV := KCONFIG_NOTIMESTAMP=1
BAREBOX_AT91_CONF_OPT := \
	BUILDSYSTEM_VERSION=$(PTXDIST_VCS_VERSION) \
	$(call barebox-opts, BAREBOX_AT91)

BAREBOX_AT91_MAKE_ENV := $(BAREBOX_AT91_CONF_ENV)
BAREBOX_AT91_MAKE_OPT := $(BAREBOX_AT91_CONF_OPT)

BAREBOX_AT91_IMAGES := \
        images/barebox-sama5d27-som1-ek.img \
        images/barebox-sama5d27-som1-ek-xload-mmc.img \
        images/barebox-groboards-sama5d27-giantboard.img \
        images/barebox-groboards-sama5d27-giantboard-xload-mmc.img

BAREBOX_AT91_IMAGES := $(addprefix $(BAREBOX_AT91_DIR)/,$(BAREBOX_AT91_IMAGES))

ifdef PTXCONF_BAREBOX_AT91
$(BAREBOX_AT91_CONFIG):
	@echo
	@echo "****************************************************************************"
	@echo " Please generate a bareboxconfig with 'ptxdist menuconfig barebox-at91'"
	@echo "****************************************************************************"
	@echo
	@echo
	@exit 1
endif

$(STATEDIR)/barebox-at91.prepare: $(BAREBOX_AT91_CONFIG)
	@$(call targetinfo)
	@rm -f "$(BAREBOX_AT91_DIR)/.ptxdist-defaultenv"
	@ln -s "$(call ptx/in-platformconfigdir, barebox-at91-defaultenv)" \
		"$(BAREBOX_AT91_DIR)/.ptxdist-defaultenv"
	@$(call world/prepare, BAREBOX_AT91)
	@$(call touch)

# ----------------------------------------------------------------------------
# Install
# ----------------------------------------------------------------------------

$(STATEDIR)/barebox-at91.install:
	@$(call targetinfo)
	@$(call touch)

# ----------------------------------------------------------------------------
# Targetinstall
# ----------------------------------------------------------------------------

$(STATEDIR)/barebox-at91.targetinstall:
	@$(call targetinfo)
	@$(foreach image, $(BAREBOX_AT91_IMAGES), \
		install -m 644 \
			$(image) $(IMAGEDIR)/$(notdir $(image));)
	@$(call touch)

# ----------------------------------------------------------------------------
# Clean
# ----------------------------------------------------------------------------

$(STATEDIR)/barebox-at91.clean:
	@$(call targetinfo)
	@$(call clean_pkg, BAREBOX_AT91)
	@$(foreach image, $(BAREBOX_AT91_IMAGES), \
		rm -fv $(IMAGEDIR)/$(notdir $(image))-at91;)

# ----------------------------------------------------------------------------
# oldconfig / menuconfig
# ----------------------------------------------------------------------------

barebox-at91_oldconfig barebox-at91_menuconfig barebox-at91_nconfig: $(STATEDIR)/barebox-at91.extract
	@$(call world/kconfig, BAREBOX_AT91, $(subst barebox-at91_,,$@))

# vim: syntax=make
