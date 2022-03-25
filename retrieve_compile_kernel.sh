#!/bin/bash

wget https://cdn.kernel.org/pub/linux/kernel/v5.x/linux-5.16.17.tar.xz
tar xvof linux-5.16.17.tar.xz
cd linux-5.16.17
make defconfig
cpus=$(($(nproc) / 2))
echo "compiling kernel using $cpus cpus ..."
sudo make -j $cpus
sudo make modules_install -j $cpus
