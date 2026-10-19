ARCHS = arm64 arm64e
TARGET = iphone:clang:latest:15.0
include $(THEOS)/makefiles/common.mk

TOOL_NAME = TweakPowerAnalyzer
TweakPowerAnalyzer_FILES = main.m
TweakPowerAnalyzer_FRAMEWORKS = Foundation

include $(THEOS_MAKE_PATH)/tool.mk
