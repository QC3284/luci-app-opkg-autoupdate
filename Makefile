# 插件的基础名称
PO = opkg_autoupdate

# 插件的描述
PV = 1.0

# 插件的完整名称，通过将"luci-app-"前缀与PO变量的值拼接而成
PKG_NAME:=luci-app-$(PO)

# 插件的依赖包
LUCI_TITLE:=Luci - OPKG Auto Update
LUCI_DEPENDS:=+luci

# 插件适用于所有架构
LUCI_PKGARCH:=all

include $(TOPDIR)/rules.mk

# 插件的源代码和编译后的文件
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