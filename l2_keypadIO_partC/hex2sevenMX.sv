module hex2sevenMX (
  input Clock, Reset, Load,
  input [3:0] HEX3, HEX2, HEX1, HEX0,
  input MuxRate,
  output [6:0] seg,
  output [3:0] cat
);
  
  //Internal nets
  logic ClockOut;
  logic [15:0] MUXin;
  logic [3:0] MUXout;
  logic [1:0] sel;
  
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
    .test()
  );
  
endmodule