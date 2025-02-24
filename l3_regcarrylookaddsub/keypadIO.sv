module keypadIO (
  input clk50M, rst, // onOff,
  input [3:0] a_char,
  input [3:0] b_char,
  input [3:0] op_char,
  input [3:0] r_char,
  
  input [3:0] r,            // Keypad rows (input)
  output [3:0] c,           // Keypad columns (output)
  output [3:0] keypad_char,
  output [6:0] seg,         // Multiplexed 7-segment output
  output [3:0] cat          // Multiplexed 7-segment cathode select
);

  wire [3:0] hex_chars;
  wire trig;

  keypad_input #(1) kpd_in ( // Depends: keypad_base(clock_div, keypad_fsm, keypad_decoder), shift_reg
    .clk(clk50M),   //input clk,
    .reset(rst),    //input reset,
    .row(r),        //input [3:0] row,
    
    .col(c),        //output [3:0] col,
    .out(hex_chars), //output [(DIGITS*4)-1:0] out,
    // Debug
    //.value(h2stest[6:3]),                //output [3:0] value,
    .trig(trig)                //output trig
);
  
  hex2sevenMX h2sMX (
    .Clock(clk50M),
    .Reset(rst),
    .Load(trig),
    .OnOff(1'b1), 
    .HEX3(a_char), 
    .HEX2(b_char), 
    .HEX1(op_char), 
    .HEX0(r_char),
   
    .seg(seg),
    .cat(cat)
  );
  
  
  
endmodule