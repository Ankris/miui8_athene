#
## Makefile for athene
#
#
local-zip-file := stockrom.zip
local-out-zip-file := miui8_athene.zip
local-previous-target-dir := 

local-modified-apps :=
local-remove-apps :=
local-modified-jars := org.cyanogenmod.platform

local-miui-removed-apps := 
local-miui-modified-apps := TeleService
local-miui-removed-apps := 
local-miui-modified-apps :=  

local-density := XXHDPI
local-target-bit := 32

include phoneapps.mk

PORT_PRODUCT := athene

local-pre-zip := local-pre-zip-misc
local-after-zip := local-put-to-phone

include $(PORT_BUILD)/porting.mk

local-pre-zip-misc:
	@echo copying files!
	$(hide) cp -rf other/system $(ZIP_DIR)/
	
	@echo goodbye! miui prebuilt binaries!
	#$(hide) rm -rf $(ZIP_DIR)/system/bin/app_process32_vendor
	#$(hide) cp -rf stockrom/system/bin/app_process32 $(ZIP_DIR)/system/bin/app_process32
	
	@echo remove unnecessary files!
	$(hide) rm -rf $(ZIP_DIR)/system/etc/CHANGELOG-CM.txt
	$(hide) rm -rf $(ZIP_DIR)/system/recovery-from-boot.bak
	$(hide) rm -rf $(ZIP_DIR)/system/media/audio/*
	$(hide) rm -rf $(ZIP_DIR)/system/lib64
	
	@echo use only miui sounds!
	$(hide) cp -rf $(PORT_ROOT)/miui/system/media/$(local-density)/audio/* $(ZIP_DIR)/system/media/audio
	$(hide) rm -rf $(ZIP_DIR)/system/media/audio/create_symlink_for_audio-timestamp
