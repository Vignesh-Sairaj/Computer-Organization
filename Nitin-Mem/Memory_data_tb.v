`include "Memory_data.v"

module Memory_data_tb;
    reg clk = 1'b0,  Mwrite = 1'b0;
    reg [15:0] Mdst;
    reg [20:0] Mdst_addr = 21'd0, Msrc1_addr = 21'd0;

    wire [15:0] Msrc1;
    
    always
        #5 clk <= ~clk;
              
    Memory_Data MD(Mdst, Msrc1, Mdst_addr, Msrc1_addr,clk, Mwrite);
    initial begin
        #0 Mwrite = 1'b1;
        #2 Mdst_addr = 21'd1;
        #2 Mdst = 16'd47;
        
        #2 Mdst_addr = 21'd2;
        #2 Mdst = 16'd74;
        
        #8 Mwrite = 1'b0;
        #2 Msrc1_addr = 21'd1;
        
        
        #10 $finish;
        
    end
    
    initial
        $monitor($time, ") [R%d] = %d",Msrc1_addr,Msrc1,);
    
    
endmodule
