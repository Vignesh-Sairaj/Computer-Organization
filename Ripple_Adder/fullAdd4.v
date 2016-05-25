`include "fullAdder.v"

module fullAdd4(x, y, cIn, s, cOut);

    input [3:0] x, y;
    input cIn;
    
    output [3:0] s;
    output cOut;
    
    wire [2:0] c;
    
    fullAdder f0(x[0], y[0], cIn, s[0], c[0]);
    fullAdder f1(x[1], y[1], c[0], s[1], c[1]);
    fullAdder f2(x[2], y[2], c[1], s[2], c[2]);
    fullAdder f3(x[3], y[3], c[2], s[3], cOut);

endmodule
