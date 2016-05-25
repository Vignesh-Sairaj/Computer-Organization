module ALU(A, B, Sel, Out, cFlag, zFlag);
   input [15:0] A, B;
   input [3:0] 	Sel;
   
   output reg [15:0] Out;
   output reg cFlag, zFlag;
   
   reg [15:0] B2comp;
   
   reg cFlag_N;

   always @ (*) begin
   
        cFlag = 0;

        case(Sel)
	
	        4'h0: begin //ADD
                {cFlag, Out} = A + B;
                
	        end
	        
	        4'h1: begin //SUB	        
	            B2comp = (~B) + 1;
	            {cFlag_N, Out} = A + B2comp; //Adding 2s Complement
	            cFlag = ~cFlag_N;
	        end
	        
	        4'h2: begin //INC
                {cFlag, Out} = A + 1;
            end
	        
	        4'h3: begin //DEC
                Out = A - 1;
                
                cFlag = ~|(A[15:0]);
	        end
	        
	        4'h4: begin //BITAND (&)
                Out = A & B;
	        end
	        
	        4'h5: begin //BITOR (|)
                Out = A | B;
	        end
	        
	        4'h6: begin //BITXOR (^)
                Out = A ^ B;
	        end
	        
	        4'h7: begin //BITNOT (~)
                Out = ~A;
	        end
	        
	        4'h8: begin //BITSHIFT LEFT (~)
                Out = A << 1;
                cFlag = A[15];
	        end
	        
	        default: $display("Error in ALU-Sel...");
        endcase
        
        zFlag = ~|(Out[15:0]);
   end
   
endmodule
