module Memory(MIn, MAddr, mRead, mWrite, MOut, clk);
    
    input clk, mRead, mWrite;
    input [15:0] MIn, MAddr;
    output [15:0] MOut;
    
    
    reg [15:0] M [0:65535];
    
    integer i;
    
    initial begin
    
        for(i = 0; i < 65535; i = i+1)
            M[i] = 16'h0000; //Updated So far...
    end
    
    always @ (posedge clk) begin
    
        if(Rwrite) begin
        
            case (Rdst_addr)
                5'd0: R[0] <= Rdst;
                5'd1: R[1] <= Rdst;
                5'd2: R[2] <= Rdst;
                5'd3: R[3] <= Rdst;
                5'd4: R[4] <= Rdst;
                5'd5: R[5] <= Rdst;
                5'd6: R[6] <= Rdst;
                5'd7: R[7] <= Rdst;
                5'd8: R[8] <= Rdst;
                5'd9: R[9] <= Rdst;
                5'd10: R[10] <= Rdst;
                5'd11: R[11] <= Rdst;
                5'd12: R[12] <= Rdst;
                5'd13: R[13] <= Rdst;
                5'd14: R[14] <= Rdst;
                5'd15: R[15] <= Rdst;
                5'd16: R[16] <= Rdst;
                5'd17: R[17] <= Rdst;
                5'd18: R[18] <= Rdst;
                5'd19: R[19] <= Rdst;
                5'd20: R[20] <= Rdst;
                5'd21: R[21] <= Rdst;
                5'd22: R[22] <= Rdst;
                5'd23: R[23] <= Rdst;
                5'd24: R[24] <= Rdst;
                5'd25: R[25] <= Rdst;
                5'd26: R[26] <= Rdst;
                5'd27: R[27] <= Rdst;
                5'd28: R[28] <= Rdst;
                5'd29: R[29] <= Rdst;
                5'd30: R[30] <= Rdst;
                5'd31: R[31] <= Rdst;
                default: $display("Error in Rdst...");
            endcase
        end
        
        case (Rsrc1_addr)
            5'd0: Rsrc1 <= R[0];
            5'd1: Rsrc1 <= R[1];
            5'd2: Rsrc1 <= R[2];
            5'd3: Rsrc1 <= R[3];
            5'd4: Rsrc1 <= R[4];
            5'd5: Rsrc1 <= R[5];
            5'd6: Rsrc1 <= R[6];
            5'd7: Rsrc1 <= R[7];
            5'd8: Rsrc1 <= R[8];
            5'd9: Rsrc1 <= R[9];
            5'd10: Rsrc1 <= R[10];
            5'd11: Rsrc1 <= R[11];
            5'd12: Rsrc1 <= R[12];
            5'd13: Rsrc1 <= R[13];
            5'd14: Rsrc1 <= R[14];
            5'd15: Rsrc1 <= R[15];
            5'd16: Rsrc1 <= R[16];
            5'd17: Rsrc1 <= R[17];
            5'd18: Rsrc1 <= R[18];
            5'd19: Rsrc1 <= R[19];
            5'd20: Rsrc1 <= R[20];
            5'd21: Rsrc1 <= R[21];
            5'd22: Rsrc1 <= R[22];
            5'd23: Rsrc1 <= R[23];
            5'd24: Rsrc1 <= R[24];
            5'd25: Rsrc1 <= R[25];
            5'd26: Rsrc1 <= R[26];
            5'd27: Rsrc1 <= R[27];
            5'd28: Rsrc1 <= R[28];
            5'd29: Rsrc1 <= R[29];
            5'd30: Rsrc1 <= R[30];
            5'd31: Rsrc1 <= R[31];
            default: $display("Error in Rscr1_addr...");
        endcase
        
        case (Rsrc2_addr)
            5'd0: Rsrc2 <= R[0];
            5'd1: Rsrc2 <= R[1];
            5'd2: Rsrc2 <= R[2];
            5'd3: Rsrc2 <= R[3];
            5'd4: Rsrc2 <= R[4];
            5'd5: Rsrc2 <= R[5];
            5'd6: Rsrc2 <= R[6];
            5'd7: Rsrc2 <= R[7];
            5'd8: Rsrc2 <= R[8];
            5'd9: Rsrc2 <= R[9];
            5'd10: Rsrc2 <= R[10];
            5'd11: Rsrc2 <= R[11];
            5'd12: Rsrc2 <= R[12];
            5'd13: Rsrc2 <= R[13];
            5'd14: Rsrc2 <= R[14];
            5'd15: Rsrc2 <= R[15];
            5'd16: Rsrc2 <= R[16];
            5'd17: Rsrc2 <= R[17];
            5'd18: Rsrc2 <= R[18];
            5'd19: Rsrc2 <= R[19];
            5'd20: Rsrc2 <= R[20];
            5'd21: Rsrc2 <= R[21];
            5'd22: Rsrc2 <= R[22];
            5'd23: Rsrc2 <= R[23];
            5'd24: Rsrc2 <= R[24];
            5'd25: Rsrc2 <= R[25];
            5'd26: Rsrc2 <= R[26];
            5'd27: Rsrc2 <= R[27];
            5'd28: Rsrc2 <= R[28];
            5'd29: Rsrc2 <= R[29];
            5'd30: Rsrc2 <= R[30];
            5'd31: Rsrc2 <= R[31];
            default: $display("Error in Rscr1_addr...");
        endcase
        
    end
    
endmodule
