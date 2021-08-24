ARCHS := armv7  arm64 
TARGET := iphone:clang:latest:8.0

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = 0Shadow
$(TWEAK_NAME)_FILES = Classes/Shadow.m Tweak.x
$(TWEAK_NAME)_EXTRA_FRAMEWORKS = Cephei
$(TWEAK_NAME)_CFLAGS = -fobjc-arc -DShadow="_$(shell git describe --always)"

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
SUBPROJECTS += ShadowPreferences
include $(THEOS_MAKE_PATH)/aggregate.mk
