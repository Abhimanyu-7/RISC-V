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

  ### Design Diagram
  <img width="1197" height="682" alt="image" src="https://github.com/user-attachments/assets/29640317-1dcd-4728-8c0b-d9afbd41e9ea" />


   #### Verilog Code

   #### Testbench
   

## Simulation
### Icarus Verilog + GTKwave

  #### Final GTK Waveform
  <img width="1840" height="626" alt="image" src="https://github.com/user-attachments/assets/2ea97e0d-d26d-43d8-826a-109e56cfdec5" />
  <img width="1510" height="269" alt="image" src="https://github.com/user-attachments/assets/af7a54f1-b9af-4c28-a56d-cb8a74997b27" />



## Synthesis using Yosys

  #### Stat
  <img width="456" height="528" alt="image" src="https://github.com/user-attachments/assets/1f85c86a-3fd0-43dd-99bf-578f7bb6eefc" />
  <img width="514" height="751" alt="image" src="https://github.com/user-attachments/assets/f22b72d1-1c44-49ab-9960-b67389e6f1ad" />




## Netlist and Area Estimation

