`include "Array_Mult8_gen.v"

module Test_Array_Mult8_gen;

    reg [7:0] x, y;
    wire [15:0] P;


    Array_Mult8_gen f(x, y, P);
    

    initial
        begin
        
/*        
            #0
            x = 4'h0;
            y = 4'h0;
            cIn = 1'b0;        
*/       
            
            x = 8'h02;
            y = 8'h02;
            
            #4
            
            
    $monitor("\n\nInput:\n\n  x = 0x%H\n  y = 0x%H\n\nOutput:\n\n  P = 0x%H\n\nDebug:\n  P[15] = %b\n\n", x, y, P, P[15]);
       
    end
endmodule
