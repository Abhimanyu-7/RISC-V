
#!/bin/bash

set -e

PROG_NAME=sum_test
TB_DIR=testbench

# 1. Assemble the .s file into a .o object file.
riscv32-unknown-elf-as -march=rv32i -o $TB_DIR/$PROG_NAME.o $TB_DIR/$PROG_NAME.s

# 2. Link the object file, placing the code at address 0.
riscv32-unknown-elf-ld -Ttext=0 -o $TB_DIR/$PROG_NAME.elf $TB_DIR/$PROG_NAME.o

# 3. Use objdump to create a clean hex file formatted correctly for Verilog.
riscv32-unknown-elf-objdump -d $TB_DIR/$PROG_NAME.elf | \
    awk '/^[0-9a-f]+:/ {print $2}' > $TB_DIR/program.hex

echo "Assembly complete! Clean hex file generated at $TB_DIR/$PROG_NAME.hex"
