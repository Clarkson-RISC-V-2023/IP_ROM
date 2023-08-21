// iverilog -o out/rom_rtl -s rom rom/rtl/rom.sv -y ./rom
module rom #(
    parameter data_width = 16,
    parameter addr_width = 5 * data_width
)(
    input           [addr_width-1:0] addr_i,
    output  reg     [data_width-1:0] data_o,
    output  wire    error
);

    // Declare registers that will store data from ROM
    reg [data_width-1:0] rom_data [0:(2**addr_width)-1];
    reg read_success;
    reg error_reg;
    assign error = error_reg;

    // Read memory initialization file and handle errors
    initial begin
        read_success = $readmemh("init_rom.mem", rom_data);
        if (!read_success) begin
            $display("Error: Unable to read memory initialization file.");
            error_reg = 1'b1; // Set initial value
        end else begin
            error_reg = 1'b0; // Set initial value
        end
    end

    always @(*) begin
        if (read_success && $unsigned(addr_i) < (2**addr_width)) begin
            data_o = rom_data[addr_i];
            error_reg = 1'b0; // No error
        end else begin
            data_o = {data_width{1'bx}}; // Invalid data
            error_reg = 1'b1; // Error
        end
    end

endmodule
