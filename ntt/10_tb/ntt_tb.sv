module ntt_tb;

  logic clk_i, rst_ni;
  logic start_i;
  logic [11:0] coeff_i [0:255];
  logic [11:0] coeff_o [0:255];
  logic done_o;

  ntt ntt (
    .clk_i    (clk_i),
    .rst_ni   (rst_ni),
    .start_i  (start_i),
    .coeff_i  (coeff_i),
    .coeff_o  (coeff_o),
    .done_o   (done_o)
  );

  always #5 clk_i = ~clk_i;

  initial begin
    clk_i = 0;
    rst_ni = 1;
    #10;

    rst_ni = 0;
    #10;

    coeff_i[  0] = 12'd0;
    coeff_i[  1] = 12'd3328;
    coeff_i[  2] = 12'd1;
    coeff_i[  3] = 12'd0;
    coeff_i[  4] = 12'd0;
    coeff_i[  5] = 12'd0;
    coeff_i[  6] = 12'd1;
    coeff_i[  7] = 12'd1;
    coeff_i[  8] = 12'd2;
    coeff_i[  9] = 12'd3;
    coeff_i[ 10] = 12'd2;
    coeff_i[ 11] = 12'd1;
    coeff_i[ 12] = 12'd2;
    coeff_i[ 13] = 12'd3328;
    coeff_i[ 14] = 12'd0;
    coeff_i[ 15] = 12'd0;
    coeff_i[ 16] = 12'd0;
    coeff_i[ 17] = 12'd1;
    coeff_i[ 18] = 12'd3328;
    coeff_i[ 19] = 12'd3328;
    coeff_i[ 20] = 12'd3328;
    coeff_i[ 21] = 12'd2;
    coeff_i[ 22] = 12'd0;
    coeff_i[ 23] = 12'd0;
    coeff_i[ 24] = 12'd2;
    coeff_i[ 25] = 12'd1;
    coeff_i[ 26] = 12'd1;
    coeff_i[ 27] = 12'd1;
    coeff_i[ 28] = 12'd0;
    coeff_i[ 29] = 12'd1;
    coeff_i[ 30] = 12'd0;
    coeff_i[ 31] = 12'd0;
    coeff_i[ 32] = 12'd3327;
    coeff_i[ 33] = 12'd1;
    coeff_i[ 34] = 12'd1;
    coeff_i[ 35] = 12'd3326;
    coeff_i[ 36] = 12'd3327;
    coeff_i[ 37] = 12'd3328;
    coeff_i[ 38] = 12'd1;
    coeff_i[ 39] = 12'd3327;
    coeff_i[ 40] = 12'd3326;
    coeff_i[ 41] = 12'd3327;
    coeff_i[ 42] = 12'd2;
    coeff_i[ 43] = 12'd2;
    coeff_i[ 44] = 12'd3328;
    coeff_i[ 45] = 12'd3328;
    coeff_i[ 46] = 12'd3328;
    coeff_i[ 47] = 12'd1;
    coeff_i[ 48] = 12'd3328;
    coeff_i[ 49] = 12'd0;
    coeff_i[ 50] = 12'd3328;
    coeff_i[ 51] = 12'd1;
    coeff_i[ 52] = 12'd3327;
    coeff_i[ 53] = 12'd1;
    coeff_i[ 54] = 12'd0;
    coeff_i[ 55] = 12'd3328;
    coeff_i[ 56] = 12'd2;
    coeff_i[ 57] = 12'd0;
    coeff_i[ 58] = 12'd0;
    coeff_i[ 59] = 12'd3328;
    coeff_i[ 60] = 12'd2;
    coeff_i[ 61] = 12'd3327;
    coeff_i[ 62] = 12'd0;
    coeff_i[ 63] = 12'd0;
    coeff_i[ 64] = 12'd1;
    coeff_i[ 65] = 12'd3328;
    coeff_i[ 66] = 12'd3328;
    coeff_i[ 67] = 12'd3328;
    coeff_i[ 68] = 12'd0;
    coeff_i[ 69] = 12'd1;
    coeff_i[ 70] = 12'd0;
    coeff_i[ 71] = 12'd3328;
    coeff_i[ 72] = 12'd1;
    coeff_i[ 73] = 12'd0;
    coeff_i[ 74] = 12'd1;
    coeff_i[ 75] = 12'd1;
    coeff_i[ 76] = 12'd1;
    coeff_i[ 77] = 12'd1;
    coeff_i[ 78] = 12'd3328;
    coeff_i[ 79] = 12'd2;
    coeff_i[ 80] = 12'd3328;
    coeff_i[ 81] = 12'd2;
    coeff_i[ 82] = 12'd1;
    coeff_i[ 83] = 12'd1;
    coeff_i[ 84] = 12'd3328;
    coeff_i[ 85] = 12'd1;
    coeff_i[ 86] = 12'd3328;
    coeff_i[ 87] = 12'd0;
    coeff_i[ 88] = 12'd3328;
    coeff_i[ 89] = 12'd3328;
    coeff_i[ 90] = 12'd1;
    coeff_i[ 91] = 12'd1;
    coeff_i[ 92] = 12'd3328;
    coeff_i[ 93] = 12'd1;
    coeff_i[ 94] = 12'd3327;
    coeff_i[ 95] = 12'd3;
    coeff_i[ 96] = 12'd3328;
    coeff_i[ 97] = 12'd3328;
    coeff_i[ 98] = 12'd0;
    coeff_i[ 99] = 12'd0;
    coeff_i[100] = 12'd3;
    coeff_i[101] = 12'd1;
    coeff_i[102] = 12'd3327;
    coeff_i[103] = 12'd3327;
    coeff_i[104] = 12'd1;
    coeff_i[105] = 12'd0;
    coeff_i[106] = 12'd3328;
    coeff_i[107] = 12'd3327;
    coeff_i[108] = 12'd0;
    coeff_i[109] = 12'd0;
    coeff_i[110] = 12'd3326;
    coeff_i[111] = 12'd0;
    coeff_i[112] = 12'd1;
    coeff_i[113] = 12'd1;
    coeff_i[114] = 12'd0;
    coeff_i[115] = 12'd2;
    coeff_i[116] = 12'd3327;
    coeff_i[117] = 12'd0;
    coeff_i[118] = 12'd3328;
    coeff_i[119] = 12'd1;
    coeff_i[120] = 12'd1;
    coeff_i[121] = 12'd3326;
    coeff_i[122] = 12'd1;
    coeff_i[123] = 12'd3;
    coeff_i[124] = 12'd0;
    coeff_i[125] = 12'd2;
    coeff_i[126] = 12'd0;
    coeff_i[127] = 12'd0;
    coeff_i[128] = 12'd0;
    coeff_i[129] = 12'd1;
    coeff_i[130] = 12'd0;
    coeff_i[131] = 12'd0;
    coeff_i[132] = 12'd3327;
    coeff_i[133] = 12'd1;
    coeff_i[134] = 12'd3328;
    coeff_i[135] = 12'd1;
    coeff_i[136] = 12'd3328;
    coeff_i[137] = 12'd1;
    coeff_i[138] = 12'd0;
    coeff_i[139] = 12'd3328;
    coeff_i[140] = 12'd3327;
    coeff_i[141] = 12'd1;
    coeff_i[142] = 12'd0;
    coeff_i[143] = 12'd0;
    coeff_i[144] = 12'd0;
    coeff_i[145] = 12'd2;
    coeff_i[146] = 12'd3328;
    coeff_i[147] = 12'd0;
    coeff_i[148] = 12'd3328;
    coeff_i[149] = 12'd0;
    coeff_i[150] = 12'd0;
    coeff_i[151] = 12'd0;
    coeff_i[152] = 12'd3;
    coeff_i[153] = 12'd1;
    coeff_i[154] = 12'd3328;
    coeff_i[155] = 12'd1;
    coeff_i[156] = 12'd3328;
    coeff_i[157] = 12'd0;
    coeff_i[158] = 12'd3327;
    coeff_i[159] = 12'd3328;
    coeff_i[160] = 12'd1;
    coeff_i[161] = 12'd3328;
    coeff_i[162] = 12'd1;
    coeff_i[163] = 12'd1;
    coeff_i[164] = 12'd3328;
    coeff_i[165] = 12'd1;
    coeff_i[166] = 12'd1;
    coeff_i[167] = 12'd0;
    coeff_i[168] = 12'd0;
    coeff_i[169] = 12'd3328;
    coeff_i[170] = 12'd1;
    coeff_i[171] = 12'd1;
    coeff_i[172] = 12'd2;
    coeff_i[173] = 12'd3328;
    coeff_i[174] = 12'd3328;
    coeff_i[175] = 12'd0;
    coeff_i[176] = 12'd0;
    coeff_i[177] = 12'd3327;
    coeff_i[178] = 12'd2;
    coeff_i[179] = 12'd3328;
    coeff_i[180] = 12'd0;
    coeff_i[181] = 12'd3328;
    coeff_i[182] = 12'd3328;
    coeff_i[183] = 12'd3328;
    coeff_i[184] = 12'd3328;
    coeff_i[185] = 12'd0;
    coeff_i[186] = 12'd3328;
    coeff_i[187] = 12'd3327;
    coeff_i[188] = 12'd3328;
    coeff_i[189] = 12'd0;
    coeff_i[190] = 12'd3328;
    coeff_i[191] = 12'd3327;
    coeff_i[192] = 12'd3328;
    coeff_i[193] = 12'd3327;
    coeff_i[194] = 12'd1;
    coeff_i[195] = 12'd3328;
    coeff_i[196] = 12'd0;
    coeff_i[197] = 12'd0;
    coeff_i[198] = 12'd3328;
    coeff_i[199] = 12'd0;
    coeff_i[200] = 12'd3327;
    coeff_i[201] = 12'd2;
    coeff_i[202] = 12'd3;
    coeff_i[203] = 12'd3326;
    coeff_i[204] = 12'd0;
    coeff_i[205] = 12'd3327;
    coeff_i[206] = 12'd0;
    coeff_i[207] = 12'd0;
    coeff_i[208] = 12'd0;
    coeff_i[209] = 12'd3328;
    coeff_i[210] = 12'd1;
    coeff_i[211] = 12'd0;
    coeff_i[212] = 12'd3328;
    coeff_i[213] = 12'd3326;
    coeff_i[214] = 12'd3328;
    coeff_i[215] = 12'd2;
    coeff_i[216] = 12'd3328;
    coeff_i[217] = 12'd3327;
    coeff_i[218] = 12'd0;
    coeff_i[219] = 12'd0;
    coeff_i[220] = 12'd2;
    coeff_i[221] = 12'd0;
    coeff_i[222] = 12'd1;
    coeff_i[223] = 12'd1;
    coeff_i[224] = 12'd3328;
    coeff_i[225] = 12'd3328;
    coeff_i[226] = 12'd3328;
    coeff_i[227] = 12'd3328;
    coeff_i[228] = 12'd3328;
    coeff_i[229] = 12'd3328;
    coeff_i[230] = 12'd1;
    coeff_i[231] = 12'd1;
    coeff_i[232] = 12'd3328;
    coeff_i[233] = 12'd1;
    coeff_i[234] = 12'd2;
    coeff_i[235] = 12'd2;
    coeff_i[236] = 12'd2;
    coeff_i[237] = 12'd0;
    coeff_i[238] = 12'd0;
    coeff_i[239] = 12'd3328;
    coeff_i[240] = 12'd1;
    coeff_i[241] = 12'd0;
    coeff_i[242] = 12'd2;
    coeff_i[243] = 12'd3327;
    coeff_i[244] = 12'd1;
    coeff_i[245] = 12'd3328;
    coeff_i[246] = 12'd2;
    coeff_i[247] = 12'd3328;
    coeff_i[248] = 12'd3328;
    coeff_i[249] = 12'd3328;
    coeff_i[250] = 12'd3328;
    coeff_i[251] = 12'd2;
    coeff_i[252] = 12'd2;
    coeff_i[253] = 12'd3328;
    coeff_i[254] = 12'd3328;
    coeff_i[255] = 12'd0;
    start_i = 1;
    rst_ni = 1;
    #10;

    while (!done_o) begin
      #10;
    end

    for (int i = 0; i < 256; i++) begin
      $display("coeff_o[%3d] = %4d", i, coeff_o[i]);
    end
    $display("TONG SO CHU KY THUC HIEN: %0t CCs", $time/10/128);
    
   $finish;
  end


endmodule