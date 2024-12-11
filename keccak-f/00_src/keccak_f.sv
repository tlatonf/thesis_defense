module keccak_f (
  input  logic [0:`B_WIDTH-1] state_i,
  output logic [0:`B_WIDTH-1] state_o
);

  logic [0:`B_WIDTH-1] state [0:22];

  round round0 (
    .ir_i     (6'd0),
    .state_i  (state_i),
    .state_o  (state[0])
  );

  round round1 (
    .ir_i     (6'd1),
    .state_i  (state[0]),
    .state_o  (state[1])
  );

  round round2 (
    .ir_i     (6'd2),
    .state_i  (state[1]),
    .state_o  (state[2])
  );

  round round3 (
    .ir_i     (6'd3),
    .state_i  (state[2]),
    .state_o  (state[3])
  );

  round round4 (
    .ir_i     (6'd4),
    .state_i  (state[3]),
    .state_o  (state[4])
  );

  round round5 (
    .ir_i     (6'd5),
    .state_i  (state[4]),
    .state_o  (state[5])
  );

  round round6 (
    .ir_i     (6'd6),
    .state_i  (state[5]),
    .state_o  (state[6])
  );

  round round7 (
    .ir_i     (6'd7),
    .state_i  (state[6]),
    .state_o  (state[7])
  );

  round round8 (
    .ir_i     (6'd8),
    .state_i  (state[7]),
    .state_o  (state[8])
  );

  round round9 (
    .ir_i     (6'd9),
    .state_i  (state[8]),
    .state_o  (state[9])
  );

  round round10 (
    .ir_i     (6'd10),
    .state_i  (state[9]),
    .state_o  (state[10])
  );

  round round11 (
    .ir_i     (6'd11),
    .state_i  (state[10]),
    .state_o  (state[11])
  );

  round round12 (
    .ir_i     (6'd12),
    .state_i  (state[11]),
    .state_o  (state[12])
  );

  round round13 (
    .ir_i     (6'd13),
    .state_i  (state[12]),
    .state_o  (state[13])
  );

  round round14 (
    .ir_i     (6'd14),
    .state_i  (state[13]),
    .state_o  (state[14])
  );

  round round15 (
    .ir_i     (6'd15),
    .state_i  (state[14]),
    .state_o  (state[15])
  );

  round round16 (
    .ir_i     (6'd16),
    .state_i  (state[15]),
    .state_o  (state[16])
  );

  round round17 (
    .ir_i     (6'd17),
    .state_i  (state[16]),
    .state_o  (state[17])
  );

  round round18 (
    .ir_i     (6'd18),
    .state_i  (state[17]),
    .state_o  (state[18])
  );

  round round19 (
    .ir_i     (6'd19),
    .state_i  (state[18]),
    .state_o  (state[19])
  );

  round round20 (
    .ir_i     (6'd20),
    .state_i  (state[19]),
    .state_o  (state[20])
  );

  round round21 (
    .ir_i     (6'd21),
    .state_i  (state[20]),
    .state_o  (state[21])
  );

  round round22 (
    .ir_i     (6'd22),
    .state_i  (state[21]),
    .state_o  (state[22])
  );

  round round23 (
    .ir_i     (6'd23),
    .state_i  (state[22]),
    .state_o  (state_o)
  );

endmodule