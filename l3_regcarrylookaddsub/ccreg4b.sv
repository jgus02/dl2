module ccreg4b (
  input load,
  input clr,
  input z,
  input n,
  input c,
  input v,
  output reg flags [3:0]
);

  always_comb 
  begin
    if(~clr) flags <= 4'b0000;
    else if(~load) flags <= {z, n, c, v};
  end
  endmodule