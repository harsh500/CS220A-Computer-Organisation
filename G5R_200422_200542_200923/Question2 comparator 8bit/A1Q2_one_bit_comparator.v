// Gate-level implementation of comparator
module comparator_1(g,e,l,a,b);
    //I/O
    input a,b;
    output g,e,l;
    //wire connection
    and (l,~a,b);
    and (g,~b,a);
    xnor (e,a,b);
endmodule