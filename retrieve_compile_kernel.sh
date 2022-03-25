#!/bin/bash

#wget https://cdn.kernel.org/pub/linux/kernel/v5.x/linux-5.16.17.tar.xz
#tar xvof linux-5.16.17.tar.xz
#cd linux-5.16.17.tar.xz
#make defconfig
cpus=$(($(nproc) / 2))
echo $cpus
#sudo make -j $(( $cpus ))
