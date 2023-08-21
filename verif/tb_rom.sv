`timescale 1ns/1ps

module tb_rom # (
    parameter data_width = 16,
    parameter addr_width = 5 * data_width
);
    reg [addr_width-1:0] address; // Change 'wire' to 'reg'
    wire [data_width-1:0] data;
    wire error;

    // Rest of the code remains unchanged

    initial begin
        $dumpfile("out/rom_sim.vcd");
        $dumpvars(0, tb_rom);

        // Initialize address with desired values
        address = 8'b00000000; // Example

        // Apply addresses and observe data
        #10 address = 8'b00000000;
        #10 address = 8'b00010000;
        // ...

        #100 $finish; // Allow time for observation
        $display("Sim COMPLETE...");
    end
endmodule
