#!/bin/bash

# Boot the emulated system to a shell prompt.
#QEMU_EXTRA="-s -S -netdev user,id=n1 -device virtio-net-pci,netdev=n1 "
#QEMU_EXTRA="-s -S -netdev user,id=n1 -device e1000,netdev=n1"
QEMU_EXTRA="-s -S -nic user,ipv6=off,model=e1000,mac=52:54:98:76:54:32,hostfwd=tcp:127.0.0.1:4433-:4433"
#QEMU_EXTRA="-s -S -netdev user,id=n0,hostfwd=192.168.1.2:4433-10.0.2.15:4422"
KERNEL_EXTRA="nokaslr"

ARCH=x86_64
run_emulator()
{
  [ ! -z "$DEBUG" ] && set -x
  qemu-system-x86_64 -nographic -no-reboot -kernel ../linux-5.15.31/arch/x86_64/boot/bzImage -initrd rootfs.cpio.gz -append "panic=1 console=ttyS0 HOST=x86_64 $KERNEL_EXTRA" $QEMU_EXTRA
}

if [ "$1" != "--norun" ]
then
  run_emulator
fi
