`default_nettype none
`timescale 1ns/1ns
`include "../top.v"

`define assert(signal, value, message) \
    if (signal !== value) begin \
        $display("FAILED: %s. Expected %d (0x%h), but got %d (0x%h)", message, value, value, signal, signal); \
        $finish; \
    end

module top_tb;

    reg rst;
    reg clk;
    wire [`DATA_WIDTH-1:0] debug;

    // Instantiate our single-cycle CPU
    top dut (
        .rst(rst),
        .clk(clk),
        .debug(debug)
    );

    // Clock generation: create a clock with a 10ns period
    initial begin
        clk = 1'b0;
    end
    always #5 clk = ~clk;
    
    // The main test sequence
    initial begin
        // 1. Reset the processor to start it from PC = 0
        rst = 1'b1;
        #10;
        rst = 1'b0;
        
        // 2. Let the simulation run for a fixed number of cycles.
        // Our program is short, so 15 cycles is more than enough.
        #150;

        // 3. At the end, verify the final state.
        // The program calculates 5+4+3+2+1 = 15 and stores it in x10.
        $display("--- Verification ---");
        `assert(dut.reg_file.registers[10], 15, "Final sum in register x10");
        
        $display("--- Test Passed! ---");
        $finish;
    end

    initial begin
        $dumpfile("../waveforms/top.vcd");
        $dumpvars(0, dut);
    end

endmodule

