`include "Lshift4.v"

module Test_Lshift4;
    reg [3:0] A;
    reg [1:0] shl;
    
    wire [3:0] OUT;


    Lshift4 s1(A, shl, OUT);
    

    initial
        begin
        
/*        
            #0
            x = 4'h0;
            y = 4'h0;
            cIn = 1'b0;        
*/       
            
            A = 4'h3;
            
            shl = 2'h2;
            
            #4
            
            
    $monitor("\n\nInput:\n\n  A = %H\n  shl = %H\n\nOutput:\n\n  OUT = %H\n\n", A, shl, OUT);
       
    end
    
endmodule   
