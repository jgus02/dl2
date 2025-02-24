module CarryLookAhead_AddSub (
  input [3:0] keypad_in,
  output [3:0] aout,
  output [3:0] bout,  
  input addsub,             // 0 = add, 1 = subtract
  input load,               // Load a_reg and b_reg
  input load_sel,            // 0 = a_reg, 1 = b_reg
  input submit,             // Calculate flags_znvc and R
  input reset,              // Reset regs to 0
  output [3:0] CCout,  // zero, negative, overflow, carry
  output [3:0] R,            // Sum/Difference of A +- B
  output [3:0] Rout
);
  
  wire load_a, load_b;
  
  assign load_a = load | load_sel; 
  assign load_b = load | ~load_sel;
  
  // CLA calculation outputs
  
  nBitRegister #(4) a_reg (
    .D(keypad_in),     // input [W-1:0] D,
    .clk(load_a), // input CLK,
    .clr(reset),  // input CLR,
    .Q(aout)      // output [W-1:0] Q
  );

  nBitRegister #(4) b_reg (
    .D(keypad_in),     // input [W-1:0] D,
    .clk(load_b), // input CLK,
    .clr(reset),  // input CLR,
    .Q(bout)      // output [W-1:0] Q
  );
  
  wire [3:0] R_2c;
  wire [3:0] Rout_2c;
  wire cout;
  wire [3:0] cc;
  cla_logic cla_log (
    .a(aout),     // g [3:0],
    .b(bout),     // p [3:0],
    .cin(addsub),   // cin
    .cc(cc),  // cout
    .sum(R_2c)   // [3:0] sum 
  );
  
  assign R = R_2c[3] ? (~R_2c + 4'b1) : R_2c; 
  assign Rout = Rout_2c[3] ? (~Rout_2c + 4'b1) : Rout_2c;
  
  nBitRegister #(4) sum_reg (
    .D(R_2c),     // input [W-1:0] D,
    .clk(submit), // input CLK,
    .clr(reset),  // input CLR,
    .Q(Rout_2c)      // output [W-1:0] Q
  );
  
  nBitRegister #(4) CC_reg (
    .D(cc),     // input [W-1:0] D,
    .clk(submit), // input CLK,
    .clr(reset),  // input CLR,
    .Q(CCout)      // output [W-1:0] Q
  );
  

endmodule