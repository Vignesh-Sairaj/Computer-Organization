`include "Array_Mult4_gen.v"

module Test_Array_Mult4_gen;

    reg [3:0] x, y;
    wire [7:0] P;


    Array_Mult4_gen f(x, y, P);
    

    initial
        begin
        
/*        
            #0
            x = 4'h0;
            y = 4'h0;
            cIn = 1'b0;        
*/       
            
            x = 4'hf;
            y = 4'h2;
            
            #4
            
            
    $monitor("\n\nInput:\n\n  x = 0x%H\n  y = 0x%H\n\nOutput:\n\n  P = 0x%H\n\n\n", x, y, P);
       
    end
endmodule
