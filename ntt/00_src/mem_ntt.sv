`define FILE_PATH "../00_src/raw_ntt_coeff.hex"

module mem_ntt (
  //input  logic [6:0]  col_i,
  input  logic [6:0]  row_i,
  output logic [11:0] data_o [0:127]
);

  logic [11:0] memory [0:16383];

  initial begin
    memory = '{16384{12'h000}};
    $readmemh(`FILE_PATH, memory);
  end

  assign data_o[  0] = memory[row_i +     0];
  assign data_o[  1] = memory[row_i +   128];
  assign data_o[  2] = memory[row_i +   256];
  assign data_o[  3] = memory[row_i +   384];
  assign data_o[  4] = memory[row_i +   512];
  assign data_o[  5] = memory[row_i +   640];
  assign data_o[  6] = memory[row_i +   768];
  assign data_o[  7] = memory[row_i +   896];
  assign data_o[  8] = memory[row_i +  1024];
  assign data_o[  9] = memory[row_i +  1152];
  assign data_o[ 10] = memory[row_i +  1280];
  assign data_o[ 11] = memory[row_i +  1408];
  assign data_o[ 12] = memory[row_i +  1536];
  assign data_o[ 13] = memory[row_i +  1664];
  assign data_o[ 14] = memory[row_i +  1792];
  assign data_o[ 15] = memory[row_i +  1920];
  assign data_o[ 16] = memory[row_i +  2048];
  assign data_o[ 17] = memory[row_i +  2176];
  assign data_o[ 18] = memory[row_i +  2304];
  assign data_o[ 19] = memory[row_i +  2432];
  assign data_o[ 20] = memory[row_i +  2560];
  assign data_o[ 21] = memory[row_i +  2688];
  assign data_o[ 22] = memory[row_i +  2816];
  assign data_o[ 23] = memory[row_i +  2944];
  assign data_o[ 24] = memory[row_i +  3072];
  assign data_o[ 25] = memory[row_i +  3200];
  assign data_o[ 26] = memory[row_i +  3328];
  assign data_o[ 27] = memory[row_i +  3456];
  assign data_o[ 28] = memory[row_i +  3584];
  assign data_o[ 29] = memory[row_i +  3712];
  assign data_o[ 30] = memory[row_i +  3840];
  assign data_o[ 31] = memory[row_i +  3968];
  assign data_o[ 32] = memory[row_i +  4096];
  assign data_o[ 33] = memory[row_i +  4224];
  assign data_o[ 34] = memory[row_i +  4352];
  assign data_o[ 35] = memory[row_i +  4480];
  assign data_o[ 36] = memory[row_i +  4608];
  assign data_o[ 37] = memory[row_i +  4736];
  assign data_o[ 38] = memory[row_i +  4864];
  assign data_o[ 39] = memory[row_i +  4992];
  assign data_o[ 40] = memory[row_i +  5120];
  assign data_o[ 41] = memory[row_i +  5248];
  assign data_o[ 42] = memory[row_i +  5376];
  assign data_o[ 43] = memory[row_i +  5504];
  assign data_o[ 44] = memory[row_i +  5632];
  assign data_o[ 45] = memory[row_i +  5760];
  assign data_o[ 46] = memory[row_i +  5888];
  assign data_o[ 47] = memory[row_i +  6016];
  assign data_o[ 48] = memory[row_i +  6144];
  assign data_o[ 49] = memory[row_i +  6272];
  assign data_o[ 50] = memory[row_i +  6400];
  assign data_o[ 51] = memory[row_i +  6528];
  assign data_o[ 52] = memory[row_i +  6656];
  assign data_o[ 53] = memory[row_i +  6784];
  assign data_o[ 54] = memory[row_i +  6912];
  assign data_o[ 55] = memory[row_i +  7040];
  assign data_o[ 56] = memory[row_i +  7168];
  assign data_o[ 57] = memory[row_i +  7296];
  assign data_o[ 58] = memory[row_i +  7424];
  assign data_o[ 59] = memory[row_i +  7552];
  assign data_o[ 60] = memory[row_i +  7680];
  assign data_o[ 61] = memory[row_i +  7808];
  assign data_o[ 62] = memory[row_i +  7936];
  assign data_o[ 63] = memory[row_i +  8064];
  assign data_o[ 64] = memory[row_i +  8192];
  assign data_o[ 65] = memory[row_i +  8320];
  assign data_o[ 66] = memory[row_i +  8448];
  assign data_o[ 67] = memory[row_i +  8576];
  assign data_o[ 68] = memory[row_i +  8704];
  assign data_o[ 69] = memory[row_i +  8832];
  assign data_o[ 70] = memory[row_i +  8960];
  assign data_o[ 71] = memory[row_i +  9088];
  assign data_o[ 72] = memory[row_i +  9216];
  assign data_o[ 73] = memory[row_i +  9344];
  assign data_o[ 74] = memory[row_i +  9472];
  assign data_o[ 75] = memory[row_i +  9600];
  assign data_o[ 76] = memory[row_i +  9728];
  assign data_o[ 77] = memory[row_i +  9856];
  assign data_o[ 78] = memory[row_i +  9984];
  assign data_o[ 79] = memory[row_i + 10112];
  assign data_o[ 80] = memory[row_i + 10240];
  assign data_o[ 81] = memory[row_i + 10368];
  assign data_o[ 82] = memory[row_i + 10496];
  assign data_o[ 83] = memory[row_i + 10624];
  assign data_o[ 84] = memory[row_i + 10752];
  assign data_o[ 85] = memory[row_i + 10880];
  assign data_o[ 86] = memory[row_i + 11008];
  assign data_o[ 87] = memory[row_i + 11136];
  assign data_o[ 88] = memory[row_i + 11264];
  assign data_o[ 89] = memory[row_i + 11392];
  assign data_o[ 90] = memory[row_i + 11520];
  assign data_o[ 91] = memory[row_i + 11648];
  assign data_o[ 92] = memory[row_i + 11776];
  assign data_o[ 93] = memory[row_i + 11904];
  assign data_o[ 94] = memory[row_i + 12032];
  assign data_o[ 95] = memory[row_i + 12160];
  assign data_o[ 96] = memory[row_i + 12288];
  assign data_o[ 97] = memory[row_i + 12416];
  assign data_o[ 98] = memory[row_i + 12544];
  assign data_o[ 99] = memory[row_i + 12672];
  assign data_o[100] = memory[row_i + 12800];
  assign data_o[101] = memory[row_i + 12928];
  assign data_o[102] = memory[row_i + 13056];
  assign data_o[103] = memory[row_i + 13184];
  assign data_o[104] = memory[row_i + 13312];
  assign data_o[105] = memory[row_i + 13440];
  assign data_o[106] = memory[row_i + 13568];
  assign data_o[107] = memory[row_i + 13696];
  assign data_o[108] = memory[row_i + 13824];
  assign data_o[109] = memory[row_i + 13952];
  assign data_o[110] = memory[row_i + 14080];
  assign data_o[111] = memory[row_i + 14208];
  assign data_o[112] = memory[row_i + 14336];
  assign data_o[113] = memory[row_i + 14464];
  assign data_o[114] = memory[row_i + 14592];
  assign data_o[115] = memory[row_i + 14720];
  assign data_o[116] = memory[row_i + 14848];
  assign data_o[117] = memory[row_i + 14976];
  assign data_o[118] = memory[row_i + 15104];
  assign data_o[119] = memory[row_i + 15232];
  assign data_o[120] = memory[row_i + 15360];
  assign data_o[121] = memory[row_i + 15488];
  assign data_o[122] = memory[row_i + 15616];
  assign data_o[123] = memory[row_i + 15744];
  assign data_o[124] = memory[row_i + 15872];
  assign data_o[125] = memory[row_i + 16000];
  assign data_o[126] = memory[row_i + 16128];
  assign data_o[127] = memory[row_i + 16256];

endmodule

/*
# script to generate rtl-code with python

for i in range(128):
    print(f"  assign data_o[{i:3d}] = memory[row_i + {128*i:5d}];")
    
*/