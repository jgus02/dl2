module AddSub_IO (
  input clk50M, rst, //onOff, 
  input in, out,
  input [3:0] r,
  input [9:0] sw,
  output [3:0] c,
  output [6:0] seg,
  output [3:0] cat,
  output [9:0] LEDR
); 

  wire [3:0] keypad_char;
  wire [3:0] aout_char;
  wire [3:0] bout_char;
  wire [3:0] r_char;
  wire [3:0] rout_char;
  
  keypad_input #(1) kpd_in ( // Depends: keypad_base(clock_div, keypad_fsm, keypad_decoder), shift_reg
    .clk(clk50M),   //input clk,
    .reset(rst),    //input reset,
    .row(r),        //input [3:0] row,
    .col(c),        //output [3:0] col,
    .in(keypad_char), //output [(DIGITS*4)-1:0] Clock,
    .trig(trig)                //output trig
);

 hex2sevenMX h2sMX (
    .Clock(clk50M),
    .Reset(rst),
    .Load(in & out),
    .OnOff(1'b1), 
    .HEX3(aout_char), 
    .HEX2(bout_char), 
    .HEX1(r_char), 
    .HEX0(rout_char),
   
    .seg(seg),
    .cat(cat)
  );

  CarryLookAhead_AddSub cla (
    .keypad_in(keypad_char),
    .aout(aout_char),
    .bout(bout_char),         // Clock [3:0]
    .addsub(sw[1]),        //input addsub, 1 = sub, 0 = add
    .load(in),          //input load,
    .load_sel(sw[0]),         //input   0 = a_reg, 1 = b_reg
    .submit(out),        //input submit,
    .reset(rst),         //input reset,
    .CCout(LEDR[3:0]),    //output flags_znvc [3:0],
    .R(r_char),
    .Rout(rout_char)              //output [3:0] R
  );
  
  assign LEDR[9:6] = keypad_char;
  assign LEDR[5:4] = 2'b0;
  
  endmodule