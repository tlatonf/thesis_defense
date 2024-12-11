module karatsuba12 (
    input  wire [11:0] a_i,
    input  wire [11:0] b_i,
    output wire [23:0] p_o
);

    // Karatsuba multiplication for 12-bit numbers
    // a = (a_high)*2^6 + (a_low)
    // b = (b_high)*2^6 + (b_low)
    // a*b = z2*2^12 + z1*2^6 + z0

    // Decompose a and b into high and low 6-bit parts
    wire [5:0] a_high = a_i[11:6];
    wire [5:0] a_low  = a_i[5:0];
    wire [5:0] b_high = b_i[11:6];
    wire [5:0] b_low  = b_i[5:0];

    // Compute partial products z0 and z2
    wire [11:0] z0 = a_low * b_low;
    wire [11:0] z2 = a_high * b_high;

    // Compute z1 using Karatsuba logic:
    // z1 = (a_high + a_low)*(b_high + b_low) - z0 - z2
    wire [ 6:0] sumA = a_high + a_low;
    wire [ 6:0] sumB = b_high + b_low;
    wire [13:0] sumAB = sumA * sumB;
    wire [13:0] z1 = sumAB - {2'b0, z0} - {2'b0, z2};

    // Position each partial product:
    // z2 << 12, z1 << 6, z0 as is
    wire [23:0] partZ2 = {z2, 12'b0};
    wire [23:0] partZ1 = {4'b0, z1, 6'b0};
    wire [23:0] partZ0 = {12'b0, z0};

    // Combine partial results
    assign p_o = partZ2 + partZ1 + partZ0;

endmodule
