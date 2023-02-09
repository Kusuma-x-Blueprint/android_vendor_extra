#
# Copyright (C) 2023 Project Lineage Remix Open Source
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

LOCAL_PATH := $(call my-dir)
include $(call all-subdir-makefiles,$(LOCAL_PATH))

# Cromite
PRODUCT_PACKAGES += \
    Cromite \
    CromiteIconAndTranslations

# Face Unlock
TARGET_FACE_UNLOCK_SUPPORTED ?= $(TARGET_SUPPORTS_64_BIT_APPS)

ifeq ($(TARGET_FACE_UNLOCK_SUPPORTED),true)
PRODUCT_PACKAGES += \
    ParanoidSense

PRODUCT_SYSTEM_EXT_PROPERTIES += \
    ro.face.sense_service.enabled=true

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.biometrics.face.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.biometrics.face.xml
endif

# Fonts
PRODUCT_PACKAGES += \
    FontGoogleSansOverlay \
    FontInterOverlay \
    FontNotoSansOverlay

$(call inherit-product,vendor/extra/fonts/fonts.mk)

# Overlays
PRODUCT_PACKAGES += \
    FrameworksOverlayPIHooks

# Remove unwanted pacakges
PRODUCT_PACKAGES += \
    RemovePackages

# Sign with own key
ifneq ($(OWN_KEYS_DIR),)
$(shell ln -sf $(OWN_KEYS_DIR) user-keys)
PRODUCT_DEFAULT_DEV_CERTIFICATE := user-keys/releasekey
PRODUCT_OTA_PUBLIC_KEYS := user-keys/releasekey
endif

# Updater URI and changelog
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    lineage.updater.uri=https://raw.githubusercontent.com/Kusuma-x-Blueprint/OTA/lineage-20.0/$(LINEAGE_BUILD).json
DEVICE_PACKAGE_OVERLAYS += \
    vendor/extra/overlay/changelog/$(LINEAGE_BUILD)
