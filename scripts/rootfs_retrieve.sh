#!/bin/bash
source scripts/settings.sh
cd $BUILD_DIR
[[ ! -f "${rootfs}.tar.gz" ]] && wget https://landley.net/aboriginal/bin/root-filesystem-x86_64.tar.gz
[[ ! -d "${rootfs}" ]] && tar zxof root-filesystem-x86_64.tar.gz
if [[ ! -f "${rootdisk}" ]]; then
	touch ${rootdisk}
	dd if=/dev/null of=${rootdisk} bs=1M seek=10240
	mkfs.ext4 -F ${rootdisk}
	sudo mkdir /mnt/disk
	sudo mount -t ext4 -o loop ${rootdisk} /mnt/disk
	sudo cp -r root-filesystem-x86_64/* /mnt/disk
	sudo umount /mnt/disk
fi
