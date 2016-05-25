`include "CLA_Add16.v"

module CLA_Add64(x, y, cIn, s, cOut);

    input [63:0] x, y;
    input cIn;
    
    output [63:0] s;
    output cOut;
    
    wire c15, c31, c47;

    CLA_Add16 f0(x[15:0], y[15:0], cIn, s[15:0], c15);
    CLA_Add16 f1(x[31:16], y[31:16], c15, s[31:16], c31);
    CLA_Add16 f2(x[47:32], y[47:32], c31, s[47:32], c47);
    CLA_Add16 f3(x[63:48], y[63:48], c47, s[63:48], cOut);

endmodule
