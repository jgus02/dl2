module multiplex_counter (
  input clk50M, rst, load, onOff, 
  output [6:0] seg,
  output [3:0] cat,
  output [9:0] LEDR
);

  wire enable;
  assign LEDR[0] = enable;
  assign LEDR[9:1] = 9'b0;
  wire [15:0] hex_chars;
  logic [31:0] ClockLadder;
  wire trig;
  
  assign clk = clk50M & enable;
 
  //Clock divider
  clockLadder clock_Ladder (
    .CLK(clk50M) , // input clock_sig
    .CLR(rst) , // input clear_sig
    .ladder(ClockLadder) // output [N-1:0] Y_sig
  );
  
  nBitBinCount #(16) bincount (
    .COUNT(ClockLadder[22] & enable),
    .CLEAR(rst), //input COUNT, CLEAR,
    .y(hex_chars) //output logic [N-1:0] y // y is defined as a register
);
  
  hex2sevenMX h2sMX (
    .Clock(clk50M),
    .Reset(rst),
    .Load(ClockLadder[22] & enable),
    .MuxRate(ClockLadder[17]),
    .HEX3(hex_chars[15:12]), 
    .HEX2(hex_chars[11:8]), 
    .HEX1(hex_chars[7:4]), 
    .HEX0(hex_chars[3:0]),
   
    .seg(seg),
    .cat(cat)
  );
    
  //OnOffToggle
  onOffToggle OnOffToggle_inst (
    .onOff(onOff) , // input OnOff_sig
    .CLK(clk50M) , // input IN_sig
    .OUT(enable) // output OUT_sig
  );
  
  
endmodule