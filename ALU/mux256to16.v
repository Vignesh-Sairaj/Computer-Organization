module mux256to16(in0, in1, in2, in3, in4, in5, in6, in7, sel[2:0], out);

    input [31:0] in0, in1, in2, in3, in4, in5, in6, in7;
    input [2:0] sel;
    output [31:0] out;
    
    assign out = s[2] ? ( s[1] ? (s[0] ? in7 : in6)  :  (s[0] ?  in5  :  in4) ) : 
                        ( s[1] ? (s[0] ? in3 : in2)  :  (s[0] ?  in1  :  in0) );

endmodule
