module reg4b(
  input clk, load, clr,
  input [3:0] in,
  output [3:0] out
);
  
  reg [3:0] out_reg;
  assign out = out_reg;

  always_ff @ (posedge clk) 
    if(~clr) out_reg <= 4'b0000;
    else if(~load) out_reg <= in;
  endmodule