`include "Lrotate16_gen.v"

module Test_Lrotate16_gen;
    reg [15:0] A;
    reg [3:0] shl;
    
    wire [15:0] OUT;


    Lrotate16_gen s1(A, shl, OUT);
    

    initial
        begin
        
/*        
            #0
            x = 4'h0;
            y = 4'h0;
            cIn = 1'b0;        
*/       
            
            A = 16'h3000;
            
            shl = 4'h4;
            
            #4
            
            
    $monitor("\n\nInput:\n\n  A = %H\n  shl = %H\n\nOutput:\n\n  OUT = %H\n\n", A, shl, OUT);
       
    end
    
endmodule   
