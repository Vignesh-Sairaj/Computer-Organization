`include "CLA_Add64.v"

module Test_CLA_Add64;
    reg [63:0] x, y;
    reg cIn;
    wire [63:0] s;
    wire cOut;

    CLA_Add64 f(x, y, cIn, s, cOut);
    

    initial
        begin
        
/*        
            #0
            x = 64'h0000000000000000;
            y = 64'h0000000000000000;
            cIn = 1'b0;        
*/       
            #0
            x = 64'hFFFFFFFFFFFFFFFE;
            y = 64'h0000000000000001;
            #2
            cIn = 1'b0;
            
            
            x = 64'hFFFFFFFFFFFFFFEE;
            y = 64'h0000000000000011;
            #2
            cIn = 1'b0;
            
            
            x = 64'h000000000000000E;
            y = 64'h0000000000000011;
            #2
            cIn = 1'b0;
            
            
            x = 64'h000000000000000F;
            y = 64'h0000000000000011;
            #2
            cIn = 1'b0;

            #2 $finish;        
    end
    
    always @ (x or y or cIn)
        begin
        $display("\n\nTIME: %d\n\nInput:\n\n  x = %H\n  y = %H\n  cIn = %b\n\nOutput:\n\n  s = %H\n\n  cOut = %b\n\n", $time, x, y, cIn, s, cOut);
    end
endmodule
