`include "CLA_Add4.v"

module CLA_Add16(x, y, cIn, s, cOut);

    input [15:0] x, y;
    input cIn;
    
    output [15:0] s;
    output cOut;
    
    wire c3, c7, c11;

    CLA_Add4 f0(x[3:0], y[3:0], cIn, s[3:0], c3);
    CLA_Add4 f1(x[7:4], y[7:4], c3, s[7:4], c7);
    CLA_Add4 f2(x[11:8], y[11:8], c7, s[11:8], c11);
    CLA_Add4 f3(x[15:12], y[15:12], c11, s[15:12], cOut);

endmodule
