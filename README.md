# RISC-V
## Overview
A verilog implementation of Single Cycle RISC-V based processor. 

This implementation follows a classic single-cycle datapath, where each instruction is fully executed in one clock cycle. This serves as a foundational project for understanding core computer architecture concepts before advancing to more complex pipelined designs.

## Significance

## RISC v/s CISC
  ### Applications
  
## Architecture
<p align="center">
<img width="691" height="430" alt="Screenshot from 2025-07-17 15-03-55" src="https://github.com/user-attachments/assets/b80f9767-7899-44d5-baf2-12527b9635bf" />
</p>

## ISA

## Pipelined Architecture

## RTL Design
  ### Project Structure
  ```
  RISC-V Project/
  ├── top.v
  ├── RTLdesign/
  │   ├── alu.v
  │   ├── reg_file.v
  │   ├── data_memory.v
  │   ├── inst_memory.v
  │   ├── control_unit.v
  │   ├── ...
  ├── definitions.vh
  ├── synth.ys
```
   #### Verilog Code

   #### Testbench
   

## Simulation
### Icarus Verilog + GTKwave

## Synthesis using Yosys


## Netlist and Area Estimation

