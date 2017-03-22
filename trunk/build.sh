#!/bin/bash

ANDROID_SDK="10 13 14 18 19 21"
for opt
do
  case $opt in
    ANDROID_SDK=*)
    ANDROID_SDK=${opt#ANDROID_SDK=}
    ;;
  esac
done

for i in $ANDROID_SDK
do
  echo "Compiling for API LEVEL($i)..............."
  ndk-build NDK_PROJECT_PATH=./out/$i \
            APP_BUILD_SCRIPT=./Android.mk \
            APP_PLATFORM=android-$i \
            ANDROID_SDK=$i \
            APP_ABI=armeabi-v7a \
            NDK_APP_STL=stlport_shared \
            -j8
done

#NDK_APP_STL=stlport_static
#NDK_APP_STL=gnustl_static
