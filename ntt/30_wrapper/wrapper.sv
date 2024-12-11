module wrapper (
  input  logic clk_i,
  input  logic rst_ni,
  input  logic en_i,
  output logic done_o,
  input  logic [11:0] wr_coeff_i,
  output logic [11:0] wr_coeff_o
);

  logic [7:0] count;
  logic [11:0] coeff_i [0:255];
  logic [11:0] coeff_o [0:255];
  logic utt_done;

  always @(posedge clk_i or negedge rst_ni) begin
    if (!rst_ni) begin
      coeff_i <= '{256{12'd0}};
      count <= 8'd0;
      done <= 1'b0;
    end else if (en_i) begin
      coeff_i[count] <= wr_coeff_i;
      count <= count + 1;
      if (count == 8'd255) begin
        done <= 1'b1;
        count <= 8'd0;
      end
    end
  end

  always @(posedge clk_i or negedge rst_ni) begin
    if (!rst_ni) begin
      wr_coeff_o <= '0;
    end else if (utt_done) begin
      wr_coeff_o <= coeff_o[count];
    end
  end

  ntt utt (
    .clk_i(clk_i),
    .rst_ni(rst_ni),
    .start_i(done),
    .done_o(utt_done),
    .coeff_i(coeff_i),
    .coeff_o(coeff_o)
  );

endmodule
