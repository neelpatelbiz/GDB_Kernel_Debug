#!/bin/bash
source scripts/settings.sh

if [[ "${Qemu_x86}" == "" ]]; then
	echo "No qemu found... Exiting."
fi
[[ ! -f ${BUILD_DIR}/${Linux_Version}/arch/x86_64/boot/bzImage ]] && echo "no bzImage found"
[[ ! -f ${BUILD_DIR}/${Linux_Version}/vmlinux ]] && echo "no vmlinux found"
${Qemu_x86} -smp 6 -m 8096 \
	-hda ${BUILD_DIR}/drive1.qcow2 \
	-boot d
	-append "console=ttyS0 nokaslr root=/dev/hda1" \

