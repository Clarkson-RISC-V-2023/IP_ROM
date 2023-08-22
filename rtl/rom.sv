// TODO does the ROM address increase on increments of 1 or 16? Right now set as increments of 1
module rom #(
    parameter DATA_WIDTH = 16,      // Word length
    parameter ADDR_WIDTH = 8,       // Addr length
    parameter WORDS = 5,            // Words
    parameter ENABLE_ROM_INIT = 1   // Default: No initialization

)(
    input wire [ADDR_WIDTH-1:0] addr_i,
    output reg [DATA_WIDTH-1:0] data_o
);
    
    
    reg [DATA_WIDTH-1:0] memory [0:WORDS-1]; // 5 words of 16 bits each
    
    // ROM initialization block
    initial begin
        if (ENABLE_ROM_INIT) begin
            $readmemh("rom_contents.hex", memory);
        end
    end

    // ROM logic here
    always @(*) begin
        data_o = memory[addr_i];
    end
endmodule
