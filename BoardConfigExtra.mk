# Extra version
TARGET_SYSTEM_PROP += vendor/extra/properties/system.prop

# SEPolicy
ifeq ($(BOARD_USES_QCOM_HARDWARE), true)
ifeq ($(TARGET_USES_PREBUILT_VENDOR_SEPOLICY), true)
SYSTEM_EXT_PRIVATE_SEPOLICY_DIRS += \
    vendor/extra/sepolicy/qcom/dynamic
else
BOARD_VENDOR_SEPOLICY_DIRS += \
    vendor/extra/sepolicy/qcom/dynamic
endif
endif

# Inherit private extra if exists
-include vendor/extra-priv/BoardConfigExtraPriv.mk
