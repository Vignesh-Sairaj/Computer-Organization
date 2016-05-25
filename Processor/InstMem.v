/*
INSTRUCTION SET ARCHITECHTURE

BITS [31:28] VALUES:

1 -- ALU
2 -- CONTROL
4 -- MEM
8 -- CONSTANT

I.  ALU-BITS:

    [27:24] -- OPCODE 4-bit
    [23:19] -- Rsrc1_addr 5-bit 
    [18:14] -- Rsrc2_addr 5-bit 
    [13:9]  -- Rdst_addr 5-bit 

    ALU-OpCode (Values):
    0  -- ADD
    1  -- SUB
    2  -- MUL
    3  -- ShL
    4  -- ShR
    5  -- RoL
    6  -- RoR
    7  -- AND
    8  -- OR
    9  -- NOR
    10 -- NAND #Switched#
    11 -- XOR
    12 -- XNOR
    13 -- NOT #Switched#
    14 -- CMP
    15 -- NEG

II. CONTROL-BITS:
    [27:25] -- OpCode 3-bit
    [24:13] -- Address (only for BUN/BSA) 10-bit

    CONTROL-OpCode
    0  -- BUN
    1  -- BSA
    2  -- RET
    3  -- HLT
    4  -- SIZ
    5  -- SNZ
    6  -- SIV
    7  -- SNV

III. MEMORY REFERENCE-BITS
    [27]    -- Write/Read 1-bit
    [26:22] -- Reg Address 5-bit
    [21:12] -- Data Mem Address 10-bit

IV. FORCE CONSTANT-BITS
    [27:23] -- Register Address 5-bit 
    [22:7]  -- Constant Data 16-bit

*/

module InstMem(imWrDat, imReDat, imWrDat_addr, imReDat_addr, imWrite);
    
    input imWrite;
    input [31:0] imWrDat;
    input [9:0] imWrDat_addr, imReDat_addr;
    output reg [31:0] imReDat;


    reg [31:0] IM [0:2**10-1];
    

    integer i;
    
    initial begin
        
        for(i = 0; i < 2**10-1; i = i+1) begin
            IM[i] = 32'd0;
        end
        //FRC R0 to 9
        IM[0][31:28] = 4'd8;
        IM[0][27:23] = 5'd0;
        IM[0][22:7] = 16'd9;

        //FRC R1 to 8
        IM[1][31:28] = 4'd8;
        IM[1][27:23] = 5'd1;
        IM[1][22:7] = 16'd8;

        // R1-R2->R3
        IM[2][31:28] = 4'd1;
        IM[2][27:24] = 4'd1;
        IM[2][23:19] = 5'd0;
        IM[2][18:14] = 5'd1;
        IM[2][13:9] = 5'd2;

        //SNZ
        IM[3][31:28] = 4'd2;
        IM[3][27:25] = 3'd5;

        //BSA TO IM[100]
        IM[4][31:28] = 4'd2;
        IM[4][27:25] = 3'd1;
        IM[4][24:13] = 10'd100;


        //STORE FROM R2 TO M0
        IM[100][31:28] = 4'd4;
        IM[100][27] = 1'd1;
        IM[100][26:22] = 5'd2;
        IM[100][21:12] = 10'd0;

        //RET
        IM[101][31:28] = 4'd2;
        IM[101][27:25] = 3'd2;

        //LOAD FROM M0 TO R3
        IM[5][31:28] = 4'd4;
        IM[5][27] = 1'd0;
        IM[5][26:22] = 5'd3;
        IM[5][21:12] = 10'd0;

        //HLT
        IM[6][31:28] = 4'd2;
        IM[6][27:25] = 3'd3;

/*        IM[0] = 32'b_1000__00000__0000_0000_0000_1000__0000000; //FRC R0 to 8
        IM[1] = 32'b_1000__00001__0000_0000_0000_0010__0000000; //FRC R1 to 2

        IM[2] = 32'b_0001__0000__00000__00001__00010__000_000_000; // R1+R2->R3

        IM[3] = 32'b_0010__011__00000_00000_00000_00000_00000; //HLT*/

    end
        
    always @ (*) begin
        
        if(imWrite) begin
        
            if(imWrDat_addr <= 2**10-1 && imWrDat_addr >= 0)
                IM[imWrDat_addr] = imWrDat;
            else
                $display("Error in imWrDat_addr...");
        end

        if(imReDat_addr <= 2**10-1 && imReDat_addr >= 0)
                imReDat = IM[imReDat_addr];
        else
            $display("Error in imReDat_addr...");
        
    end
    
endmodule