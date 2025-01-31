module keypadIO (
  input clk50M, rst, load, onOff, 
  input [3:0] r,
  input [3:0] sw,
  output [3:0] c,
  output [6:0] seg,
  output [3:0] cat,
  output [6:0] testboardseg,
  output [9:0] LEDR
  
);

  wire [15:0] hex_chars;
  wire [15:0] h2stest ;
  assign LEDR[9:3] = h2stest[9:3];
  wire trig;

  keypad_input kpd_in ( // Depends: keypad_base(clock_div, keypad_fsm, keypad_decoder), shift_reg
    .clk(clk50M),   //input clk,
    .reset(rst),    //input reset,
    .row(r),        //input [3:0] row,
    
    .col(c),        //output [3:0] col,
    .out(hex_chars), //output [(DIGITS*4)-1:0] out,
    // Debug
    .value(h2stest[6:3]),                //output [3:0] value,
    .trig(trig)                //output trig
);
  
  hex2sevenMX h2sMX (
    .Clock(clk50M),
    .Reset(rst),
    .Load(trig),
    .OnOff(1'b1), 
    .HEX3(hex_chars[15:12]), 
    .HEX2(hex_chars[11:8]), 
    .HEX1(hex_chars[7:4]), 
    .HEX0(hex_chars[3:0]),
   
    .seg(seg),
    .cat(cat)
  );
  
  
  
endmodule