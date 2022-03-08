//this module take a,b as input and give the addition or subtraction
//(in 2's complement) as output on the basis of op code.
module add_sub_top(out,ovflow,a,b,opcode);
//I/O variables
    input [7:0] a,b;
    output [7:0] out;
    input opcode;
    output ovflow;
    //internal wires
    wire c2,c3,c4,c5,c6,c7,c8,c9;
    //module instantations
    one_bit_add_sub a1 (a[0],b[0],opcode,opcode,c2,out[0]);
    one_bit_add_sub a2 (a[1],b[1],opcode,c2,c3,out[1]);
    one_bit_add_sub a3 (a[2],b[2],opcode,c3,c4,out[2]);
    one_bit_add_sub a4 (a[3],b[3],opcode,c4,c5,out[3]);
    one_bit_add_sub a5 (a[4],b[4],opcode,c5,c6,out[4]);
    one_bit_add_sub a6 (a[5],b[5],opcode,c6,c7,out[5]);
    one_bit_add_sub a7 (a[6],b[6],opcode,c7,c8,out[6]);
    one_bit_add_sub a8 (a[7],b[7],opcode,c8,c9,out[7]);
    xor (ovflow,c8,c9);
endmodule

//This module is used by top module this is called by top module
// and it is sued for 1bit addition or subtraction
module one_bit_add_sub(a,b,opcode,cin,cout,sum);
    // I/O variables
    input a,b,opcode,cin;
    output sum,cout;
    //internal wires
    wire t,temp1,temp2,temp3,temp4;
    //module instantations
    xor(t,b,opcode);
    xor(temp1,a,t);
    xor(sum,cin,temp1);
    and(temp2,cin,a);
    and(temp3,cin,t);
    and(temp4,a,t);
    or(cout,temp2,temp3,temp4);
endmodule