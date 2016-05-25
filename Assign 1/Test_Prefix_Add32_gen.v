`include "Prefix_Add32_gen.v"

module Test_Prefix_Add32_gen;
    reg [31:0] x, y;
    reg cIn;
    wire [31:0] s;
    wire cOut;

    Prefix_Add32_gen f(x, y, cIn, s, cOut);
    

    initial
        begin
        
/*        
            #0
            x = 4'h0;
            y = 4'h0;
            cIn = 1'b0;        
*/       
            
            x = 32'h00000002;
            y = 32'h00000002;
            cIn = 1'b0;
            
            #4
            
            
    $monitor("\n\nInput:\n\n  x = %H\n  y = %H\n  cIn = %b\n\nOutput:\n\n  s = %H\n\n  cOut = %b\n\n", x, y, cIn, s, cOut);
       
    end
    
endmodule    

