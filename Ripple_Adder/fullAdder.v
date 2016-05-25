module  fullAdder(x, y, cIn, s, cOut);

    input x, y, cIn;
    output s, cOut;

    assign s = x ^ y ^ cIn;
    
    assign cOut = (x&y) | (y&cIn) |  (cIn&x);

endmodule
