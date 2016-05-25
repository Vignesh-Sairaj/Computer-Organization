module DataMem(dmWrDat, dmReDat, dmWrDat_addr, dmReDat_addr, dmWrite);
    
    input dmWrite;
    input [15:0] dmWrDat;
    input [9:0] dmWrDat_addr, dmReDat_addr;
    output reg [15:0] dmReDat;


    reg [15:0] DM [0:2**10-1];
    
/*
    integer i;
    
    initial begin
        
        for(i = 0; i < 2**10-1; i = i+1)
            DM[i] = 16'h0000;
    end*/
        
    always @ (*) begin
        
        if(dmWrite) begin
        
            if(dmWrDat_addr <= 2**10-1 && dmWrDat_addr >= 0)
                DM[dmWrDat_addr] = dmWrDat;
            else
                $display("Error in dmWrDat_addr...");
        end

        if(dmReDat_addr <= 2**10-1 && dmReDat_addr >= 0)
                dmReDat = DM[dmReDat_addr];
        else
            $display("Error in dmReDat_addr...");
        
    end
    
endmodule