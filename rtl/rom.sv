module rom #(
    parameter addr_width = 32,
    parameter data_width = 32
)(
    input   [addr_width-1:0] addr_i,
    output  [data_width-1:0] data_o
);

    // Declare registers that will store data from ROM
    reg [data_width-1:0] rom_data [0:(2**addr_width)-1];

    generate
        for (genvar i = 0; i < (2**addr_width); i++) begin : INIT_ROM
            initial begin
                // Initialize rom_data[i] based on your requirements
                rom_data[i] = 32'h12345678;
            end
        end
    endgenerate

    always @(*) begin
        data_o = rom_data[addr_i];
    end

endmodule
