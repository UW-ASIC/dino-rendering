// --------------- ICON FOR LIVE CELL --------------------
`default_nettype none

module sprite_layer #(parameter DINE_HPOS)(
  input  wire       clk,      // clock
  input  wire       rst_n     // reset_n - low to reset
  input wire [8:0] i_hpos;
  // don't have to give to this percision
  input wire [8:0] i_vpos;
  input wire [3:0] i_dino_vpos;
  output reg o_color_dino;   // Dedicated outputs
);

  always @(*) begin
    o_color_dino = 1'b0;
    // optimize this heavily for ROM
    if (icon[i_vpos-i_dino_vpos][i_hpos-DINE_HPOS] == 1'b1) begin
      o_color_dino = 1'b1;
    end
  end


endmodule
