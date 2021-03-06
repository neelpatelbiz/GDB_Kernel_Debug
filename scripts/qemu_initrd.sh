#!/bin/bash
source scripts/settings.sh

if [[ "${Qemu_x86}" == "" ]]; then
	echo "No qemu found... Exiting."
fi
[[ ! -f ${BUILD_DIR}/${Linux_Version}/arch/x86_64/boot/bzImage ]] && echo "no bzImage found" && exit
[[ ! -f ${BUILD_DIR}/${Linux_Version}/vmlinux ]] && echo "no vmlinux found" && exit
[[ ! -f ${machine_image} ]] && echo "no machine image found" && exit
${Qemu_x86} -smp ${cpus} -m ${mem} \
	-kernel ${BUILD_DIR}/${Linux_Version}/arch/x86_64/boot/bzImage \
	-initrd ${BUILD_DIR}/ramdisk.img \
	-hda ${machine_image} \
	-append "console=ttyS0 " \
	-nographic
