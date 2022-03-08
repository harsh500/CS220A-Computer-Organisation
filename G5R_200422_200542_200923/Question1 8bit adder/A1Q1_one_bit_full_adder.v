// Gate level implementation of adder
module adder_1(s,cout,a,b,cin);//1-bit adder
    //I/O declaration
    output cout,s;                  
    input a,b,cin;
    //internalwire
    wire y1,y2,y3;
    //module instantaion
    and (y1,a,cin);
    and (y2,a,b);
    and (y3,b,cin);
    or(cout,y1,y2,y3);
    xor(s, cin, a, b);
endmodule