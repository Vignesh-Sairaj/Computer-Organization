`include "Lshift16.v"

module Rshift16(A, shr, OUT);

	input [15:0] A;
	input [3:0] shr;

	output [15:0] OUT;

	wire [15:0] Arev, OUTrev;
	
	assign Arev[15] = A[0];
	...
	...
	...


	Lshift16 L(Arev, shr, OUTrev);
	
	assign OUT[15] = OUTrev[0]
	...
	...
	...

endmodule
