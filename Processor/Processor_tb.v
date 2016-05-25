`include "Processor.v"

module Processor_tb;

    reg clk = 1'b0;

    Processor P(clk);

    initial begin
        #1000
        $finish;
    end

    always begin
        #5 clk = ~clk;
    end

endmodule