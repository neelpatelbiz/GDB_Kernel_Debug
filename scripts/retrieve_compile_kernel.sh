#!/bin/bash
source scripts/settings.sh

cd ${BUILD_DIR}
[[ ! -f "${Linux_Version}.tar.xz" ]] && wget https://cdn.kernel.org/pub/linux/kernel/v5.x/${Linux_Version}.tar.xz
if [[ ! -d "${Lin_Path}" ]]; then 
	tar xvof ${Linux_Version}.tar.xz
	cd ${Linux_Version}
	make defconfig
	echo "CONFIG_DEBUG_INFO=y" >> .config
	sudo make -j $cpus
	sudo make modules_install -j $cpus
fi
