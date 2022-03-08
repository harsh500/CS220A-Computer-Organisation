`timescale 1ns/1ns
`include "A1Q1_eight_bit_full_adder.v"
module adder_8_tb();
//I/O declaration
reg[7:0] a,b;
wire[7:0] sum;
wire cout;
// module instantation
adder_8 h(cout,sum,a,b);
initial begin
    $dumpfile("adder_8_tb.vcd");
    $dumpvars(0,adder_8_tb);    
end
initial begin
    //test cases
    $monitor("a=%b   b=%b   a+b=%b   carry_out=%b",a,b,sum,cout);
    a=8'b00000000;
    b=8'b00000000;
    #5 
    a=8'b00000001;
    b=8'b00000000;
    #5 
    a=8'b00000001;
    b=8'b00010000;
    #5 
    a=8'b10101100;
    b=8'b10011111;
    #5 
    a=8'b10100000;
    b=8'b10000110;
    #5 
    a=8'b01100000;
    b=8'b00010101;
    #5 
    a=8'b00001011;
    b=8'b11010000;
    #5 
    a=8'b01010010;
    b=8'b11001000;
    #5 
    a=8'b00010100;
    b=8'b11110001;
    #5 
    a=8'b00011010;
    b=8'b10101000;
    #5 
    a=8'b00101000;
    b=8'b11111111;
    #5 
    a=8'b00111000;
    b=8'b11100010;
    #5 
    a=8'b00011110;
    b=8'b01100000;
    #5 
    a=8'b00011110;
    b=8'b01010000;
    #5 
    a=8'b00111000;
    b=8'b11111110;
    #5
    $finish;
end
endmodule