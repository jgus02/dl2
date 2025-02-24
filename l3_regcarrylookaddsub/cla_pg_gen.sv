module cla_pg_gen (
  input a,
  input b,
  input c,
  output g,
  output p,
  output s
);

  assign g = a & b;
  assign p = a ^ b;
  assign s = p ^ c;
  
endmodule
