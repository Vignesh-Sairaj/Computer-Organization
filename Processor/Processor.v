`include "ALU.v"
`include "Registers.v"
`include "InstMem.v"
`include "DataMem.v"

module Processor(clk);

    input clk;

    reg halt;
    reg [3:0] seqCtr = 4'd0; //INIT TO 0
    reg [9:0] progCtr = 10'd0, stacPtr = 10'd1004; //Last 20 elts of InstMem reserved for stack, PC INIT TO 0

    reg [31:0] instruction;



    reg [15:0] A, B;
    reg [3:0] Sel=4'd0;
    wire [15:0] Out_1, Out_0;
    wire cFlag, zFlag, vFlag;

    reg Rwrite = 1'b0; //INIT TO 0
    reg [15:0] Rdst;
    reg [4:0] Rdst_addr = 5'd0, Rsrc1_addr = 5'd0, Rsrc2_addr = 5'd0; //INIT TO 0
    wire [15:0] Rsrc1, Rsrc2;

    reg imWrite = 1'b0; //INIT TO 0
    reg [31:0] imWrDat;
    reg [9:0] imWrDat_addr = 10'd0, imReDat_addr = 10'd0; //INIT TO 0
    wire [31:0] imReDat;

    reg dmWrite = 1'b0; //INIT TO 0
    reg [15:0] dmWrDat;
    reg [9:0] dmWrDat_addr = 10'd0, dmReDat_addr = 10'd0; //INIT TO 0
    wire [15:0] dmReDat;

    //Instantiations
    ALU alu(A, B, Sel, Out_1, Out_0, cFlag, zFlag, vFlag);
    Registers R(Rdst, Rsrc1, Rsrc2, Rdst_addr, Rsrc1_addr, Rsrc2_addr, Rwrite);
    InstMem IM(imWrDat, imReDat, imWrDat_addr, imReDat_addr, imWrite);   
    DataMem DM(dmWrDat, dmReDat, dmWrDat_addr, dmReDat_addr, dmWrite);
    
    always @(posedge clk) begin

        if(halt) begin
            #10000
            ;
        end

        else begin
            if (seqCtr == 0) begin
               imReDat_addr = progCtr;
               
               seqCtr = seqCtr+1;
            end
            
            else if (seqCtr == 1) begin
                instruction = imReDat;
                
                seqCtr = seqCtr+1;
            end

            else if (seqCtr > 1) begin

                case(instruction[31:28])
                
                    4'd1: begin //ALU instr
                        
                        case(seqCtr) //By seq
                        
                            4'd2: begin
                                $display("\n%d) ALU instruction\n", progCtr);
                                
                                Rsrc1_addr = instruction[23:19];
                                Rsrc2_addr = instruction[18:14];
                                
                                progCtr = progCtr+1; //Incr PC
                                seqCtr = seqCtr+1;
                            end
                            
                            4'd3: begin
                                $display("\tOpCode: %h\n", instruction[27:24]);
                                Sel = instruction[27:24];
                                A = Rsrc1;
                                B = Rsrc2;

                                seqCtr = seqCtr+1;
                            end

                            4'd4: begin
                                Rdst = Out_0;
                                Rdst_addr = instruction[13:9];
                                Rwrite = 1'b1;
                                
                                seqCtr = seqCtr+1;
                            end
                            
                            4'd5: begin
                                Rwrite = 1'b0;
                                $display("\t%d <op> %d = %d\n", Rsrc1, Rsrc2, Rdst);
                                
                                seqCtr = 0;
                            end
                            
                        endcase
                    end

                    4'd2: begin //Control Instr
                    
                        case(instruction[27:25]) //opCode
                        
                            3'd0: begin //BUN
                                
                                case(seqCtr) //By seq
                                    4'd2: begin
                                        $display("\n%d) BUN Instruction\n\tBranched to %d\n", progCtr, instruction[24:13]);
                                        progCtr = instruction[24:13];
                                        
                                        seqCtr = 0;
                                    end
                                endcase
                            end
                        
                            3'd1: begin //BSA
                                case(seqCtr) //By seq
                                    4'd2: begin
                                        $display("\n%d) BSA Instruction\n\tBranched to %d\n", progCtr, instruction[24:13]);
                                        progCtr = progCtr+1; //Incr PC
                                        stacPtr = stacPtr+1; //Incr SP
                                        
                                        seqCtr = seqCtr+1;
                                    end
                                    
                                    4'd3: begin //Saving address
                                        imWrDat_addr = stacPtr;
                                        imWrDat = progCtr;
                                        imWrite = 1'b1;
                                        
                                        seqCtr = seqCtr+1;
                                    end
                                    
                                    4'd4: begin //Updating PC
                                        imWrite = 1'b0;
                                        progCtr = instruction[24:13]; //Update PC
                                        
                                        seqCtr = 0;
                                    end
                                    
                                endcase
                            end
                        
                            3'd2: begin //RET
                            
                                case(seqCtr) //By Sequence
                                
                                    4'd2: begin
                                        $display("\n%d)  RET Instruction\n", progCtr);
                                        imReDat_addr = stacPtr;
                                        
                                        seqCtr = seqCtr+1;
                                    end
                                    
                                    4'd3: begin
                                        $display("\tPC returned to %d\n", imReDat);
                                        progCtr = imReDat;
                                        stacPtr = stacPtr - 1;
                                        
                                        seqCtr = 0;
                                    end
 
                                endcase
                            end
                            
                            3'd3: begin //HLT
                            
                                case(seqCtr)
                                
                                    4'd2: begin
                                        $display("\n%d) HLT Instruction\n\n", progCtr);
                                        halt = 1'b1; //CPU Halted
                                        
                                        seqCtr = 0;
                                    end
                                endcase
                            
                            end
                            
                            3'd4: begin //SIZ (skip if 0)
                            
                                case(seqCtr) //In sequence
                                
                                    4'd2: begin
                                        $display("\n%d) SIZ Instruction\n\tskipped? %b\n", progCtr, zFlag);
                                        
                                        if(zFlag) begin
                                            progCtr = progCtr+2;
                                        end
                                        
                                        else begin
                                            progCtr = progCtr+1;
                                        end
                                        
                                        seqCtr = 0;
                                    end
                                endcase
                            
                            end
                            
                            3'd5: begin //SNZ (skip if not 0)
                            
                                case(seqCtr) //In sequence
                                
                                    4'd2: begin
                                        $display("\n%d) SNZ Instruction\n\tskipped? %b\n", progCtr, ~zFlag);
                                        
                                        if(~zFlag) begin
                                            progCtr = progCtr+2;
                                        end
                                        
                                        else begin
                                            progCtr = progCtr+1;
                                        end
                                        
                                        seqCtr = 0;
                                    end
                                endcase
                            
                            end
                            
                            
                            3'd6: begin //SIV (skip if valid)
                            
                                case(seqCtr) //In sequence
                                
                                    4'd2: begin
                                        $display("\n%d) SIV Instruction\n\tskipped? %b\n", progCtr, vFlag);
                                        
                                        if(vFlag) begin
                                            progCtr = progCtr+2;
                                        end
                                        
                                        else begin
                                            progCtr = progCtr+1;
                                        end
                                        
                                        seqCtr = 0;
                                    end
                                endcase
                            
                            end
                            
                            3'd7: begin //SNV (skip if not valid)
                            
                                case(seqCtr) //In sequence
                                
                                    4'd2: begin
                                        $display("\n%d) SNV Instruction\n\tskipped? %b\n", progCtr, ~vFlag);
                                        
                                        if(~vFlag) begin
                                            progCtr = progCtr+2;
                                        end
                                        
                                        else begin
                                            progCtr = progCtr+1;
                                        end
                                        
                                        seqCtr = 0;
                                    end
                                endcase
                            end
                        endcase
                    end

                    4'd4: begin //Memory instructions
                    
                        case(instruction[27]) //Read or Write
                        
                            1'b0: begin //Read instruction (Load)
                            
                                case(seqCtr) //In sequence
                                
                                    4'd2: begin
                                        $display("\n%d) LOAD Instruction, from DM[%d] to R[%d]\n", progCtr, instruction[21:12], instruction[26:22]);
                                        progCtr = progCtr+1; //Incr PC
                                        dmReDat_addr = instruction[21:12];
                                        
                                        seqCtr = seqCtr+1;
                                    end
                                    
                                    4'd3: begin
                                        $display("\tData to be loaded = %d", dmReDat);
                                        Rdst = dmReDat;
                                        Rdst_addr = instruction[26:22];
                                        Rwrite = 1'b1;
                                        
                                        seqCtr = seqCtr+1;
                                    end
                                    
                                    4'd4: begin
                                        Rwrite = 1'b0;
                                        
                                        seqCtr = 0;
                                    end
                                endcase
                            end
                            
                            1'b1: begin //Write (STORE)
                                case(seqCtr) //In sequence
                                
                                    4'd2: begin
                                        $display("\n%d) STORE Instruction, from R[%d] to DM[%d]\n", progCtr, instruction[26:22], instruction[21:12]);
                                        progCtr = progCtr+1; //Incr PC
                                        Rsrc1_addr = instruction[26:22];
                                        
                                        seqCtr = seqCtr+1;
                                    end
                                    
                                    4'd3: begin
                                        $display("\tData to be stored = %d", Rsrc1);
                                        dmWrDat = Rsrc1;
                                        dmWrDat_addr = instruction[21:12];
                                        dmWrite = 1'b1;
                                        
                                        seqCtr = seqCtr+1;
                                    end
                                    
                                    4'd4: begin
                                        dmWrite = 1'b0;
                                        
                                        seqCtr = 0;
                                    end
                                endcase
                            end
                        endcase
                    end

                    4'd8: begin //Force Constant
                    
                        case(seqCtr) //In sequence
                            4'd2: begin
                                $display("\n%d) Force Constant Instruction, to R[%d] value %d\n", progCtr, instruction[27:23], instruction[22:7]);
                                progCtr = progCtr+1; //Incr PC
                                Rdst_addr = instruction[27:23];
                                Rdst = instruction[22:7];
                                Rwrite = 1'b1;
                                
                                seqCtr = seqCtr+1;
                            end
                            
                            4'd3: begin
                                Rwrite = 1'b0;
                                
                                seqCtr = 0;
                            end
                        endcase
                    end
                endcase
            end
        end
    end
endmodule