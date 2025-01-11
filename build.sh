#!/bin/bash

#Build Script for nabu
#Remove files
rm -rf .repo/local_manifests
echo "----------------DELETED DIRECTORIES----------------"

#Initialise repos
repo init -u https://github.com/crdroidandroid/android.git -b 15.0 --git-lfs
echo "--------------REPO INITIALISED---------------"

#Resync
/opt/crave/resync.sh
echo "---------------RESYNCED-----------------"

rm -rf packages/apps/Settings
rm -rf device/xiaomi/nabu
rm -rf vendor/xiaomi/nabu
rm -rf kernel/xiaomi/nabu
rm -rf hardware/xiaomi
echo "----------------DELETED DIRECTORIES----------------"

git clone -b 15.0 https://github.com/hxfuxyy/android_packages_apps_Settings packages/apps/Settings
git clone -b crdroid-v https://github.com/hxfuxyy/android_device_xiaomi_nabu device/xiaomi/nabu
git clone -b lineage-22 https://github.com/dev-harsh1998/android_kernel_xiaomi_nabu kernel/xiaomi/nabu
git clone -b lineage-22 https://gitlab.com/dev-harsh1998/android_vendor_xiaomi_nabu vendor/xiaomi/nabu
git clone -b 15.0 https://github.com/crdroidandroid/android_hardware_xiaomi hardware/xiaomi
echo "---------------RESYNCED-----------------"

#Build Environment
. build/envsetup.sh
echo "---------------BUILD ENVIRONMENT------------------"

#Brunch
echo "--------------CRDROID BUILD STARTED--------------"
brunch nabu

cp out/target/product/nabu/*.zip .
echo "--------------MOVED VANILLA ZIPS TO ROOT DIRECTORY--------------"
echo "--------------BUILD SUCCESSFULLY--------------"
