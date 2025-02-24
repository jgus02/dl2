module nBitRegister #(parameter W = 4) (
  input [W-1:0] D,
  input clk,
  input clr,
  output [W-1:0] Q
);
  assign Q = Q_latch;
  reg [W-1:0] Q_latch;
  
  always_ff @ (negedge clk, negedge clr)
  begin
    if(~clr) Q_latch <= 0;
    else Q_latch <= D;
  end
endmodule