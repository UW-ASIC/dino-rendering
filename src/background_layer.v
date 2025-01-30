`default_nettype none

module tt_um_example #(parameter LINE_VPOS=9'd180)(
  input  wire       clk,      // clock
  input  wire       rst_n     // reset_n - low to reset
  input wire [8:0] i_hpos;
  input wire [8:0] i_vpos;
  output reg o_color_background;   // Dedicated outputs
);

  always @(*) begin
    o_color_background = 1'b0;
    if (i_vpos == LINE_VPOS) begin
      o_color_background = 1'b1;
    end
  end

endmodule
