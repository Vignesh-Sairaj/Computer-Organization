module CLA_Add4_gen(x, y, cIn, s, cOut);

	input [3:0] x, y;
	input cIn;

	output [3:0] s;
	output cOut;

	wire [3:0] g, p;
	wire [4:0] c;

	assign g = x&y;
	assign p = x^y;

	assign c[0] = cIn;

	assign c[1] = g[0] | &p[0:0]&c[0];
	assign c[2] = g[1] | &p[1:1]&g[0] | &p[1:0]&c[0];
	assign c[3] = g[2] | &p[2:2]&g[1] | &p[2:1]&g[0] | &p[2:0]&c[0];
	assign c[4] = g[3] | &p[3:3]&g[2] | &p[3:2]&g[1] | &p[3:1]&g[0] | &p[3:0]&c[0];

	assign s = p^c[3:0];

	assign cOut = c[4];

endmodule
