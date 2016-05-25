
module Memory_Data(Mdst, Msrc1, Mdst_addr, Msrc1_addr,clk, Mwrite);
input clk, Mwrite;
input [20:0] Mdst_addr,Msrc1_addr;
input [15:0] Mdst;
output[15:0] Msrc1;
reg   [15:0] Msrc1;
reg   [15:0] M [0:1048575];
    integer i;
    initial
    begin
        for(i = 0;i < 1048576 ; i = i+1)
            M[i] = 16'h0000;
    end
     always @ (posedge clk) begin

        if(Mwrite)
        begin
             M[Mdst_addr] <= Mdst;
            
        end

        Msrc1 <= M[Msrc1_addr];


end
endmodule
