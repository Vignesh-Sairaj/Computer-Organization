module Registers(Rdst, Rsrc1, Rsrc2, Rdst_addr, Rsrc1_addr, Rsrc2_addr, clk, Rwrite);
    
    input clk, Rwrite;
    input [15:0] Rdst;
    input [4:0] Rdst_addr, Rsrc1_addr, Rsrc2_addr;
    output [15:0] Rsrc1, Rsrc2;
    reg [15:0] Rsrc1, Rsrc2;
    
    reg [15:0] R [0:31];
    
    integer i;
    
    initial begin
    
        for(i = 0; i < 32; i = i+1)
            R[i] = 16'h0000;
    end
    
    always @ (posedge clk) begin
    
        if(Rwrite) begin
        
            if(Rdst_addr <= 31 && Rdst_addr >= 0)
                R[Rdst_addr] <= Rdst;
            else
                $display("Error in Rdst...");
        end


        if(Rsrc1_addr <= 31 && Rsrc1_addr >= 0)
                Rsrc1 <= R[Rsrc1_addr];
        else
            $display("Error in Rscr1_addr...");
        

        if(Rsrc2_addr <= 31 && Rsrc2_addr >= 0)
                Rsrc2 <= R[Rsrc2_addr];
        else
            $display("Error in Rscr2_addr...");
    end
    
endmodule
