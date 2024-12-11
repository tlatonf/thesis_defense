module mem_ntt (
    input logic [6:0] row_i,
    input logic clock,
    output logic [11:0] data_o [0:127]
);

    // ROM with 16384 words and 12-bit wide data
    wire [11:0] rom_data;
    wire [13:0] address;

    // Compute the address based on row_i and output the corresponding memory data
    assign address = row_i + (128 * $unsigned(i)); // Address mapping for each data_o[i]

    // ROM instance
    rom memory (
        .address(address),
        .clock(clock),
        .q(rom_data)
    );

    // Output data mapping for 128 locations
    genvar i;
    generate
        for (i = 0; i < 128; i = i + 1) begin : data_assign
            assign data_o[i] = rom_data;  // All data_o[i] will output data from rom
        end
    endgenerate

endmodule