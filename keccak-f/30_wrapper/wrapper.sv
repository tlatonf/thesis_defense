module wrapper (
  input  logic clk_i,
  input  logic rst_ni,
  input  logic en_i,
  input  logic [99:0] wr_state_i,
  output logic [99:0] wr_state_o
);

  logic [1599:0] state_in, state_out;
  logic [4:0] count;
  logic done;

  always @(posedge clk_i or negedge rst_ni) begin
    if (!rst_ni) begin
      state_in    <= '0;
      count       <= 5'd0;
      done        <= 1'b0;
    end else if (en_i) begin
      state_in[100*count +: 100] <= wr_state_i;
      count <= count + 1;
      if (count == 5'd15) begin
        done <= 1'b1;
        count <= 5'd0;
      end
    end
  end

  always @(posedge clk_i or negedge rst_ni) begin
    if (!rst_ni) begin
      wr_state_o <= '0;
    end else if (done) begin
      wr_state_o <= state_out[100*count +: 100];
    end
  end    

  keccak_f uut (
    .state_i    (state_in),
    .state_o    (state_out)
  );

endmodule