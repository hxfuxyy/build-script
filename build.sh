#!/bin/bash

rm -rf .repo/local_manifests
rm -rf .repo/repo
repo init -u https://github.com/LineageOS/android.git -b lineage-23.0 --git-lfs
/opt/crave/resync.sh
git clone https://github.com/Evolution-X-Devices/device_xiaomi_marble device/xiaomi/marble
git clone https://github.com/Evolution-X-Devices/device_xiaomi_sm8450-common device/xiaomi/sm8450-common
git clone https://github.com/Evolution-X-Devices/vendor_xiaomi_sm8450-common vendor/xiaomi/sm8450-common
git clone https://github.com/Evolution-X-Devices/vendor_xiaomi_marble vendor/xiaomi/marble
rm -rf hardware/xiaomi
git clone https://github.com/Evolution-X-Devices/hardware_xiaomi hardware/xiaomi -b bka-no-dolby
rm -rf hardware/dolby
git clone https://github.com/Evolution-X-Devices/hardware_dolby -b bka-aospa
git clone https://github.com/Evolution-X-Devices/device_xiaomi_miuicamera-marble device/xiaomi/miuicamera-marble
git clone https://github.com/Evolution-X-Devices/vendor_xiaomi_miuicamera-marble vendor/xiaomi/miuicamera-marble
git clone https://github.com/Evolution-X-Devices/kernel_xiaomi_sm8450 kernel/xiaomi/sm8450
git clone https://github.com/Evolution-X-Devices/kernel_xiaomi_sm8450-devicetrees kernel/xiaomi/sm8450-devicetrees
git clone https://github.com/LineageOS/android_kernel_xiaomi_sm8450-modules kernel/xiaomi/sm8450-modules -b lineage-22.2
source build/envsetup.sh
brunch marble
cp out/target/product/marble/*.zip .
echo "--------------BUILD SUCCESSFULLY--------------"
