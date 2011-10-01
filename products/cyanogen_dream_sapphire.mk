# Inherit AOSP device configuration for dream_sapphire.
$(call inherit-product, device/htc/dream_sapphire/full_dream_sapphire.mk)

# Inherit some common cyanogenmod stuff.
$(call inherit-product, vendor/cyanogen/products/common_full.mk)

# Include GSM-only stuff
$(call inherit-product, vendor/cyanogen/products/gsm.mk)

#
# Setup device specific product configuration.
#
PRODUCT_NAME := cyanogen_dream_sapphire
PRODUCT_BRAND := google
PRODUCT_DEVICE := dream_sapphire
PRODUCT_MODEL := Dream/Sapphire
PRODUCT_MANUFACTURER := HTC

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_ID=FRG83 BUILD_DISPLAY_ID=GWK74 BUILD_FINGERPRINT=tmobile/opal/sapphire/sapphire:2.2.1/FRG83/60505:user/release-keys PRIVATE_BUILD_DESC="opal-user 2.2.1 FRG83 60505 release-keys"

# Build kernel
#PRODUCT_SPECIFIC_DEFINES += TARGET_PREBUILT_KERNEL=
#PRODUCT_SPECIFIC_DEFINES += TARGET_KERNEL_DIR=kernel-msm
#PRODUCT_SPECIFIC_DEFINES += TARGET_KERNEL_CONFIG=cyanogen_msm_defconfig

PRODUCT_SPECIFIC_DEFINES += TARGET_PRELINKER_MAP=$(TOP)/device/htc/dream_sapphire/prelink-linux-arm-sapphire6355.map

# Extra DS overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/cyanogen/overlay/dream_sapphire

# Add the CMWallpapers app
PRODUCT_PACKAGES += CMWallpapers

# This file is used to install the correct audio profile when booted
PRODUCT_COPY_FILES += \
    vendor/cyanogen/prebuilt/dream_sapphire/etc/init.d/02audio_profile:system/etc/init.d/02audio_profile

#
# Set ro.modversion
#
PRODUCT_PROPERTY_OVERRIDES += \
	ro.modversion=CyanogenMod-7.1.0-$(shell date +%m%d%Y)-6355Sapphire

# Use the audio profile hack
WITH_DS_HTCACOUSTIC_HACK := true

#
# Copy DS specific prebuilt files
#
PRODUCT_COPY_FILES +=  \
    vendor/cyanogen/prebuilt/mdpi/media/bootanimation.zip:system/media/bootanimation.zip \
    vendor/cyanogen/prebuilt/dream_sapphire/etc/AudioPara_dream.csv:system/etc/AudioPara_dream.csv \
    vendor/cyanogen/prebuilt/dream_sapphire/etc/AudioPara_sapphire.csv:system/etc/AudioPara_sapphire.csv
