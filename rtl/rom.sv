// TODO does the ROM address increase on increments of 1 or 16? Right now set as increments of 1
`timescale 1ns/1ps
`define ROM_INIT_PATH ""

module rom #(
    parameter DATA_WIDTH = 16,      // Word length
    parameter ADDR_WIDTH = 8,       // Addr length
    parameter WORDS = 5,            // Words
    parameter string ROM_INIT_PATH = `ROM_INIT_PATH // If left unasigned ROM needs to be initialized externally

)(
    input wire [ADDR_WIDTH-1:0] addr_i,
    output reg [DATA_WIDTH-1:0] data_o
);
    
    
    reg [DATA_WIDTH-1:0] memory [0:WORDS-1]; // 5 words of 16 bits each
    
    // ROM initialization block
    initial begin
        if (ROM_INIT_PATH != "") begin
            $readmemh(ROM_INIT_PATH, memory);
        end
    end

    // ROM logic here
    always @(*) begin
        data_o = memory[addr_i];
    end
endmodule
