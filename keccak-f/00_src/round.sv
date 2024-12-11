module round(
  input  logic [0:5]  ir_i,
  input  logic [0:`B_WIDTH-1] state_i,
  output logic [0:`B_WIDTH-1] state_o
);

  logic [0:`W_WIDTH-1] init       [0:4][0:4];
  logic [0:`W_WIDTH-1] pre_theta  [0:4];
  logic [0:`W_WIDTH-1] theta      [0:4][0:4];
  logic [0:`W_WIDTH-1] pi         [0:4][0:4];
  logic [0:`W_WIDTH-1] chi        [0:4][0:4];
  logic [0:`W_WIDTH-1] iota       [0:4][0:4];

  // CONVERT_STRING_TO_MATRIX_FORM
  assign init[0][0] = state_i[   0:  63];
  assign init[1][0] = state_i[  64: 127];
  assign init[2][0] = state_i[ 128: 191];
  assign init[3][0] = state_i[ 192: 255];
  assign init[4][0] = state_i[ 256: 319];

  assign init[0][1] = state_i[ 320: 383];
  assign init[1][1] = state_i[ 384: 447];
  assign init[2][1] = state_i[ 448: 511];
  assign init[3][1] = state_i[ 512: 575];
  assign init[4][1] = state_i[ 576: 639];

  assign init[0][2] = state_i[ 640: 703];
  assign init[1][2] = state_i[ 704: 767];
  assign init[2][2] = state_i[ 768: 831];
  assign init[3][2] = state_i[ 832: 895];
  assign init[4][2] = state_i[ 896: 959];

  assign init[0][3] = state_i[ 960:1023];
  assign init[1][3] = state_i[1024:1087];
  assign init[2][3] = state_i[1088:1151];
  assign init[3][3] = state_i[1152:1215];
  assign init[4][3] = state_i[1216:1279];

  assign init[0][4] = state_i[1280:1343];
  assign init[1][4] = state_i[1344:1407];
  assign init[2][4] = state_i[1408:1471];
  assign init[3][4] = state_i[1472:1535];
  assign init[4][4] = state_i[1536:1599];


  // THETA_STEP
  assign pre_theta[0] = init[0][0] ^ init[0][1] ^ init[0][2] ^ init[0][3] ^ init[0][4];
  assign pre_theta[1] = init[1][0] ^ init[1][1] ^ init[1][2] ^ init[1][3] ^ init[1][4];
  assign pre_theta[2] = init[2][0] ^ init[2][1] ^ init[2][2] ^ init[2][3] ^ init[2][4];
  assign pre_theta[3] = init[3][0] ^ init[3][1] ^ init[3][2] ^ init[3][3] ^ init[3][4];
  assign pre_theta[4] = init[4][0] ^ init[4][1] ^ init[4][2] ^ init[4][3] ^ init[4][4];

  assign theta[0][0] = init[0][0] ^ pre_theta[4] ^ rot(pre_theta[1], 1);
  assign theta[1][0] = init[1][0] ^ pre_theta[0] ^ rot(pre_theta[2], 1);
  assign theta[2][0] = init[2][0] ^ pre_theta[1] ^ rot(pre_theta[3], 1);
  assign theta[3][0] = init[3][0] ^ pre_theta[2] ^ rot(pre_theta[4], 1);
  assign theta[4][0] = init[4][0] ^ pre_theta[3] ^ rot(pre_theta[0], 1);

  assign theta[0][1] = init[0][1] ^ pre_theta[4] ^ rot(pre_theta[1], 1);
  assign theta[1][1] = init[1][1] ^ pre_theta[0] ^ rot(pre_theta[2], 1);
  assign theta[2][1] = init[2][1] ^ pre_theta[1] ^ rot(pre_theta[3], 1);
  assign theta[3][1] = init[3][1] ^ pre_theta[2] ^ rot(pre_theta[4], 1);
  assign theta[4][1] = init[4][1] ^ pre_theta[3] ^ rot(pre_theta[0], 1);

  assign theta[0][2] = init[0][2] ^ pre_theta[4] ^ rot(pre_theta[1], 1);
  assign theta[1][2] = init[1][2] ^ pre_theta[0] ^ rot(pre_theta[2], 1);
  assign theta[2][2] = init[2][2] ^ pre_theta[1] ^ rot(pre_theta[3], 1);
  assign theta[3][2] = init[3][2] ^ pre_theta[2] ^ rot(pre_theta[4], 1);
  assign theta[4][2] = init[4][2] ^ pre_theta[3] ^ rot(pre_theta[0], 1);

  assign theta[0][3] = init[0][3] ^ pre_theta[4] ^ rot(pre_theta[1], 1);
  assign theta[1][3] = init[1][3] ^ pre_theta[0] ^ rot(pre_theta[2], 1);
  assign theta[2][3] = init[2][3] ^ pre_theta[1] ^ rot(pre_theta[3], 1);
  assign theta[3][3] = init[3][3] ^ pre_theta[2] ^ rot(pre_theta[4], 1);
  assign theta[4][3] = init[4][3] ^ pre_theta[3] ^ rot(pre_theta[0], 1);

  assign theta[0][4] = init[0][4] ^ pre_theta[4] ^ rot(pre_theta[1], 1);
  assign theta[1][4] = init[1][4] ^ pre_theta[0] ^ rot(pre_theta[2], 1);
  assign theta[2][4] = init[2][4] ^ pre_theta[1] ^ rot(pre_theta[3], 1);
  assign theta[3][4] = init[3][4] ^ pre_theta[2] ^ rot(pre_theta[4], 1);
  assign theta[4][4] = init[4][4] ^ pre_theta[3] ^ rot(pre_theta[0], 1);


  // RHO_PI_STEP
  assign pi[0][0] = rot(theta[0][0],  0);
  assign pi[0][2] = rot(theta[1][0],  1);
  assign pi[0][4] = rot(theta[2][0], 62);
  assign pi[0][1] = rot(theta[3][0], 28);
  assign pi[0][3] = rot(theta[4][0], 27);

  assign pi[1][3] = rot(theta[0][1], 36);
  assign pi[1][0] = rot(theta[1][1], 44);
  assign pi[1][2] = rot(theta[2][1],  6);
  assign pi[1][4] = rot(theta[3][1], 55);
  assign pi[1][1] = rot(theta[4][1], 20);

  assign pi[2][1] = rot(theta[0][2],  3);
  assign pi[2][3] = rot(theta[1][2], 10);
  assign pi[2][0] = rot(theta[2][2], 43);
  assign pi[2][2] = rot(theta[3][2], 25);
  assign pi[2][4] = rot(theta[4][2], 39);

  assign pi[3][4] = rot(theta[0][3], 41);
  assign pi[3][1] = rot(theta[1][3], 45);
  assign pi[3][3] = rot(theta[2][3], 15);
  assign pi[3][0] = rot(theta[3][3], 21);
  assign pi[3][2] = rot(theta[4][3],  8);

  assign pi[4][2] = rot(theta[0][4], 18);
  assign pi[4][4] = rot(theta[1][4],  2);
  assign pi[4][1] = rot(theta[2][4], 61);
  assign pi[4][3] = rot(theta[3][4], 56);
  assign pi[4][0] = rot(theta[4][4], 14);


  // CHI_STEP
  assign chi[0][0] = pi[0][0] ^ ((~pi[1][0]) & pi[2][0]);
  assign chi[1][0] = pi[1][0] ^ ((~pi[2][0]) & pi[3][0]);
  assign chi[2][0] = pi[2][0] ^ ((~pi[3][0]) & pi[4][0]);
  assign chi[3][0] = pi[3][0] ^ ((~pi[4][0]) & pi[0][0]);
  assign chi[4][0] = pi[4][0] ^ ((~pi[0][0]) & pi[1][0]);

  assign chi[0][1] = pi[0][1] ^ ((~pi[1][1]) & pi[2][1]);
  assign chi[1][1] = pi[1][1] ^ ((~pi[2][1]) & pi[3][1]);
  assign chi[2][1] = pi[2][1] ^ ((~pi[3][1]) & pi[4][1]);
  assign chi[3][1] = pi[3][1] ^ ((~pi[4][1]) & pi[0][1]);
  assign chi[4][1] = pi[4][1] ^ ((~pi[0][1]) & pi[1][1]);

  assign chi[0][2] = pi[0][2] ^ ((~pi[1][2]) & pi[2][2]);
  assign chi[1][2] = pi[1][2] ^ ((~pi[2][2]) & pi[3][2]);
  assign chi[2][2] = pi[2][2] ^ ((~pi[3][2]) & pi[4][2]);
  assign chi[3][2] = pi[3][2] ^ ((~pi[4][2]) & pi[0][2]);
  assign chi[4][2] = pi[4][2] ^ ((~pi[0][2]) & pi[1][2]);

  assign chi[0][3] = pi[0][3] ^ ((~pi[1][3]) & pi[2][3]);
  assign chi[1][3] = pi[1][3] ^ ((~pi[2][3]) & pi[3][3]);
  assign chi[2][3] = pi[2][3] ^ ((~pi[3][3]) & pi[4][3]);
  assign chi[3][3] = pi[3][3] ^ ((~pi[4][3]) & pi[0][3]);
  assign chi[4][3] = pi[4][3] ^ ((~pi[0][3]) & pi[1][3]);

  assign chi[0][4] = pi[0][4] ^ ((~pi[1][4]) & pi[2][4]);
  assign chi[1][4] = pi[1][4] ^ ((~pi[2][4]) & pi[3][4]);
  assign chi[2][4] = pi[2][4] ^ ((~pi[3][4]) & pi[4][4]);
  assign chi[3][4] = pi[3][4] ^ ((~pi[4][4]) & pi[0][4]);
  assign chi[4][4] = pi[4][4] ^ ((~pi[0][4]) & pi[1][4]);


  // IOTA_STEP
  assign iota[0][0] = chi[0][0] ^ get_rc(ir_i);
  assign iota[1][0] = chi[1][0];
  assign iota[2][0] = chi[2][0];
  assign iota[3][0] = chi[3][0];
  assign iota[4][0] = chi[4][0];

  assign iota[0][1] = chi[0][1];
  assign iota[1][1] = chi[1][1];
  assign iota[2][1] = chi[2][1];
  assign iota[3][1] = chi[3][1];
  assign iota[4][1] = chi[4][1];

  assign iota[0][2] = chi[0][2];
  assign iota[1][2] = chi[1][2];
  assign iota[2][2] = chi[2][2];
  assign iota[3][2] = chi[3][2];
  assign iota[4][2] = chi[4][2];

  assign iota[0][3] = chi[0][3];
  assign iota[1][3] = chi[1][3];
  assign iota[2][3] = chi[2][3];
  assign iota[3][3] = chi[3][3];
  assign iota[4][3] = chi[4][3];

  assign iota[0][4] = chi[0][4];
  assign iota[1][4] = chi[1][4];
  assign iota[2][4] = chi[2][4];
  assign iota[3][4] = chi[3][4];
  assign iota[4][4] = chi[4][4];


  // CONVERT_MATRIX_TO_STRING_FORM
  assign state_o[   0:  63] = iota[0][0];
  assign state_o[  64: 127] = iota[1][0];
  assign state_o[ 128: 191] = iota[2][0];
  assign state_o[ 192: 255] = iota[3][0];
  assign state_o[ 256: 319] = iota[4][0];

  assign state_o[ 320: 383] = iota[0][1];
  assign state_o[ 384: 447] = iota[1][1];
  assign state_o[ 448: 511] = iota[2][1];
  assign state_o[ 512: 575] = iota[3][1];
  assign state_o[ 576: 639] = iota[4][1];

  assign state_o[ 640: 703] = iota[0][2];
  assign state_o[ 704: 767] = iota[1][2];
  assign state_o[ 768: 831] = iota[2][2];
  assign state_o[ 832: 895] = iota[3][2];
  assign state_o[ 896: 959] = iota[4][2];

  assign state_o[ 960:1023] = iota[0][3];
  assign state_o[1024:1087] = iota[1][3];
  assign state_o[1088:1151] = iota[2][3];
  assign state_o[1152:1215] = iota[3][3];
  assign state_o[1216:1279] = iota[4][3];

  assign state_o[1280:1343] = iota[0][4];
  assign state_o[1344:1407] = iota[1][4];
  assign state_o[1408:1471] = iota[2][4];
  assign state_o[1472:1535] = iota[3][4];
  assign state_o[1536:1599] = iota[4][4];

