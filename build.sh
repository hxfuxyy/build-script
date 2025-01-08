#!/bin/bash

#Build Script for nabu
#Remove files
rm -rf .repo/local_manifests
echo "----------------DELETED DIRECTORIES----------------"

#Initialise repos
repo init -u https://github.com/RisingTechOSS/android -b fifteen --git-lfs
echo "--------------REPO INITIALISED---------------"

#Local Manifest
git clone https://github.com/hxfuxyy/nabu-local_manifest --depth 1 -b rising-v .repo/local_manifests
echo "-----------------CLONED local manifest-------------------"

#Resync
/opt/crave/resync.sh
echo "---------------RESYNCED-----------------"
#Build Environment
. build/envsetup.sh
echo "---------------BUILD ENVIRONMENT------------------"

#Lunch
riseup nabu userdebug
echo "--------------VANILLA BUILD STARTED--------------"
rise b

mv out/target/product/nabu/*.zip .
echo "--------------MOVED VANILLA ZIPS TO ROOT DIRECTORY--------------"

#Exports for Gapps Build
export WITH_GMS=true
export TARGET_CORE_GMS=true
echo "--------------GAPPS BUILD STARTED--------------"
rise b

mv out/target/product/nabu/*.zip .
echo "--------------MOVED GAPPS ZIPS TO ROOT DIRECTORY----------------"