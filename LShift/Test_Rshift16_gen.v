`include "Rshift16_gen.v"

module Test_Rshift16_gen;
    reg [15:0] A;
    reg [3:0] shr;
    
    wire [15:0] OUT;


    Rshift16_gen s1(A, shr, OUT);
    

    initial
        begin
        
/*        
            #0
            x = 4'h0;
            y = 4'h0;
            cIn = 1'b0;        
*/       
            
            A = 16'h0300;
            
            shr = 4'h8;
            
            #4
            
            
    $monitor("\n\nInput:\n\n  A = %H\n  shr = %H\n\nOutput:\n\n  OUT = %H\n\n", A, shr, OUT);
       
    end
    
endmodule   
