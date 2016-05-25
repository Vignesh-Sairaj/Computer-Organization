`include "InstMem.v"

module InstMem_tb;
    reg imWrite = 1'b0;
    reg [31:0] imWrDat;
    reg [9:0] imWrDat_addr = 10'd0, imReDat_addr = 10'd0;

    wire [31:0] imReDat;
    
    
    
    InstMem IM(imWrDat, imReDat, imWrDat_addr, imReDat_addr, imWrite);

    initial begin
        #2 imWrDat = 32'd47;
        #2 imWrite = 1'b1;
        #2 imWrDat_addr = 5'd1;
        
        
        #2 imWrDat_addr = 5'd2;
        #2 imWrDat = 32'd74;
        
        #8 imWrite = 1'b0;

        #2 imReDat_addr = 5'd0;
        #2 imReDat_addr = 5'd1;
        #2 imReDat_addr = 5'd2;
        
        #10 $finish;
        
    end
    
    initial
        $monitor($time, ") IM[%2d] = %d", imReDat_addr, imReDat);
    
    
endmodule
