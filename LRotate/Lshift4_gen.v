`include "mux2to1.v"

module Lshift4_gen(A, shl, OUT);

	input [3:0] A;
	input [1:0] shl;

	output [3:0] OUT;

	wire [3:0] m0, m1;

	reg z = 1'b0;

	mux2to1 M00(z, A[0], ~shl[0], m0[0]), M01(A[0], A[1], ~shl[0], m0[1]), M02(A[1], A[2], ~shl[0], m0[2]), M03(A[2], A[3], ~shl[0], m0[3]);

	mux2to1 M10(z, m0[0], ~shl[1], m1[0]), M11(z, m0[1], ~shl[1], m1[1]), M12(m0[0], m0[2], ~shl[1], m1[2]), M13(m0[1], m0[3], ~shl[1], m1[3]);

	assign OUT = m1;

endmodule
