################################################################################
#
# rtl8723du-bt
#
################################################################################

RTL8723DU_BT_VERSION = 20250515
RTL8723DU_BT_SOURCE = 20250515_LINUX_BT_DRIVER.tgz
RTL8723DU_BT_SITE = $(TOPDIR)/../external
RTL8723DU_BT_SITE_METHOD = local
RTL8723DU_BT_LICENSE = GPL-2.0, proprietary firmware blobs

define RTL8723DU_BT_INSTALL_TARGET_CMDS
	$(INSTALL) -d $(TARGET_DIR)/usr/lib/firmware/rtl_bt
	tar -xOf $(@D)/20250515_LINUX_BT_DRIVER.tgz \
		20250515_LINUX_BT_DRIVER/rtkbt-firmware/lib/firmware/rtl8723du_fw \
		> $(TARGET_DIR)/usr/lib/firmware/rtl8723du_fw
	tar -xOf $(@D)/20250515_LINUX_BT_DRIVER.tgz \
		20250515_LINUX_BT_DRIVER/rtkbt-firmware/lib/firmware/rtl8723du_config \
		> $(TARGET_DIR)/usr/lib/firmware/rtl8723du_config
	tar -xOf $(@D)/20250515_LINUX_BT_DRIVER.tgz \
		20250515_LINUX_BT_DRIVER/rtkbt-firmware/lib/firmware/rtlbt/rtl8723d_fw \
		> $(TARGET_DIR)/usr/lib/firmware/rtl_bt/rtl8723d_fw.bin
	tar -xOf $(@D)/20250515_LINUX_BT_DRIVER.tgz \
		20250515_LINUX_BT_DRIVER/rtkbt-firmware/lib/firmware/rtlbt/rtl8723d_config \
		> $(TARGET_DIR)/usr/lib/firmware/rtl_bt/rtl8723d_config.bin
	chmod 0644 $(TARGET_DIR)/usr/lib/firmware/rtl8723du_fw \
		$(TARGET_DIR)/usr/lib/firmware/rtl8723du_config \
		$(TARGET_DIR)/usr/lib/firmware/rtl_bt/rtl8723d_fw.bin \
		$(TARGET_DIR)/usr/lib/firmware/rtl_bt/rtl8723d_config.bin
endef

$(eval $(generic-package))
