#!/bin/bash
set -xue

# QEMU file path
QEMU=qemu-system-riscv32

#start QEMU
$QEMU -machine virt -bios fw_jump.bin -nographic -serial mon:stdio --no-reboot
# fw_jump.bin: BIOS binary file
# -nographic: Base on console type
# --no-reboot: Not use auto reboot
# -machine virt: Use RISC-V model which can make virtual environment
