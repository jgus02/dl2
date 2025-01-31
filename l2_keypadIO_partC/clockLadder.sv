module clockLadder ( 
  input CLK, CLR,
  output logic [31:0] ladder
) ;

  always_ff @ (posedge CLK)
    ladder <= ladder + 1'b1;
  endmodule