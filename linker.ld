/* Simple Linker Script for RISC-V Simulation */
OUTPUT_ARCH(riscv)
ENTRY(_start)

MEMORY
{
  /* Our instruction memory starts at address 0 and is 1KB in size */
  imem (rwx) : ORIGIN = 0x00000000, LENGTH = 1K
}

SECTIONS
{
  /* Place the program code (.text section) at the start of imem */
  .text :
  {
    *(.text)
  } > imem
}
