`include "Registers-asynch.v"

module Registers_tb;
    reg Rwrite = 1'b0;
    reg [15:0] Rdst;
    reg [4:0] Rdst_addr = 5'd0, Rsrc1_addr = 5'd0, Rsrc2_addr = 5'd0;

    wire [15:0] Rsrc1, Rsrc2;
    
    
    
    Registers R(Rdst, Rsrc1, Rsrc2, Rdst_addr, Rsrc1_addr, Rsrc2_addr, Rwrite);

    initial begin
        #2 Rdst = 16'd47;
        #0 Rwrite = 1'b1;
        #2 Rdst_addr = 5'd1;
        
        
        #2 Rdst_addr = 5'd2;
        #2 Rdst = 16'd74;
        
        #8 Rwrite = 1'b0;
        #2 Rsrc1_addr = 5'd1;
        #2 Rsrc2_addr = 5'd2;
        
        #10 $finish;
        
    end
    
    initial
        $monitor($time, ") [R%d] = %d, [R%d] = %d", Rsrc1_addr, Rsrc1, Rsrc2_addr, Rsrc2);
    
    
endmodule
