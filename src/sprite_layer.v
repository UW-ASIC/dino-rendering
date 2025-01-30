// --------------- ICON FOR LIVE CELL --------------------
`default_nettype none

module sprite_layer #(parameter DINE_HPOS)(
  input  wire       clk,      // clock
  input  wire       rst_n     // reset_n - low to reset
  input wire [8:0] i_hpos;
  // don't have to give to this percision
  input wire [8:0] i_vpos;
  input wire [3:0] i_dino_vpos;
  input wire  i_sprite_colour;
  
  output reg [3:0] o_romx, o_romy;
  output reg o_color_dino;   // Dedicated outputs
);

  reg [3:0] y_offset 
  reg [3:0] x_offset
  reg in_sprite;

  always @(*) begin
    y_offset = i_vpos - i_dino_vpos 
    x_offset = i_hpos - DINE_HPOS
    in_sprite = (r_x_offset < 4'd15) && (r_y_offset < 4'd15)
  end 

  reg [3:0] r_y_offset
  reg [3:0] r_x_offset

  always @(posedge clk or posedge rst_n) begin
    if(!rst_n) begin 
      r_y_offset <= 0;
      r_x_offset <= 0;
    end else begin
    r_y_offset <= y_offset
    r_x_offset <= x_offset
    end 
  end 

  // ROM addressing
  always @(*) begin
    o_romx = r_x_offset;
    o_romy = r_y_offset;
  end 

  always @(*) begin
    o_color_dino = 1'b0;
    // optimize this heavily for ROM
    if (in_sprite) begin
      o_color_dino = i_sprite_colour
    end
  end


endmodule
