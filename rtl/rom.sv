module rom # (
    parameter addr_width = 32;
    parameter data_width = 32;
)(
    input   [addr_width-1:0] addr_i,
    output  [data_width-1:0] data_o
);

// Declare registers that will store data from ROM
reg [data_width-1:0] rom_data [0:(2**addr_width)-1]; 

initial begin
    // Declare here the base configuration of the ROM 
    // TODO find a way to import this from CSV or something similar
end

assign data = rom_data[addr_i];

endmodule