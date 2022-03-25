#!/bin/bash
export ROOT_DIR
source ${ROOT_DIR}/settings.sh

if [[ "${Qemu_x86}" == "" ]]; then
	echo "No qemu found... Exiting."
fi
${Qemu_x86} -smp ${cpus} -m ${mem} 
