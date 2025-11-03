#!/bin/bash

rm -rf .repo/local_manifests/
rm -rf .repo/repo/

# repo init rom
repo init --no-repo-verify --git-lfs -u https://github.com/ProjectInfinity-X/manifest -b 16 -g default,-mips,-darwin,-notdefault
echo "=================="
echo "Repo init success"
echo "=================="

# sync
/opt/crave/resync.sh
echo "============="
echo "Sync success"
echo "============="

# dt
git clone https://github.com/hxfuxyy/new_device_xiaomi_nabu device/xiaomi/nabu 
git clone https://gitlab.com/crdroidandroid/android_vendor_xiaomi_nabu vendor/xiaomi/nabu 
git clone https://github.com/hxfuxyy/android_kernel_xiaomi_sm8150 kernel/xiaomi/nabu
rm -rf hardware/xiaomi 
git clone https://github.com/Evolution-X-Devices/hardware_xiaomi hardware/xiaomi 
git clone https://github.com/TogoFire/packages_apps_ViPER4AndroidFX packages/apps/ViPER4AndroidFX 
rm -rf packages/apps/Updater
git clone https://github.com/hxfuxyy/packages_apps_Updater packages/apps/Updater
rm -rf vendor/infinity
git clone https://github.com/hxfuxyy/vendor_infinity vendor/infinity

# initiate build setup
. build/envsetup.sh

echo "======= Build starting ======"
lunch infinity_nabu-userdebug && m bacon