endmodule

/*
# script to generate rtl-code with python

table = {
    (3, 2): 153, (4, 2): 231, (0, 2): 3,   (1, 2): 10,  (2, 2): 171,
    (3, 1): 55,  (4, 1): 276, (0, 1): 36,  (1, 1): 300, (2, 1): 6,
    (3, 0): 28,  (4, 0): 91,  (0, 0): 0,   (1, 0): 1,   (2, 0): 190,
    (3, 4): 120, (4, 4): 78,  (0, 4): 210, (1, 4): 66,  (2, 4): 253,
    (3, 3): 21,  (4, 3): 136, (0, 3): 105, (1, 3): 45,  (2, 3): 15
}

def offset(x, y):
    return table.get((x, y), "Value not found")

print("\n  // CONVERT_STRING_TO_MATRIX_FORM")
for y in range(5):
    for x in range(5):
        print(f"  assign init[{x}][{y}] = state_i[{64 * (5 * y + x):4d}:{64 * (5 * y + x)+63:4d}];")
    print()
    
print("\n  // THETA_STEP")
for x in range(5):
    print(f"  assign pre_theta[{x}] = init[{x}][0] ^ init[{x}][1] ^ init[{x}][2] ^ init[{x}][3] ^ init[{x}][4];")
print()
for y in range(5):
    for x in range(5):
        print(f"  assign theta[{x}][{y}] = init[{x}][{y}] ^ pre_theta[{(x-1) % 5}] ^ rot(pre_theta[{(x+1) % 5}], 1);")
    print()
    
"""
print("\n  // RHO_STEP")
for y in range(5):
    for x in range(5):
        print(f"  assign rho[{x}][{y}] = rot(theta[{x}][{y}], {offset(x, y) % 64:2d});")

print("\n  // PI_STEP")
for y in range(5):
    for x in range(5):
        print(f"  assign pi[{x}][{y}] = rho[{(x+3*y) % 5}][{x}];")
""" 

print("\n  // RHO_PI_STEP")
for y in range(5):
    for x in range(5):
        print(f"  assign pi[{y}][{(2*x+3*y) %5 }] = rot(theta[{x}][{y}], {offset(x, y) % 64:2d});")
    print()
        
print("\n  // CHI_STEP")
for y in range(5):
    for x in range(5):
        print(f"  assign chi[{x}][{y}] = pi[{x}][{y}] ^ ((~pi[{(x+1) % 5}][{y}]) & pi[{(x+2) % 5}][{y}]);")
    print()
    
print("\n  // IOTA_STEP")
for y in range(5):
    for x in range(5):
        if ((x==0) & (y==0)):
            print(f"  assign iota[{x}][{y}] = chi[{x}][{y}] ^ get_rc(ir_i);")
        else:
            print(f"  assign iota[{x}][{y}] = chi[{x}][{y}];")
    print()

print("\n  // CONVERT_MATRIX_TO_STRING_FORM")
for y in range(5):
    for x in range(5):
        print(f"  assign state_o[{64 * (5 * y + x):4d}:{64 * (5 * y + x)+63:4d}] = iota[{x}][{y}];")
    print()
*/
