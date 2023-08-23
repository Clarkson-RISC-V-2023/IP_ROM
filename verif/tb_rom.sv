`timescale 1ns/1ps
 
module tb_rom # (
    parameter DATA_WIDTH = 16,      // Word length
    parameter ADDR_WIDTH = 8,       // Addr length
    parameter WORDS = 5,            // Words
    parameter ENABLE_ROM_INIT = 0   // Default: No initialization
);
    reg [ADDR_WIDTH-1:0] address; // Change 'wire' to 'reg'
    wire [DATA_WIDTH-1:0] data;
    wire error;

    // Rest of the code remains unchanged

    rom #(
        .DATA_WIDTH(DATA_WIDTH),
        .ADDR_WIDTH(ADDR_WIDTH),
        .WORDS(WORDS),
        .ENABLE_ROM_INIT(ENABLE_ROM_INIT)
    ) dut_rom (
        .addr_i(address),
        .data_o(data)
    );

    initial begin
        $readmemh("init_rom.mem", dut_rom.memory);
        $dumpfile("rom_sim.vcd");
        $dumpvars(0, tb_rom);

        // Initialize address with desired values
        address = 8'b00000000; // Example

        // Apply addresses and observe data
        #10 address = 8'b00000000;
        #10 address = 8'b00000001;
        #10 address = 8'b00000010;
        #10 address = 8'b00000011;
        #10 address = 8'b00000100;
        // ...

        #100 $finish; // Allow time for observation
    end
endmodule
