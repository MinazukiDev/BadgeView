ARCHS = armv7s arm64 arm64e

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = BadgeView
BadgeView_FILES = BVListController.m
BadgeView_INSTALL_PATH = /Library/PreferenceBundles
BadgeView_FRAMEWORKS = UIKit
BadgeView_PRIVATE_FRAMEWORKS = Preferences
BadgeView_LIBRARIES = colorpicker

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/BadgeView.plist$(ECHO_END)
