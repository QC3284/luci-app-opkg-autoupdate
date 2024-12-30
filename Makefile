PO = opkg_autoupdate

PV = 1.0

PKG_NAME:=luci-app-$(PO)

LUCI_TITLE:=Luci - OPKG Auto Update
LUCI_DEPENDS:=+luci

LUCI_PKGARCH:=all

include $(TOPDIR)/rules.mk

include $(INCLUDE_DIR)/package.mk

define Package/$(PKG_NAME)
  SECTION:=luci
  CATEGORY:=LuCI
  SUBMENU:=3. Applications
  TITLE:=$(LUCI_TITLE)
  DEPENDS:=$(LUCI_DEPENDS)
  PKGARCH:=$(LUCI_PKGARCH)
endef

define Package/$(PKG_NAME)/description
  This package contains a simple Luci plugin to refresh the package cache.
endef

define Build/Prepare
	$(CP) ./src/* $(PKG_BUILD_DIR)/
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/$(PKG_NAME)/install
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/controller
	$(INSTALL_DATA) ./files/controller/luci_app_opkg_autoupdate.lua $(1)/usr/lib/lua/luci/controller/luci_app_opkg_autoupdate.lua
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/view/luci_app_opkg_autoupdate
	$(INSTALL_DATA) ./files/view/luci_app_opkg_autoupdate/autoupdate.htm $(1)/usr/lib/lua/luci/view/luci_app_opkg_autoupdate/autoupdate.htm
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_DATA) ./files/luci.opkg_autoupdate $(1)/etc/config/luci.opkg_autoupdate
endef

$(eval $(call BuildPackage,$(PKG_NAME)))