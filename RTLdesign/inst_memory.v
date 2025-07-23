`include "../definitions.vh"

module instruction_memory #(
    parameter MEM_SIZE = 1024
)  (
    input wire [$clog2(MEM_SIZE)-1:0] addr,
    output reg [`INST_WIDTH-1:0] inst
);
    // Declare the memory for the instructions
    reg [`INST_WIDTH-1:0] memory [0:MEM_SIZE-1];

    // Use an initial block to load the program from an external hex file.
    // This is the standard way to initialize memories in simulation.
    initial begin
        $readmemh("../testbench/program.hex", memory);
    end

    always @(addr) begin
        // The address from the PC is a byte address, so we divide by 4
        // to get the word-aligned index for our memory array.
        inst = memory[addr >> 2];
    end

endmodule
