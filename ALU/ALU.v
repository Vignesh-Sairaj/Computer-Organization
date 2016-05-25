`include "mult16.v"
`include "Prefix_Add16.v"


module ALU(A, B, sel, cIn, OUT, cOut, shl, );
    input [15:0] A, B;
    input [2:0] sel;
    input cIn; 
    output [31:0] OUT;
    output cOut;
    
    
    reg [31:0] Z = 16'b0;
    
    wire [31:0] MULT;
    wire [31:0] ADD, SUB, AND, OR, NOT;
    
    
    
    //Arithmetic inp
    wire [15:0] Y;
    
    wire cInX = cIn^sel[0];
    assign Y[0] = B[0]^sel[0],
           Y[1] = B[1]^sel[0],
           Y[2] = B[2]^sel[0],
           Y[3] = B[3]^sel[0],
           Y[4] = B[4]^sel[0],
           Y[5] = B[5]^sel[0],
           Y[6] = B[6]^sel[0],
           Y[7] = B[7]^sel[0],
           Y[8] = B[8]^sel[0],
           Y[9] = B[9]^sel[0],
           
           Y[10] = B[10]^sel[0],
           Y[11] = B[11]^sel[0],
           Y[12] = B[12]^sel[0],    
           Y[13] = B[13]^sel[0],
           Y[14] = B[14]^sel[0],
           Y[15] = B[15]^sel[0];


    
    assign ADD[31:16] = Z[31:16], SUB[31:16] = Z[31:16], AND[31:16] = Z[31:16], OR[31:16] = Z[31:16], NOT[31:16] = Z[31:16];
    
    
    mult16 mult(A, B, MULT);
    
    Prefix_Add16 add(A, Y, cInX, ADD[15:0], cOut);
    assign SUB = ADD;
    
    assign AND = A & B;
    assign OR = A | B;
    assign NOT = ~A;
    
    
    
endmodule
