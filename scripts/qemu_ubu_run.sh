#!/bin/bash
source scripts/settings.sh

if [[ "${Qemu_x86}" == "" ]]; then
	echo "No qemu found... Exiting."
fi
${Qemu_x86} -smp ${cpus} -m ${mem} \
	-drive if=virtio,file=${disk_image}
