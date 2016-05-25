`include "Prefix_Add8.v"

module Array_Mult8_gen(x, y, P);

	input [7:0] x, y;

	output [15:0] P;

	reg zero = 1'b0;

	wire [7:0] p0;
	wire [8:1] p1;
	wire [9:2] p2;
	wire [10:3] p3;
	wire [11:4] p4;
	wire [12:5] p5;
	wire [13:6] p6;
	wire [14:7] p7;

	wire [8:0] s0;
	wire [9:1] s1;
	wire [10:2] s2;
	wire [11:3] s3;
	wire [12:4] s4;
	wire [13:5] s5;
	wire [14:6] s6;
	wire [15:7] s7;

	assign s0[8] = zero;

	assign p0[7] = y[0]&x[7], p0[6] = y[0]&x[6], p0[5] = y[0]&x[5], p0[4] = y[0]&x[4], p0[3] = y[0]&x[3], p0[2] = y[0]&x[2], p0[1] = y[0]&x[1], p0[0] = y[0]&x[0];
	assign p1[8] = y[1]&x[7], p1[7] = y[1]&x[6], p1[6] = y[1]&x[5], p1[5] = y[1]&x[4], p1[4] = y[1]&x[3], p1[3] = y[1]&x[2], p1[2] = y[1]&x[1], p1[1] = y[1]&x[0];
	assign p2[9] = y[2]&x[7], p2[8] = y[2]&x[6], p2[7] = y[2]&x[5], p2[6] = y[2]&x[4], p2[5] = y[2]&x[3], p2[4] = y[2]&x[2], p2[3] = y[2]&x[1], p2[2] = y[2]&x[0];
	assign p3[10] = y[3]&x[7], p3[9] = y[3]&x[6], p3[8] = y[3]&x[5], p3[7] = y[3]&x[4], p3[6] = y[3]&x[3], p3[5] = y[3]&x[2], p3[4] = y[3]&x[1], p3[3] = y[3]&x[0];
	assign p4[11] = y[4]&x[7], p4[10] = y[4]&x[6], p4[9] = y[4]&x[5], p4[8] = y[4]&x[4], p4[7] = y[4]&x[3], p4[6] = y[4]&x[2], p4[5] = y[4]&x[1], p4[4] = y[4]&x[0];
	assign p5[12] = y[5]&x[7], p5[11] = y[5]&x[6], p5[10] = y[5]&x[5], p5[9] = y[5]&x[4], p5[8] = y[5]&x[3], p5[7] = y[5]&x[2], p5[6] = y[5]&x[1], p5[5] = y[5]&x[0];
	assign p6[13] = y[6]&x[7], p6[12] = y[6]&x[6], p6[11] = y[6]&x[5], p6[10] = y[6]&x[4], p6[9] = y[6]&x[3], p6[8] = y[6]&x[2], p6[7] = y[6]&x[1], p6[6] = y[6]&x[0];
	assign p7[14] = y[7]&x[7], p7[13] = y[7]&x[6], p7[12] = y[7]&x[5], p7[11] = y[7]&x[4], p7[10] = y[7]&x[3], p7[9] = y[7]&x[2], p7[8] = y[7]&x[1], p7[7] = y[7]&x[0];


	assign s0[7:0] = p0;

	Prefix_Add8 f1(s0[8:1], p1[8:1], zero, s1[8:1], s1[9]);
	Prefix_Add8 f2(s1[9:2], p2[9:2], zero, s2[9:2], s2[10]);
	Prefix_Add8 f3(s2[10:3], p3[10:3], zero, s3[10:3], s3[11]);
	Prefix_Add8 f4(s3[11:4], p4[11:4], zero, s4[11:4], s4[12]);
	Prefix_Add8 f5(s4[12:5], p5[12:5], zero, s5[12:5], s5[13]);
	Prefix_Add8 f6(s5[13:6], p6[13:6], zero, s6[13:6], s6[14]);
	Prefix_Add8 f7(s6[14:7], p7[14:7], zero, s7[14:7], s7[15]);


	assign P[0] = s0[0];
	assign P[1] = s1[1];
	assign P[2] = s2[2];
	assign P[3] = s3[3];
	assign P[4] = s4[4];
	assign P[5] = s5[5];
	assign P[6] = s6[6];

	assign P[15:7] = s7[15:7];


endmodule
