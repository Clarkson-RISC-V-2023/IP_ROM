module rom #(
    parameter addr_width = 4,
    parameter data_width = 16
)(
    input   [addr_width-1:0] addr_i,
    output  [data_width-1:0] data_o,
    output  error
);

    // Declare registers that will store data from ROM
    reg [data_width-1:0] rom_data [0:(2**addr_width)-1];
    reg read_success;

    // Read memory initialization file and handle errors
    initial begin
        read_success = $readmemh("init_rom.mem", rom_data);
        if (!read_success) begin
            $display("Error: Unable to read memory initialization file.");
            error = 1;
        end
    end

    always @(*) begin
        if (read_success && addr_i < (2**addr_width)) begin
            data_o = rom_data[addr_i];
            error = 0; // No error
        end else begin
            data_o = {data_width{1'bx}}; // Invalid data
            error = 1; // Error
        end
    end

endmodule
