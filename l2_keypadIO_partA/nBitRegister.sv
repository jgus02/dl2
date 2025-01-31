module nBitRegister #(parameter W = 4) (
  input [W-1:0] D,
  input CLK,
  input CLR,
  output [W-1:0] Q
);
  assign Q = Q_latch;
  reg [W-1:0] Q_latch;
  
  always_ff @ (negedge CLK, negedge CLR)
  begin
    if(~CLR) Q_latch <= 0;
    else Q_latch <= D;
  end
endmodule