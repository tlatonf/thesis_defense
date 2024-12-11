module ntt_tb;

  logic clk_i, rst_ni;
  logic start_i;
  logic [11:0] sample [0:255];
  logic [11:0] coeff_o [0:255];
  logic [11:0] expected [0:255];
  logic done_o;

  ntt ntt (
    .clk_i    (clk_i),
    .rst_ni   (rst_ni),
    .start_i  (start_i),
    .coeff_i  (sample),
    .coeff_o  (coeff_o),
    .done_o   (done_o)
  );

  always #5 clk_i = ~clk_i;

  initial begin
    clk_i = 0;
    rst_ni = 1;
    #10;

    // Reset and initialize
    rst_ni = 0;
    #10;

    sample = '{256{12'h000}};
    expected = '{256{12'h000}};
    
    // Read input and expected data from files
    $readmemh("./testcase/sample.hex", sample);
    $readmemh("./testcase/expected.hex", expected);
    
    // Start processing
    start_i = 1;
    rst_ni = 1;
    #10;

    // Wait for completion
    while (!done_o) begin
      #10;
    end

    // Compare output with expected values
    for (int i = 0; i < 256; i++) begin
      if (coeff_o[i] !== expected[i]) begin
        $display("[FAILED]: index %3d: coeff_o = %4h, expected = %4h", i, coeff_o[i], expected[i]);
      end else begin
        $display("[PASSED]: index %3d: coeff_o = %4h", i, coeff_o[i]);
      end
    end

    // Log total execution cycles
    $display("TONG SO CHU KY THUC HIEN: %0t CCs", $time / 10 / 128);
    
    $finish;
  end

endmodule
