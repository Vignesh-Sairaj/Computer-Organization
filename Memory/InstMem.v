module InstMem(imWrDat, imReDat, imWrDat_addr, imReDat_addr, imWrite);
    
    input imWrite;
    input [31:0] imWrDat;
    input [9:0] imWrDat_addr, imReDat_addr;
    output reg [31:0] imReDat;


    reg [31:0] IM [0:2**10-1];
    
/*
    integer i;
    
    initial begin
        
        for(i = 0; i < 2**10-1; i = i+1)
            IM[i] = 32'd0;
    end*/
        
    always @ (*) begin
        
        if(imWrite) begin
        
            if(imWrDat_addr <= 2**10-1 && imWrDat_addr >= 0)
                IM[imWrDat_addr] = imWrDat;
            else
                $display("Error in imWrDat_addr...");
        end

        if(imReDat_addr <= 2**10-1 && imReDat_addr >= 0)
                imReDat = IM[imReDat_addr];
        else
            $display("Error in imReDat_addr...");
        
    end
    
endmodule