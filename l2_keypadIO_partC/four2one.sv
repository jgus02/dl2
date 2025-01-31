module four2one (
  input A,B,
  input [3:0] D0,
  input [3:0] D1,
  input [3:0] D2,
  input [3:0] D3,
  output logic [3:0] Y
);

  always_comb
    case ({B,A})
    2'b00: Y = D1;
    2'b01: Y = D2;
    2'b10: Y = D3;
    2'b11: Y = D0;
    endcase
  
endmodule