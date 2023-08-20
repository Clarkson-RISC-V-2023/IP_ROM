module rom #(
    parameter addr_width = 4,
    parameter data_width = 16
)(
    input   [addr_width-1:0] addr_i,
    output  [data_width-1:0] data_o
);

    // Declare registers that will store data from ROM
    reg [data_width-1:0] rom_data [0:(2**addr_width)-1];
    $readmemh("init_rom.mem", rom_data);

    always @(*) begin
        data_o = rom_data[addr_i];
    end

endmodule
