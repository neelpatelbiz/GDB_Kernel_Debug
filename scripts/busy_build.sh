#!/bin/bash
source scripts/settings.sh
cd $BUILD_DIR


curl https://busybox.net/downloads/busybox-1.26.2.tar.bz2 | tar xjf -
cd busybox-1.26.2
mkdir -pv obj/busybox-x86
make O=obj/busybox-x86 menuconfig
cd obj/busybox-x86
make -j $$( $(nproc) / 2 )
