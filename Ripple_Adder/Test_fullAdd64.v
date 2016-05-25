`include "fullAdd64.v"

module Test_fullAdd64;
    reg [63:0] x, y;
    reg cIn;
    wire [63:0] s;
    wire cOut;

    fullAdd64 f(x, y, cIn, s, cOut);

    initial
        begin
        
/*        
            #0
            x = 64'h0000000000000000;
            y = 64'h0000000000000000;
            cIn = 1'b0;        
*/       

            x = 64'hFFFFFFFFFFFFFFFE;
            y = 64'h0000000000000001;
            cIn = 1'b0;


 

    $monitor("x = %h\ny = %h\ncIn = %b\n s = %h\n cOut = %b\n\n", x, y, cIn, s, cOut);
    
    end
endmodule

