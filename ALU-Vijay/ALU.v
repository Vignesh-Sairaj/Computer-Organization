module ALU(A, B, Sel, Out_1, Out_0, cFlag, zFlag, vFlag);

   input [15:0] A, B;
   input [3:0]  Sel;
   
   output reg [15:0] Out_1, Out_0;
   output reg cFlag, zFlag, vFlag;
   
   reg [15:0] B2comp, A2comp;
   
   reg cFlag_N;

   always @ (*) begin
   
        vFlag = 0;
        cFlag = 0;
        zFlag = 0;
        Out_1 = 16'd0;


        B2comp = (~B) + 16'd1;
        A2comp = (~A) + 16'd1;

        case(Sel)
    
            4'd0: begin //ADD
                {cFlag, Out_0} = A + B;
                
            end
            
            4'd1: begin //SUB           
                {cFlag_N, Out_0} = A + B2comp; //Adding 2s Complement
                cFlag = ~cFlag_N;
            end
            
            4'd2: begin //MUL
                {Out_1, Out_0} = A * B;
            end
            
            4'd3: begin //ShL
                Out_0 = A << 1;
                cFlag = A[15];
            end
            
            4'd4: begin //ShR
                Out_0 = A >> 1;
            end
            

            4'd5: begin //RoL
                Out_0 = A << 1;
                Out_0[0] = A[15];
            end
            
            4'd6: begin //RoR
                Out_0 = A >> 1;
                Out_0[15] = A[0];
            end
            
            4'd7: begin //AND 
                Out_0 = A & B;
            end

            
            4'd8: begin //OR
                Out_0 = A | B;
            end

            //New

            4'd9: begin //NOR (|)
                Out_0 = A ~| B;
            end

            4'd10: begin //NAND (~)
                Out_0 = A ~& B;
            end

            4'd11: begin //XOR
                Out_0 = A ^ B;
            end

            4'd12: begin //XNOR
                Out_0 = A ~^ B;
            end

            4'd13: begin //NOT
                Out_0 = ~ A;
            end

            4'd14: begin //CMP
                if (A == B) begin 
                    Out_0 = 16'd0;
                end
                if (A < B) begin 
                    Out_0 = 16'd1;
                end
                if (A > B) begin 
                    Out_0 = 16'd2;
                end
            end

            4'd15: begin //NEG
                Out_0 = A2comp;
            end

            

            default: $display("Error in ALU-Sel...");
        endcase
        vFlag = ~cFlag;
        zFlag = ~|(Out_0[15:0]);
   end
   
endmodule
