module divider3329 (
  input  logic clk_i,
  input  logic rst_ni,
  input  logic start_i,
  input  logic [23:0] a_i,
  output logic done_o,
  output logic [11:0] r_o
);

  // Internal signals
  logic [11:0] xu;
  logic [23:0] r, x;

  typedef enum logic [1:0] {
    IDLE,
    STEP1,
    STEP2
  } state_t;
  state_t state, next_state;

  always @(posedge clk_i or negedge rst_ni) begin
    if (!rst_ni) begin
      state <= IDLE;
    end else begin
      state <= next_state;
    end
  end

  always @(state or start_i) begin
    case (state)
      IDLE: begin
        if (!start_i) begin
          next_state = IDLE;
        end else begin
          next_state = STEP1;
        end
      end
      STEP1: begin
        if (!start_i) begin
          next_state = IDLE;
        end else begin
          next_state = STEP2;
        end
      end
      STEP2: begin
        if (!start_i) begin
          next_state = IDLE;
        end else begin
          next_state = STEP2;
        end
      end

      default: begin
        next_state = IDLE;
      end
    endcase
  end

  always @(posedge clk_i or negedge rst_ni) begin
    if (!rst_ni) begin
      r_o <= 12'd0;
      done_o <= 1'b0;
      xu <= a_i[23:12] + a_i[23:15] + a_i[23:16];
      r <= 24'd0;
      x <= a_i;

    end else begin
      case (state)
        IDLE: begin
          r_o <= 12'd0;
          done_o <= 1'b0;
          xu <= a_i[23:12] + a_i[23:15] + a_i[23:16];
          r  <= 24'd0;
          x <= a_i;
        end

        STEP1: begin
          r <= x - xu*12'd3329;          
        end

        STEP2: begin
          if (r > 12'd3329) begin
            r_o <= r - 12'd3329;
          end else begin
            r_o <= r[11:0];
          end

          done_o <= 1'b1;
        end
        
        default: begin
          // Do nothing
        end
      endcase
    end
  end

endmodule

