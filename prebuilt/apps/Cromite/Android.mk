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
#

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_OVERRIDES_PACKAGES := Jelly ViaBrowser Chrome Chrome-Stub

LOCAL_MODULE := Cromite
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := APPS
LOCAL_PRODUCT_MODULE := true
LOCAL_MODULE_SUFFIX := .apk
LOCAL_CERTIFICATE := PRESIGNED

LOCAL_SRC_FILES := arm64_ChromePublic.apk
LOCAL_REPLACE_PREBUILT_APK_INSTALLED := $(LOCAL_PATH)/arm64_ChromePublic.apk

LOCAL_MODULE_TARGET_ARCH := arm64
LOCAL_PREBUILT_JNI_LIBS := \
    lib/arm64-v8a/libchrome.so \
    lib/arm64-v8a/libchrome_crashpad_handler.so

include $(BUILD_PREBUILT)
