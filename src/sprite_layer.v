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



  reg [7:0] icon[0:7];
  initial begin
    icon[0] = 8'b00000000;
    icon[1] = 8'b00011111;
    icon[2] = 8'b00111101;
    icon[3] = 8'b00111110;
    icon[4] = 8'b10111110;
    icon[5] = 8'b11111110;
    icon[6] = 8'b00110010;
    icon[7] = 8'b00110010;
  end
endmodule
