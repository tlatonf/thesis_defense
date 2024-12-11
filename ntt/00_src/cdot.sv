module cdot (
  input  logic        clk_i,
  input  logic        rst_ni,
  input  logic        start_i,
  output logic        done_o,
  
  input  logic [11:0] a_i [0:127],
  input  logic [11:0] b_i [0:127],
  output logic [11:0] p_o
);

  logic [6:0] index;

  // Instantiate multiplier and divider
  logic [11:0] mul_a, mul_b;
  logic [23:0] mul_p;
  always_comb begin
    mul_a = a_i[index];
    mul_b = b_i[index];
  end
  karatsuba12 multiplier (
    .a_i (mul_a),
    .b_i (mul_b),
    .p_o (mul_p)
  );

  logic div_start, div_done, div_clk, div_rstn;
  logic [23:0] div_a;
  logic [11:0] div_r;
  always @(clk_i) begin
    div_clk <= clk_i;
  end

  divider3329 divider (
    .clk_i    (div_clk      ),
    .rst_ni   (rst_ni       ),
    .start_i  (div_start    ),
    .a_i      ({1'b0, div_a}),
    .done_o   (div_done     ),
    .r_o      (div_r        )
  );

  // FSM
  parameter IDLE = 2'b00, MUL = 2'b01, MOD = 2'b10, DONE = 2'b11;
  logic [1:0] state, next_state;

  always_ff @(posedge clk_i or negedge rst_ni) begin
    if (!rst_ni) begin
      state <= IDLE;
    end else begin
      state <= next_state;
    end
  end

  always @(state or start_i or div_done or index) begin
    case (state)
      IDLE: begin
        if (!start_i) begin
          next_state = IDLE;
        end else begin
          next_state = MUL;
        end
      end

      MUL: begin
        if (!start_i) begin
          next_state = IDLE;
        end else begin
          next_state = MOD;
        end
      end

      MOD: begin
        if (!start_i) begin
          next_state = IDLE;
        end else if (div_done) begin 
          next_state = (index == 127) ? DONE : MUL;
        end else begin
          next_state = MOD;
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

  always_ff @(posedge clk_i or negedge rst_ni) begin : main
    if (!rst_ni) begin
      index  <= 7'd0;
      div_a  <= 24'd0;
      p_o    <= 12'd0;
      done_o <= 1'b0;

    end else begin
      case (state)
        IDLE: begin
          index  <= 7'd0;
          div_a  <= 24'd0;
          p_o    <= 12'd0;
          done_o <= 1'b0;
        end

        MUL: begin
          div_a     <= p_o + mul_p;
          div_start <= 1'b1;
        end

        MOD: begin
          if (div_done) begin
            p_o       <= div_r;
            div_start <= 1'b0;
            index     <= index + 1;
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

endmodule