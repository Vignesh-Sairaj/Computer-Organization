`include "Prefix_Add4.v"

module Array_Mult4_gen(x, y, P);

	input [3:0] x, y;

	output [7:0] P;

	reg zero = 1'b0;

	wire [3:0] p0;
	wire [4:1] p1;
	wire [5:2] p2;
	wire [6:3] p3;

	wire [4:0] s0;
	wire [5:1] s1;
	wire [6:2] s2;
	wire [7:3] s3;

	assign s0[4] = zero;

	assign p0[3] = y[0]&x[3], p0[2] = y[0]&x[2], p0[1] = y[0]&x[1], p0[0] = y[0]&x[0];
	assign p1[4] = y[1]&x[3], p1[3] = y[1]&x[2], p1[2] = y[1]&x[1], p1[1] = y[1]&x[0];
	assign p2[5] = y[2]&x[3], p2[4] = y[2]&x[2], p2[3] = y[2]&x[1], p2[2] = y[2]&x[0];
	assign p3[6] = y[3]&x[3], p3[5] = y[3]&x[2], p3[4] = y[3]&x[1], p3[3] = y[3]&x[0];


	assign s0[3:0] = p0;

	Prefix_Add4 f1(s0[4:1], p1[4:1], zero, s1[4:1], s1[5]);
	Prefix_Add4 f2(s1[5:2], p2[5:2], zero, s2[5:2], s2[6]);
	Prefix_Add4 f3(s2[6:3], p3[6:3], zero, s3[6:3], s3[7]);


	assign P[0] = s0[0];
	assign P[1] = s1[1];
	assign P[2] = s2[2];

	assign P[7:3] = s3[7:3];


endmodule
