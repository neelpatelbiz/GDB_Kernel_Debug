#!/bin/bash
source scripts/settings.sh

#get iso
cd $BUILD_DIR
[[ ! -f "${ubu_iso}" ]] && wget http://mirror.math.princeton.edu/pub/ubuntu-iso/20.04/ubuntu-20.04.4-live-server-amd64.iso
[[ ! -f "${disk_image}" ]] && qemu-img create -f qcow2 ${disk_image} 16G
sudo ${Qemu_x86} -smp ${cpus} -m ${mem} \
	-cdrom ${ubu_iso} \
	-drive if=virtio,file=${disk_image},cache=none\
	-vnc :1

