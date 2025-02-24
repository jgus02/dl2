module AddSub_IO (
  input clk50M, rst, load, onOff, 
  input [3:0] r,
  input [3:0] sw,
  output [3:0] c,
  output [6:0] seg,
  output [3:0] cat,
  output [6:0] testboardseg,
  output [9:0] LEDR
); 


  keypadIO keypad (
    .clk50M(clk50M),
    .rst(rst),
    .load(load),
    .onOff(onOff), // Enable or disable
    .r(r),
    .sw(sw),
    .c(c),
    .seg(seg),
    .cat(cat),
    .LEDR(LEDR)
  );
  
  CarryLookAhead_AddSub cla (
    .a_in(),          //input [3:0] a_in,
    .b_in(),          //input [3:0] b_in,
    .addsub(),        //input addsub, 1 = sub, 0 = add
    .load(),          //input load,
    .submit(),        //input submit,
    .reset(),         //input reset,
    .flags_znvc(),    //output flags_znvc [3:0],
    .R()              //output [3:0] R
  );
  endmodule