`include "DataMem.v"

module DataMem_tb;
    reg dmWrite = 1'b0;
    reg [15:0] dmWrDat;
    reg [9:0] dmWrDat_addr = 10'd0, dmReDat_addr = 10'd0;

    wire [15:0] dmReDat;
    
    
    
    DataMem DM(dmWrDat, dmReDat, dmWrDat_addr, dmReDat_addr, dmWrite);

    initial begin
        #2 dmWrDat = 16'd47;
        #2 dmWrite = 1'b1;
        #2 dmWrDat_addr = 5'd1;
        
        
        #2 dmWrDat_addr = 5'd2;
        #2 dmWrDat = 16'd74;
        
        #8 dmWrite = 1'b0;

        #2 dmReDat_addr = 5'd0;
        #2 dmReDat_addr = 5'd1;
        #2 dmReDat_addr = 5'd2;
        
        #10 $finish;
        
    end
    
    initial
        $monitor($time, ") DM[%2d] = %d", dmReDat_addr, dmReDat);
    
    
endmodule
