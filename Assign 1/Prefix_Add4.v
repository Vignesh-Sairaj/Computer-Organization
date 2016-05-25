module Prefix_Add4(x, y, cIn, s, cOut);

	input [3:0] x, y;
	input cIn;

	output [3:0] s;
	output cOut;

	wire [3:0] g0, p0, g1, p1, g2, p2;
	wire [4:0] c;

	assign g0[3:1] = x[3:1]&y[3:1];
	assign p0[3:0] = x^y;
	assign c[0] = cIn;	
	assign g0[0] = x[0]&y[0] | c[0]&(x[0] | y[0]);



    assign g1[3] = g0[3] | p0[3]&g0[2], g1[2] = g0[2] | p0[2]&g0[1], g1[1] = g0[1] | p0[1]&g0[0], g1[0] = g0[0];
    assign p1[3] = p0[3]&p0[2], p1[2] = p0[2]&p0[1], p1[1] = p0[1]&p0[0], p1[0] = p0[0];
    
    assign g2[3] = g1[3] | p1[3]&g1[1], g2[2] = g1[2] | p1[2]&g1[0], g2[1] = g1[1], g2[0] = g1[0];
    assign p2[3] = p1[3]&p1[1], p2[2] = p1[2]&p1[0], p2[1] = p1[1], p2[0] = p1[0];
    

    
    assign c[4:1] = g2[3:0];
	assign s = p0^c[3:0];
	assign cOut = c[4];

endmodule
