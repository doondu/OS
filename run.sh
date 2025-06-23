#!/bin/bash
set -xue

# QEMU file path
QEMU=qemu-system-riscv32

# Find bin file direct
SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
FW_PATH="$SCRIPT_DIR/opensbi-riscv32-generic-fw_dynamic.bin"

#start QEMU
$QEMU -machine virt -bios "$FW_PATH" -serial mon:stdio --no-reboot
# fw_jump.bin: BIOS binary file
# -nographic: Base on console type
# --no-reboot: Not use auto reboot
# -machine virt: Use RISC-V model which can make virtual environment
