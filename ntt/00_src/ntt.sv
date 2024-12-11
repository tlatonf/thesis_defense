module ntt (
  input  logic        clk_i,
  input  logic        rst_ni,
  input  logic        start_i,
  output logic        done_o,

  input  logic [11:0] coeff_i [0:255],
  output logic [11:0] coeff_o [0:255]
);

  logic [6:0] index;

  // Memory
  logic [6:0]   mem_addr;
  logic [11:0]  mem_vector [0:127];
  mem_ntt memory (
    .row_i  (mem_addr   ),
    .data_o (mem_vector )
  );

  // CDOT
  logic cdot_start, cdot_done;
  logic cdot0_clk, cdot0_done;
  logic cdot1_clk, cdot1_done;
  logic [11:0] cdot0_a [0:127], cdot0_b [0:127], cdot0_result;
  logic [11:0] cdot1_a [0:127], cdot1_b [0:127], cdot1_result;
  always @(clk_i) begin
    cdot0_clk <= clk_i;
    cdot1_clk <= clk_i;
  end

  cdot cdot0 (
    .clk_i    (cdot0_clk   ),
    .rst_ni   (rst_ni      ),
    .start_i  (cdot_start  ),
    .done_o   (cdot0_done  ),
    .a_i      (cdot0_a     ),
    .b_i      (mem_vector  ),
    .p_o      (cdot0_result)
  );

  cdot cdot1 (
    .clk_i    (cdot1_clk   ),
    .rst_ni   (rst_ni       ),
    .start_i  (cdot_start   ),
    .done_o   (cdot1_done  ),
    .a_i      (cdot1_a     ),
    .b_i      (mem_vector  ),
    .p_o      (cdot1_result)
  );
  assign cdot_done = cdot0_done && cdot1_done;

  // FSM
  parameter IDLE = 2'b00, ADDR_GEN = 2'b01, NTT = 2'b10, DONE = 2'b11;
  logic [1:0] state, next_state;
  always_ff @(posedge clk_i or negedge rst_ni) begin
    if (!rst_ni) begin
      state <= IDLE;
    end else begin
      state <= next_state;
    end
  end

  always @(state or cdot_done or index) begin
    case (state)
      IDLE: begin
        if (!start_i) begin
          next_state = IDLE;
        end else begin
          next_state = ADDR_GEN;
        end
      end

      ADDR_GEN: begin
        if (!start_i) begin
          next_state = IDLE;
        end else begin
          next_state = NTT;
        end
      end

      NTT: begin
        if (!start_i) begin
          next_state = IDLE;
        end else if (cdot_done == 1'b1) begin
          next_state = (index == 127) ? DONE : ADDR_GEN;
        end else begin
          next_state = NTT;
        end
      end

      DONE: begin
        if (!start_i) begin
          next_state = IDLE;
        end else begin
          next_state = DONE;
        end
      end

      default: begin
        next_state = IDLE;
      end
    endcase
  end

  always_ff @(posedge clk_i or negedge rst_ni) begin
    if (!rst_ni) begin
      index   <= 8'd0;
      coeff_o <= '{default: 12'd0};
      done_o  <= 1'b0;

    end else begin
      case (state)
        IDLE: begin
          index   <= 8'd0;
          coeff_o <= '{default: 12'd0};
          done_o  <= 1'b0;
        end

        ADDR_GEN: begin
          mem_addr   <= index;
          cdot_start <= 1'b1;
        end

        NTT: begin
          if (cdot_done == 1'b1) begin
            coeff_o[2*index    ] <= cdot0_result;
            coeff_o[2*index + 1] <= cdot1_result;
            index <= index + 1;

            cdot_start <= 1'b0;
          end
        end

        DONE: begin
          done_o <= 1'b1;
        end

        default: begin
          // Do nothing
        end
      endcase
    end

  end

  assign cdot0_a[  0] = coeff_i[  0];
  assign cdot0_a[  1] = coeff_i[  2];
  assign cdot0_a[  2] = coeff_i[  4];
  assign cdot0_a[  3] = coeff_i[  6];
  assign cdot0_a[  4] = coeff_i[  8];
  assign cdot0_a[  5] = coeff_i[ 10];
  assign cdot0_a[  6] = coeff_i[ 12];
  assign cdot0_a[  7] = coeff_i[ 14];
  assign cdot0_a[  8] = coeff_i[ 16];
  assign cdot0_a[  9] = coeff_i[ 18];
  assign cdot0_a[ 10] = coeff_i[ 20];
  assign cdot0_a[ 11] = coeff_i[ 22];
  assign cdot0_a[ 12] = coeff_i[ 24];
  assign cdot0_a[ 13] = coeff_i[ 26];
  assign cdot0_a[ 14] = coeff_i[ 28];
  assign cdot0_a[ 15] = coeff_i[ 30];
  assign cdot0_a[ 16] = coeff_i[ 32];
  assign cdot0_a[ 17] = coeff_i[ 34];
  assign cdot0_a[ 18] = coeff_i[ 36];
  assign cdot0_a[ 19] = coeff_i[ 38];
  assign cdot0_a[ 20] = coeff_i[ 40];
  assign cdot0_a[ 21] = coeff_i[ 42];
  assign cdot0_a[ 22] = coeff_i[ 44];
  assign cdot0_a[ 23] = coeff_i[ 46];
  assign cdot0_a[ 24] = coeff_i[ 48];
  assign cdot0_a[ 25] = coeff_i[ 50];
  assign cdot0_a[ 26] = coeff_i[ 52];
  assign cdot0_a[ 27] = coeff_i[ 54];
  assign cdot0_a[ 28] = coeff_i[ 56];
  assign cdot0_a[ 29] = coeff_i[ 58];
  assign cdot0_a[ 30] = coeff_i[ 60];
  assign cdot0_a[ 31] = coeff_i[ 62];
  assign cdot0_a[ 32] = coeff_i[ 64];
  assign cdot0_a[ 33] = coeff_i[ 66];
  assign cdot0_a[ 34] = coeff_i[ 68];
  assign cdot0_a[ 35] = coeff_i[ 70];
  assign cdot0_a[ 36] = coeff_i[ 72];
  assign cdot0_a[ 37] = coeff_i[ 74];
  assign cdot0_a[ 38] = coeff_i[ 76];
  assign cdot0_a[ 39] = coeff_i[ 78];
  assign cdot0_a[ 40] = coeff_i[ 80];
  assign cdot0_a[ 41] = coeff_i[ 82];
  assign cdot0_a[ 42] = coeff_i[ 84];
  assign cdot0_a[ 43] = coeff_i[ 86];
  assign cdot0_a[ 44] = coeff_i[ 88];
  assign cdot0_a[ 45] = coeff_i[ 90];
  assign cdot0_a[ 46] = coeff_i[ 92];
  assign cdot0_a[ 47] = coeff_i[ 94];
  assign cdot0_a[ 48] = coeff_i[ 96];
  assign cdot0_a[ 49] = coeff_i[ 98];
  assign cdot0_a[ 50] = coeff_i[100];
  assign cdot0_a[ 51] = coeff_i[102];
  assign cdot0_a[ 52] = coeff_i[104];
  assign cdot0_a[ 53] = coeff_i[106];
  assign cdot0_a[ 54] = coeff_i[108];
  assign cdot0_a[ 55] = coeff_i[110];
  assign cdot0_a[ 56] = coeff_i[112];
  assign cdot0_a[ 57] = coeff_i[114];
  assign cdot0_a[ 58] = coeff_i[116];
  assign cdot0_a[ 59] = coeff_i[118];
  assign cdot0_a[ 60] = coeff_i[120];
  assign cdot0_a[ 61] = coeff_i[122];
  assign cdot0_a[ 62] = coeff_i[124];
  assign cdot0_a[ 63] = coeff_i[126];
  assign cdot0_a[ 64] = coeff_i[128];
  assign cdot0_a[ 65] = coeff_i[130];
  assign cdot0_a[ 66] = coeff_i[132];
  assign cdot0_a[ 67] = coeff_i[134];
  assign cdot0_a[ 68] = coeff_i[136];
  assign cdot0_a[ 69] = coeff_i[138];
  assign cdot0_a[ 70] = coeff_i[140];
  assign cdot0_a[ 71] = coeff_i[142];
  assign cdot0_a[ 72] = coeff_i[144];
  assign cdot0_a[ 73] = coeff_i[146];
  assign cdot0_a[ 74] = coeff_i[148];
  assign cdot0_a[ 75] = coeff_i[150];
  assign cdot0_a[ 76] = coeff_i[152];
  assign cdot0_a[ 77] = coeff_i[154];
  assign cdot0_a[ 78] = coeff_i[156];
  assign cdot0_a[ 79] = coeff_i[158];
  assign cdot0_a[ 80] = coeff_i[160];
  assign cdot0_a[ 81] = coeff_i[162];
  assign cdot0_a[ 82] = coeff_i[164];
  assign cdot0_a[ 83] = coeff_i[166];
  assign cdot0_a[ 84] = coeff_i[168];
  assign cdot0_a[ 85] = coeff_i[170];
  assign cdot0_a[ 86] = coeff_i[172];
  assign cdot0_a[ 87] = coeff_i[174];
  assign cdot0_a[ 88] = coeff_i[176];
  assign cdot0_a[ 89] = coeff_i[178];
  assign cdot0_a[ 90] = coeff_i[180];
  assign cdot0_a[ 91] = coeff_i[182];
  assign cdot0_a[ 92] = coeff_i[184];
  assign cdot0_a[ 93] = coeff_i[186];
  assign cdot0_a[ 94] = coeff_i[188];
  assign cdot0_a[ 95] = coeff_i[190];
  assign cdot0_a[ 96] = coeff_i[192];
  assign cdot0_a[ 97] = coeff_i[194];
  assign cdot0_a[ 98] = coeff_i[196];
  assign cdot0_a[ 99] = coeff_i[198];
  assign cdot0_a[100] = coeff_i[200];
  assign cdot0_a[101] = coeff_i[202];
  assign cdot0_a[102] = coeff_i[204];
  assign cdot0_a[103] = coeff_i[206];
  assign cdot0_a[104] = coeff_i[208];
  assign cdot0_a[105] = coeff_i[210];
  assign cdot0_a[106] = coeff_i[212];
  assign cdot0_a[107] = coeff_i[214];
  assign cdot0_a[108] = coeff_i[216];
  assign cdot0_a[109] = coeff_i[218];
  assign cdot0_a[110] = coeff_i[220];
  assign cdot0_a[111] = coeff_i[222];
  assign cdot0_a[112] = coeff_i[224];
  assign cdot0_a[113] = coeff_i[226];
  assign cdot0_a[114] = coeff_i[228];
  assign cdot0_a[115] = coeff_i[230];
  assign cdot0_a[116] = coeff_i[232];
  assign cdot0_a[117] = coeff_i[234];
  assign cdot0_a[118] = coeff_i[236];
  assign cdot0_a[119] = coeff_i[238];
  assign cdot0_a[120] = coeff_i[240];
  assign cdot0_a[121] = coeff_i[242];
  assign cdot0_a[122] = coeff_i[244];
  assign cdot0_a[123] = coeff_i[246];
  assign cdot0_a[124] = coeff_i[248];
  assign cdot0_a[125] = coeff_i[250];
  assign cdot0_a[126] = coeff_i[252];
  assign cdot0_a[127] = coeff_i[254];

  assign cdot1_a[  0] = coeff_i[  1];
  assign cdot1_a[  1] = coeff_i[  3];
  assign cdot1_a[  2] = coeff_i[  5];
  assign cdot1_a[  3] = coeff_i[  7];
  assign cdot1_a[  4] = coeff_i[  9];
  assign cdot1_a[  5] = coeff_i[ 11];
  assign cdot1_a[  6] = coeff_i[ 13];
  assign cdot1_a[  7] = coeff_i[ 15];
  assign cdot1_a[  8] = coeff_i[ 17];
  assign cdot1_a[  9] = coeff_i[ 19];
  assign cdot1_a[ 10] = coeff_i[ 21];
  assign cdot1_a[ 11] = coeff_i[ 23];
  assign cdot1_a[ 12] = coeff_i[ 25];
  assign cdot1_a[ 13] = coeff_i[ 27];
  assign cdot1_a[ 14] = coeff_i[ 29];
  assign cdot1_a[ 15] = coeff_i[ 31];
  assign cdot1_a[ 16] = coeff_i[ 33];
  assign cdot1_a[ 17] = coeff_i[ 35];
  assign cdot1_a[ 18] = coeff_i[ 37];
  assign cdot1_a[ 19] = coeff_i[ 39];
  assign cdot1_a[ 20] = coeff_i[ 41];
  assign cdot1_a[ 21] = coeff_i[ 43];
  assign cdot1_a[ 22] = coeff_i[ 45];
  assign cdot1_a[ 23] = coeff_i[ 47];
  assign cdot1_a[ 24] = coeff_i[ 49];
  assign cdot1_a[ 25] = coeff_i[ 51];
  assign cdot1_a[ 26] = coeff_i[ 53];
  assign cdot1_a[ 27] = coeff_i[ 55];
  assign cdot1_a[ 28] = coeff_i[ 57];
  assign cdot1_a[ 29] = coeff_i[ 59];
  assign cdot1_a[ 30] = coeff_i[ 61];
  assign cdot1_a[ 31] = coeff_i[ 63];
  assign cdot1_a[ 32] = coeff_i[ 65];
  assign cdot1_a[ 33] = coeff_i[ 67];
  assign cdot1_a[ 34] = coeff_i[ 69];
  assign cdot1_a[ 35] = coeff_i[ 71];
  assign cdot1_a[ 36] = coeff_i[ 73];
  assign cdot1_a[ 37] = coeff_i[ 75];
  assign cdot1_a[ 38] = coeff_i[ 77];
  assign cdot1_a[ 39] = coeff_i[ 79];
  assign cdot1_a[ 40] = coeff_i[ 81];
  assign cdot1_a[ 41] = coeff_i[ 83];
  assign cdot1_a[ 42] = coeff_i[ 85];
  assign cdot1_a[ 43] = coeff_i[ 87];
  assign cdot1_a[ 44] = coeff_i[ 89];
  assign cdot1_a[ 45] = coeff_i[ 91];
  assign cdot1_a[ 46] = coeff_i[ 93];
  assign cdot1_a[ 47] = coeff_i[ 95];
  assign cdot1_a[ 48] = coeff_i[ 97];
  assign cdot1_a[ 49] = coeff_i[ 99];
  assign cdot1_a[ 50] = coeff_i[101];
  assign cdot1_a[ 51] = coeff_i[103];
  assign cdot1_a[ 52] = coeff_i[105];
  assign cdot1_a[ 53] = coeff_i[107];
  assign cdot1_a[ 54] = coeff_i[109];
  assign cdot1_a[ 55] = coeff_i[111];
  assign cdot1_a[ 56] = coeff_i[113];
  assign cdot1_a[ 57] = coeff_i[115];
  assign cdot1_a[ 58] = coeff_i[117];
  assign cdot1_a[ 59] = coeff_i[119];
  assign cdot1_a[ 60] = coeff_i[121];
  assign cdot1_a[ 61] = coeff_i[123];
  assign cdot1_a[ 62] = coeff_i[125];
  assign cdot1_a[ 63] = coeff_i[127];
  assign cdot1_a[ 64] = coeff_i[129];
  assign cdot1_a[ 65] = coeff_i[131];
  assign cdot1_a[ 66] = coeff_i[133];
  assign cdot1_a[ 67] = coeff_i[135];
  assign cdot1_a[ 68] = coeff_i[137];
  assign cdot1_a[ 69] = coeff_i[139];
  assign cdot1_a[ 70] = coeff_i[141];
  assign cdot1_a[ 71] = coeff_i[143];
  assign cdot1_a[ 72] = coeff_i[145];
  assign cdot1_a[ 73] = coeff_i[147];
  assign cdot1_a[ 74] = coeff_i[149];
  assign cdot1_a[ 75] = coeff_i[151];
  assign cdot1_a[ 76] = coeff_i[153];
  assign cdot1_a[ 77] = coeff_i[155];
  assign cdot1_a[ 78] = coeff_i[157];
  assign cdot1_a[ 79] = coeff_i[159];
  assign cdot1_a[ 80] = coeff_i[161];
  assign cdot1_a[ 81] = coeff_i[163];
  assign cdot1_a[ 82] = coeff_i[165];
  assign cdot1_a[ 83] = coeff_i[167];
  assign cdot1_a[ 84] = coeff_i[169];
  assign cdot1_a[ 85] = coeff_i[171];
  assign cdot1_a[ 86] = coeff_i[173];
  assign cdot1_a[ 87] = coeff_i[175];
  assign cdot1_a[ 88] = coeff_i[177];
  assign cdot1_a[ 89] = coeff_i[179];
  assign cdot1_a[ 90] = coeff_i[181];
  assign cdot1_a[ 91] = coeff_i[183];
  assign cdot1_a[ 92] = coeff_i[185];
  assign cdot1_a[ 93] = coeff_i[187];
  assign cdot1_a[ 94] = coeff_i[189];
  assign cdot1_a[ 95] = coeff_i[191];
  assign cdot1_a[ 96] = coeff_i[193];
  assign cdot1_a[ 97] = coeff_i[195];
  assign cdot1_a[ 98] = coeff_i[197];
  assign cdot1_a[ 99] = coeff_i[199];
  assign cdot1_a[100] = coeff_i[201];
  assign cdot1_a[101] = coeff_i[203];
  assign cdot1_a[102] = coeff_i[205];
  assign cdot1_a[103] = coeff_i[207];
  assign cdot1_a[104] = coeff_i[209];
  assign cdot1_a[105] = coeff_i[211];
  assign cdot1_a[106] = coeff_i[213];
  assign cdot1_a[107] = coeff_i[215];
  assign cdot1_a[108] = coeff_i[217];
  assign cdot1_a[109] = coeff_i[219];
  assign cdot1_a[110] = coeff_i[221];
  assign cdot1_a[111] = coeff_i[223];
  assign cdot1_a[112] = coeff_i[225];
  assign cdot1_a[113] = coeff_i[227];
  assign cdot1_a[114] = coeff_i[229];
  assign cdot1_a[115] = coeff_i[231];
  assign cdot1_a[116] = coeff_i[233];
  assign cdot1_a[117] = coeff_i[235];
  assign cdot1_a[118] = coeff_i[237];
  assign cdot1_a[119] = coeff_i[239];
  assign cdot1_a[120] = coeff_i[241];
  assign cdot1_a[121] = coeff_i[243];
  assign cdot1_a[122] = coeff_i[245];
  assign cdot1_a[123] = coeff_i[247];
  assign cdot1_a[124] = coeff_i[249];
  assign cdot1_a[125] = coeff_i[251];
  assign cdot1_a[126] = coeff_i[253];
  assign cdot1_a[127] = coeff_i[255];
  
endmodule