`include "A1Q1_one_bit_full_adder.v"
module adder_8(cout,s,a,b);
    //I/O declaration
    output[7:0] s;
    output cout;
    input[7:0] a,b;
    //internalwire
    wire d1,d2,d3,d4,d5,d6,d7;
    //module instantaion
    adder_1 i1(s[0],d1,a[0],b[0],1'b0);
    adder_1 i2(s[1],d2,a[1],b[1],d1);
    adder_1 i3(s[2],d3,a[2],b[2],d2);
    adder_1 i4(s[3],d4,a[3],b[3],d3);
    adder_1 i5(s[4],d5,a[4],b[4],d4);
    adder_1 i6(s[5],d6,a[5],b[5],d5);
    adder_1 i7(s[6],d7,a[6],b[6],d6);
    adder_1 i8(s[7],cout,a[7],b[7],d7);
endmodule