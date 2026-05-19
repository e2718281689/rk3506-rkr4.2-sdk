################################################################################
#
# rtl8723du
#
################################################################################

RTL8723DU_VERSION = v5.13.4
RTL8723DU_SITE = $(call github,lwfinger,rtl8723du,$(RTL8723DU_VERSION))
RTL8723DU_LICENSE = GPL-2.0

RTL8723DU_MODULE = /tmp/opencode/rtl8723du-wifi/8723du.ko

define RTL8723DU_INSTALL_TARGET_CMDS
	rm -rf $(TARGET_DIR)/lib/modules/*/kernel/drivers/net/wireless/realtek/rtl8733bu \
		$(TARGET_DIR)/usr/lib/modules/*/kernel/drivers/net/wireless/realtek/rtl8733bu
	$(INSTALL) -D -m 0644 $(RTL8723DU_MODULE) \
		$(TARGET_DIR)/usr/lib/modules/rtl8723du/8723du.ko
	$(INSTALL) -D -m 0755 $(RTL8723DU_PKGDIR)/S04rtl8723du \
		$(TARGET_DIR)/etc/init.d/S04rtl8723du
endef

$(eval $(generic-package))
