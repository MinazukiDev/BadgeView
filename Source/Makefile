ARCHS = armv7s arm64 arm64e

PACKAGE_VERSION = $(THEOS_PACKAGE_BASE_VERSION)

INSTALL_TARGET_PROCESSES = SpringBoard

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = BadgeView

BadgeView_FILES = Tweak.xm
BadgeView_CFLAGS = -fobjc-arc
BadgeView_LIBRARIES = colorpicker

include $(THEOS_MAKE_PATH)/tweak.mk
SUBPROJECTS += badgeview
include $(THEOS_MAKE_PATH)/aggregate.mk
