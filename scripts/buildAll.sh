source scripts/settings.sh
./scripts/retrieve_compile_kernel.sh
cd ${BUILD_DIR}

[[ ! -f ${ramfs} ]] && mkinitramfs -o ${ramfs}
[[ ! -f "${machine_image}.tar.gz" ]] && wget https://landley.net/aboriginal/bin/system-image-x86_64.tar.gz --no-check-certificate
[[ ! -f "${machine_image}" ]] && tar zxof ${machine_image}.tar.gz
