module cla_logic (
  input [3:0] a,
  input [3:0] b,

  input cin,
  output [3:0] cc,
  output [3:0] sum
);
    
  wire g [3:0];
  wire p [3:0];
  
  wire c1,c2,c3,c4;
    
  cla_pg_gen p0g0 (
    .a(a[0]),
    .b(b[0] ^ cin),
    .c(cin),
    .g(g[0]),
    .p(p[0]),
    .s(sum[0])
  );
  
  cla_pg_gen p1g1 (
    .a(a[1]),
    .b(b[1] ^ cin),
    .c(c1),
    .g(g[1]),
    .p(p[1]),
    .s(sum[1])
  );
  
  cla_pg_gen p2g2 (
    .a(a[2]),
    .b(b[2] ^ cin),
    .c(c2),
    .g(g[2]),
    .p(p[2]),
    .s(sum[2])
  );
  
  cla_pg_gen p3g3 (
    .a(a[3]),
    .b(b[3] ^ cin),
    .c(c3),
    .g(g[3]),
    .p(p[3]),
    .s(sum[3])
  );
  
  assign c1 = g[0] | (p[0] & cin);  // Calculate each carry bit without waiting for propogation
  assign c2 = g[1] | (p[1] & c1);
  assign c3 = g[2] | (p[2] & c2);
  assign c4 = g[3] | (p[3] & c3);
  
  assign z = (sum == 4'b0000);
  assign n = (sum[3] == 1'b1);
  assign v = (c4 ^ c3);
  
  assign cc = {z,n,v,c4};
  
endmodule
