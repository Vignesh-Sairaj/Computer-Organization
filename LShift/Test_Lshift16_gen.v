`include "Lshift16_gen.v"

module Test_Lshift16_gen;
    reg [15:0] A;
    reg [3:0] shl;
    
    wire [15:0] OUT;


    Lshift16_gen s1(A, shl, OUT);
    

    initial
        begin
        
/*        
            #0
            x = 4'h0;
            y = 4'h0;
            cIn = 1'b0;        
*/       
            
            A = 16'h0003;
            
            shl = 4'h4;
            
            #4
            
            
    $monitor("\n\nInput:\n\n  A = %H\n  shl = %H\n\nOutput:\n\n  OUT = %H\n\n", A, shl, OUT);
       
    end
    
endmodule   
