#!/bin/bash

# Boot the emulated system to a shell prompt.
QEMU_EXTRA="-s -S -net user,hostfwd=tcp::4555-:4556 "
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
