module cla_flags (
  input [3:0] r,
  input c,
  input clk,
  input clr,
  output [3:0] CCout 
);

  wire z, n, v;
  
  assign z = (r == 4'b0000);
  assign n = (r[3] == 4'b1);
  assign v = (c ^ r[3]);

  nBitRegister #(4) flag_reg (
    .D({z,n,v,c}),     // input [W-1:0] D,
    .clk(clk), // input CLK,
    .clr(clr),  // input CLR,
    .Q(CCout)      // output [W-1:0] Q
  );

  
endmodule
