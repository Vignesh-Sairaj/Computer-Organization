`include "ALU.v"

module ALU_tb;

    reg [15:0] A, B;
    reg [3:0] Sel;


    wire [15:0] Out;
    wire cFlag, zFlag;
    
    reg [15:0] B2comp;

    ALU U1(A, B, Sel, Out, cFlag, zFlag);
    
    initial begin
        
        A = 16'd1; B = 16'd2;
        Sel = 4'd0;
        
        #2 $display("\n\nA = %d, B = %d:\n\tA + B = %d\n\tCarry? : %b\tZero? : %b", A, B, Out, cFlag, zFlag);
        
        
        
        A = 16'd1; B = 16'd2;
        Sel = 4'd1; B2comp = (~B) + 1;
        
        #2 $display("\n\nA = %d, B = %d, B2comp = %d:\n\tA - B = %d\n\tCarry? : %b\tZero? : %b", A, B, B2comp, Out, cFlag, zFlag);
        
        
        A = 16'd65535;
        Sel = 4'd2;
        
        #2 $display("\n\nA = %d, B = %d:\n\tA + 1 = %d\n\tCarry? : %b\tZero? : %b", A, B, Out, cFlag, zFlag);
        
        
        
        A = 16'd0;
        Sel = 4'd3;
        
        #2 $display("\n\nA = %d, B = %d:\n\tA - 1 = %d\n\tCarry? : %b\tZero? : %b", A, B, Out, cFlag, zFlag);
        
        
        
        A = 16'd1; B = 16'd2;
        Sel = 4'd4;
        
        #2 $display("\n\nA = %b, B = %b:\n\tA & B = %b\n\tCarry? : %b\tZero? : %b", A, B, Out, cFlag, zFlag);
        
        
        
        A = 16'd1; B = 16'd2;
        Sel = 4'd5;
        
        #2 $display("\n\nA = %b, B = %b:\n\tA | B = %b\n\tCarry? : %b\tZero? : %b", A, B, Out, cFlag, zFlag);
        
        
        
        A = 16'd1; B = 16'd2;
        Sel = 4'd6;
        
        #2 $display("\n\nA = %b, B = %b:\n\tA ^ B = %b\n\tCarry? : %b\tZero? : %b", A, B, Out, cFlag, zFlag);
        
        
        
        A = 16'd1; B = 16'd2;
        Sel = 4'd7;
        
        #2 $display("\n\nA = %b, B = %b:\n\t~A = %b\n\tCarry? : %b\tZero? : %b", A, B, Out, cFlag, zFlag);
        
        
        
        A = 16'd1; B = 16'd2;
        Sel = 4'd8;
        
        #2 $display("\n\nA = %b:\n\tA << 1 = %b\n\tCarry? : %b\tZero? : %b", A, Out, cFlag, zFlag);
        
        
        
        $finish;
    
    end

endmodule
