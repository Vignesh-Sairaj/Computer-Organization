module mux_2x1(In, Select, out);

    input [1:0] In;
    input Select;

    output out;
    
    assign out = (~Select & In[0]) | (Select & In[1]);
    
endmodule
