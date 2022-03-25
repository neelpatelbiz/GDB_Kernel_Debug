#!/bin/bash
export ROOT_DIR=
source ${ROOT_DIR}/settings.sh

cd ${BUILD_DIR}
[[ ! -f "${Linux_Version}.tar.xz" ]] && wget https://cdn.kernel.org/pub/linux/kernel/v5.x/${Linux_Version}.tar.xz
[[ ! -d "${Linux_Version}" ]] && tar xvof ${Linux_Version}.tar.xz
cd ${Linux_Version}
make defconfig
echo "CONFIG_DEBUG_INFO=y" >> .config
if [[ "$cpus" = "" ]]; then
	cpus=$(($(nproc) / 2))
fi
sudo make -j $cpus
sudo make modules_install -j $cpus
