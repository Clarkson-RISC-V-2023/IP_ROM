module tb_rom # (
    parameter data_width = 16,
    parameter addr_width = 5 * data_width
);
    reg [addr_width-1:0] address;
    wire [data_width-1:0] data;

    rom #(
        .data_width(data_width),
        .addr_width(addr_width)
    ) dut (
        .addr_i(address),
        .data_o(data)
    );

    initial begin
        // Initialize address with desired values
        // Example: address = 8'b00000000;
        
        // Apply addresses and observe data
        #10 address = 8'b00000000;
        #10 address = 8'b00010000;
        // ...

        $finish;
    end
endmodule