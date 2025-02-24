module keypad_input #( parameter DIGITS = 4 )
( 
    input clk,
    input reset,
    input [3:0] row,
    output [3:0] col,
    output [(DIGITS*4)-1:0] out,
    // Debug
    output [3:0] value,
    output trig
);
    keypad_base keypad_base(
      .clk(clk),
      .row(row),
      .col(col),
      .value(value),
      .valid(trig)
    );

  nBitRegister #(4) in_reg (
    .D(value),     // input [W-1:0] D,
    .clk(~trig), // input CLK,
    .clr(reset),  // input CLR,
    .Q(out)      // output [W-1:0] Q
  );
  
    
endmodule