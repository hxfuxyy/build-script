#!/bin/bash

rm -rf .repo/local_manifests/

# repo init rom
repo init --no-repo-verify --git-lfs -u https://github.com/ProjectInfinity-X/manifest -b 16 -g default,-mips,-darwin,-notdefault
echo "=================="
echo "Repo init success"
echo "=================="

# Local manifests
git clone https://github.com/hxfuxyy/nabu-local_manifest -b Infinityx-16 .repo/local_manifests
echo "============================"
echo "Local manifest clone success"
echo "============================"

# build
/opt/crave/resync.sh
echo "============="
echo "Sync success"
echo "============="

# remove ota updater string
rm -rf packages/apps/Updater
git clone https://github.com/hxfuxyy/packages_apps_Updater packages/apps/Updater
rm -rf vendor/infinity
git clone https://github.com/hxfuxyy/vendor_infinity vendor/infinity

# initiate build setup
. build/envsetup.sh

echo "======= Build starting ======"
lunch infinity_nabu-userdebug && m bacon
