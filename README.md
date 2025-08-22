## 32-Bit Single-Cycle RISC-V Core
This repository contains the complete Verilog implementation of a 32-bit, single-cycle RISC-V processor. This project demonstrates a foundational understanding of computer architecture, from RTL design and functional verification to logic synthesis and physical area estimation. The core is capable of executing the entire RV32I base integer instruction set.

<br>
<p align="center">
<img src="https://github.com/user-attachments/assets/b80f9767-7899-44d5-baf2-12527b9635bf" alt="RISC-V Datapath" width="800"/>
</p>

### ► Key Features
- **Single-Cycle Datapath**: Each instruction is executed in a single clock cycle, providing a clear and fundamental model of a processor's operation.

- **RV32I Instruction Set Architecture**: Full support for the base integer ISA, including:

- **ALU Operations**: ADD, SUB, AND, OR, XOR, SLT, SLTU

- **Immediate Operations**: ADDI, ANDI, ORI, XORI, SLTI, SLTIU

- **Load/Store**: LW, LH, LB, LBU, LHU, SW, SH, SB

- **Branching**: BEQ, BNE, BLT, BGE, BLTU, BGEU

- **Jumps**: JAL, JALR

- **Upper Immediate**: LUI, AUIPC

- **Modular RTL Design**: The processor is designed with clean, distinct modules for key components like the ALU, Control Unit, Register File, and Memory units, promoting readability and scalability.

## ► Architecture & Design
The processor follows a classic single-cycle architecture. The datapath is composed of combinational logic for instruction execution and state elements (PC, Register File, Memory) that update on the rising edge of the clock.

<p align="center">
<img src="https://github.com/user-attachments/assets/29640317-1dcd-4728-8c0b-d9afbd41e9ea" alt="Detailed Design" width="900"/>
</p>

Project Structure
The project is organized into a logical directory structure to separate design, verification, and output files.
```
RISC-V-Processor/
├── top.v                   # Top-level module connecting all components
├── RTLdesign/
│   ├── alu.v               # Arithmetic Logic Unit
│   ├── decoder.v           # Control signal decoder
│   ├── regfile.v           # 32-register file
│   ├── data_memory.v       # Data memory unit
│   ├── inst_memory.v       # Instruction memory unit
│   └── ...                 # Other core modules
├── testbench/
│   ├── top_tb.v            # Main self-checking testbench
│   ├── sum_test.s          # Assembly program for verification
│   └── program.hex         # Machine code generated from assembly
├── waveforms/
│   └── top.vcd             # Simulation waveform output
├── definitions.vh          # Global constants and opcodes
└── synth.ys                # Yosys synthesis script
```

## ► Verification
Functional correctness was verified using a robust, self-checking testbench. A custom assembly program (sum_test.s) was written to test a variety of instructions and corner cases. This program was compiled to machine code using the **riscv32-unknown-elf-gcc toolchain** and loaded into the `instruction memory` for simulation with **Icarus Verilog**.

> The top_tb.v testbench automatically checks the final value in a designated register against an expected result, providing a clear pass/fail outcome.

<p align="center">
<img width="1540" height="626" alt="image" src="https://github.com/user-attachments/assets/2ea97e0d-d26d-43d8-826a-109e56cfdec5" />
</p>

<img width="1510" alt="image" src="https://github.com/user-attachments/assets/af7a54f1-b9af-4c28-a56d-cb8a74997b27" />

## ► Synthesis & Area Estimation
Logic synthesis was performed using Yosys to translate the Verilog RTL into a gate-level netlist. The design was targeted for the open-source SkyWater 130nm Process Design Kit (PDK).

The synthesis results provide a realistic estimate of the processor's physical characteristics:

**Core Logic Area:** `377,560 µm²`

<p align="center">
<img width="514" height="411" alt="Yosys Synthesis start" src="https://github.com/user-attachments/assets/1f85c86a-3fd0-43dd-99bf-578f7bb6eefc" />
</p>

<p align="center">
<img width="514" height="411" alt="Yosys Synthesis Statistics" src="https://github.com/user-attachments/assets/dcb83349-72ec-4df7-9512-c7359f253a9c" />
</p>

## ► Toolchain & Setup
### Prerequisites
- Icarus Verilog
- GTKWave
- RISC-V GCC Toolchain (riscv32-unknown-elf-gcc)
- Yosys
- Linux (Preferred)
  
### Running the Simulation
#### Compile the Assembly Program:

Use the provided script to assemble your test program (.s) and generate the program.hex file that the instruction memory will load.

```
build_program.sh
```
#### Run the Verilog Simulation:
Compile and run the testbench using Icarus Verilog.

```
iverilog -o top -s top_tb top.v && vvp top
```
#### View Waveforms:
Open the generated .vcd file in GTKWave to analyze the signals.
```
gtkwave waveforms/top.vcd
```
