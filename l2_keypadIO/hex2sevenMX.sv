module hex2sevenMX (
  input Clock, Reset, Load, OnOff, 
  input [3:0] HEX3, HEX2, HEX1, HEX0,
  output [6:0] seg,
  output [3:0] cat,
  output [15:0] testout
);

  
  //Internal nets
  logic ClockOut, MuxRate;
  logic [31:0] ClockLadder;
  logic [15:0] MUXin;
  logic [3:0] MUXout;
  logic [1:0] sel;
  assign MuxRate = ClockLadder[17];
  
  wire [3:0] statetest;
  assign testout = {MUXin};
  
  //OnOffToggle
/*  onOffToggle OnOffToggle_inst (
    .onOff(OnOff) , // input OnOff_sig
    .CLK(Clock) , // input IN_sig
    .OUT(ClockOut) // output OUT_sig
  );*/
  
  //Clock divider
  clockLadder clock_Ladder (
    .CLK(Clock) , // input clock_sig
    .CLR(Reset) , // input clear_sig
    .ladder(ClockLadder) // output [N-1:0] Y_sig
  );
  
  //PIPO register
  nBitRegister #(16) nBitRegisterSV_inst (
    .D({HEX3,HEX2,HEX1,HEX0}) , // input [N-1:0] D_sig
    .CLK(Load & Reset) , // input CLK_sig
    .CLR(Reset) , // input CLR_sig
    .Q(MUXin) // output [N-1:0] Q_sig
  );
  
  //Four-to-one multiplexer
  four2one four2one_inst (
    .A(sel[0]) , // input A_sigLADDER
    .B(sel[1]) , // input B_sig
    .D0(MUXin[3:0]) , // input [N-1:0] D0_sig
    .D1(MUXin[7:4]) , // input [N-1:0] D1_sig
    .D2(MUXin[11:8]) , // input [N-1:0] D2_sig
    .D3(MUXin[15:12]) , // input [N-1:0] D3_sig
    .Y(MUXout) // output [N-1:0] Y_sig
  );
    
  //Hex-to-seven decoder TODO
  binary2Seven_high bin2sev_inst (
    .BIN(MUXout) , // input [3:0] hex_sig
    .SEV(seg) // output [0:6] seven_sig
  );
  
  //Controller FSM
  fsm FSM_inst (
    .mux_rate(MuxRate) , // input clock_sig
    .reset(Reset) , // input reset_sig
    .SEL(sel) , // output [1:0] SEL_sig
    .CAT(cat), // output [3:0] CAT_sig
    .test(statetest[3:0])
  );
  
endmodule