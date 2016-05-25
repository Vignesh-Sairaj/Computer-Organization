`include "CLA_Add4.v"

module Test_CLA_Add4;
    reg [3:0] x, y;
    reg cIn;
    wire [3:0] s;
    wire cOut;

    CLA_Add4 f(x, y, cIn, s, cOut);
    

    initial
        begin
        
/*        
            #0
            x = 4'h0;
            y = 4'h0;
            cIn = 1'b0;        
*/       
            
            x = 4'he;
            y = 4'h1;
            cIn = 1'b0;
            
            #4
            
            
    $monitor("\n\nInput:\n\n  x = %H\n  y = %H\n  cIn = %b\n\nOutput:\n\n  s = %H\n\n  cOut = %b\n\n", x, y, cIn, s, cOut);
       
    end
    



endmodule
