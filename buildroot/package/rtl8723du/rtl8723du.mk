################################################################################
#
# rtl8723du
#
################################################################################

RTL8723DU_VERSION = v5.13.4
RTL8723DU_SITE = $(call github,lwfinger,rtl8723du,$(RTL8723DU_VERSION))
RTL8723DU_LICENSE = GPL-2.0

RTL8723DU_KERNEL_DIR = $(TOPDIR)/../kernel
RTL8723DU_KERNEL_CROSS = $(TOPDIR)/../prebuilts/gcc/linux-x86/arm/gcc-arm-10.3-2021.07-x86_64-arm-none-linux-gnueabihf/bin/arm-none-linux-gnueabihf-

define RTL8723DU_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) -C $(RTL8723DU_KERNEL_DIR) \
		ARCH=arm \
		CROSS_COMPILE=$(RTL8723DU_KERNEL_CROSS) \
		M=$(@D) \
		KSRC=$(RTL8723DU_KERNEL_DIR) \
		CONFIG_RTL8723DU=m \
		modules
endef

define RTL8723DU_INSTALL_TARGET_CMDS
	rm -rf $(TARGET_DIR)/lib/modules/*/kernel/drivers/net/wireless/realtek/rtl8733bu \
		$(TARGET_DIR)/usr/lib/modules/*/kernel/drivers/net/wireless/realtek/rtl8733bu
	$(INSTALL) -D -m 0644 $(@D)/8723du.ko \
		$(TARGET_DIR)/usr/lib/modules/rtl8723du/8723du.ko
	$(INSTALL) -D -m 0755 $(RTL8723DU_PKGDIR)/S04rtl8723du \
		$(TARGET_DIR)/etc/init.d/S04rtl8723du
endef

$(eval $(generic-package))
