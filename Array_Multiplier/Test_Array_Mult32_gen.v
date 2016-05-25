`include "Array_Mult32_gen.v"

module Test_Array_Mult32_gen;

    reg [31:0] x, y;
    wire [63:0] P;


    Array_Mult32_gen f(x, y, P);
    

    initial
        begin
        
/*        
            #0
            x = 4'h0;
            y = 4'h0;
            cIn = 1'b0;        
*/       
            
            x = 32'h00000004;
            y = 32'h00000004;
            
            #4
            
            
    $monitor("\n\nInput:\n\n  x = 0x%H\n  y = 0x%H\n\nOutput:\n\n  P = 0x%H\n\n\n", x, y, P);
       
    end
endmodule
