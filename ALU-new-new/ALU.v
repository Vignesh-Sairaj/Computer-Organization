module ALU(A, B, Sel, Out_1, Out_0, cFlag, zFlag);

   input [15:0] A, B;
   input [3:0]  Sel;
   
   output reg [15:0] Out_1, Out_0;
   output reg cFlag, zFlag;
   
   reg [15:0] B2comp;
   
   reg cFlag_N;

   always @ (*) begin
   
        cFlag = 0;
        Out_1 = 16'd0;

        B2comp = (~B) + 16'h1;

        case(Sel)
    
            4'h0: begin //ADD
                {cFlag, Out_0} = A + B;
                
            end
            
            4'h1: begin //SUB           
                {cFlag_N, Out_0} = A + B2comp; //Adding 2s Complement
                cFlag = ~cFlag_N;
            end
            
            4'h2: begin //MUL
                {Out_1, Out_0} = A * B;
            end
            
            4'h3: begin //ShL
                Out_0 = A << 1;
                cFlag = A[15];
            end
            
            4'h10: begin //ShR
                Out_0 = A >> 1;
            end
            
            //Done So far

            4'h5: begin //BITOR (|)
                Out_0 = A | B;
            end
            
            4'h6: begin //BITXOR (^)
                Out_0 = A ^ B;
            end
            
            4'h7: begin //BITNOT (~)
                Out_0 = ~A;
            end

            
            4'h8: begin //BITAND (&)
                Out_0 = A & B;
            end

            //New

            4'h9: begin //BITOR (|)
                Out_0 = A | B;
            end

            4'h10: begin //BITSHIFT LEFT (~)
                Out_0 = A << 1;
                cFlag = A[15];
            end

            4'h11: begin //BITSHIFT LEFT (~)
                Out_0 = A << 1;
                cFlag = A[15];
            end

            4'h12: begin //BITSHIFT LEFT (~)
                Out_0 = A << 1;
                cFlag = A[15];
            end

            4'h13: begin //BITSHIFT LEFT (~)
                Out_0 = A << 1;
                cFlag = A[15];
            end

            4'h14: begin //BITSHIFT LEFT (~)
                Out_0 = A << 1;
                cFlag = A[15];
            end

            4'h15: begin //BITSHIFT LEFT (~)
                Out_0 = A << 1;
                cFlag = A[15];
            end

            default: $display("Error in ALU-Sel...");
        endcase
        
        zFlag = ~|(Out_0[15:0]);
   end
   
endmodule
