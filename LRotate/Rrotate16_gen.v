`include "Lrotate16.v"

module Rrotate16_gen(A, shr, OUT);

	input [15:0] A;
	input [3:0] shr;

	output [15:0] OUT;

	wire [15:0] Arev, OUTrev;

	assign Arev[15] = A[0];
	assign Arev[14] = A[1];
	assign Arev[13] = A[2];
	assign Arev[12] = A[3];
	assign Arev[11] = A[4];
	assign Arev[10] = A[5];
	assign Arev[9] = A[6];
	assign Arev[8] = A[7];
	assign Arev[7] = A[8];
	assign Arev[6] = A[9];
	assign Arev[5] = A[10];
	assign Arev[4] = A[11];
	assign Arev[3] = A[12];
	assign Arev[2] = A[13];
	assign Arev[1] = A[14];
	assign Arev[0] = A[15];

	Lrotate16 L(Arev, shr, OUTrev);

	assign OUT[15] = OUTrev[0];
	assign OUT[14] = OUTrev[1];
	assign OUT[13] = OUTrev[2];
	assign OUT[12] = OUTrev[3];
	assign OUT[11] = OUTrev[4];
	assign OUT[10] = OUTrev[5];
	assign OUT[9] = OUTrev[6];
	assign OUT[8] = OUTrev[7];
	assign OUT[7] = OUTrev[8];
	assign OUT[6] = OUTrev[9];
	assign OUT[5] = OUTrev[10];
	assign OUT[4] = OUTrev[11];
	assign OUT[3] = OUTrev[12];
	assign OUT[2] = OUTrev[13];
	assign OUT[1] = OUTrev[14];
	assign OUT[0] = OUTrev[15];

endmodule
