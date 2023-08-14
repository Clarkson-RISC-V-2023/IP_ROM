module tb_rom;
    reg [addr_width-1:0] address;
    wire [data_width-1:0] data;

    rom dut (
        .addr_i(address),
        .data_o(data)
    );

    initial begin
        // Initialize address with desired values
        // Example: address = 8'b00000000;
        
        // Apply addresses and observe data
        #10 address = 8'b00000001;
        #10 address = 8'b00000010;
        // ...

        $finish;
    end
endmodule