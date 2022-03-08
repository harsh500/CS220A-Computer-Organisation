//this is the test-bench of 15 cases

`timescale 1ns/1ns
`include "A2Q1_eight_bit_carry_lookahead_adder.v"

module adder_8_tb();
//I/O declaration
reg[7:0] a,b;
reg c_in;
wire[7:0] sum;
wire c_out;
// module instantation
claadd8 h(sum,c_out,a,b,c_in);
initial begin
    $dumpfile("adder_8_tb.vcd");
    $dumpvars(0,adder_8_tb);    
end
initial begin
    //test cases
    $monitor("a=%b   b=%b  c_in=%b  a+b=%b   carry_out=%b",a,b,c_in,sum,c_out);
    a=8'b00000000;
    b=8'b00000000;
    c_in=1'b1;
    
    #5 
    a=8'b00000001;
    b=8'b00000000;
    c_in=1'b1;
    
    #5 
    a=8'b00000001;
    b=8'b00010000;
    c_in=1'b1;
    
    #5 
    a=8'b10101100;
    b=8'b10011111;
    c_in=1'b1;
    
    #5 
    a=8'b10100000;
    b=8'b10000110;
    c_in=1'b1;
    
    #5 
    a=8'b01100000;
    b=8'b00010101;
    c_in=1'b0;
    
    #5 
    a=8'b00001011;
    b=8'b11010000;
    c_in=1'b0;
    
    #5 
    a=8'b01010010;
    b=8'b11001000;
    c_in=1'b0;
    
    #5 
    a=8'b00010100;
    b=8'b11110001;
    c_in=1'b0;
    
    #5 
    a=8'b00011010;
    b=8'b10101000;
    c_in=1'b0;
    
    #5 
    a=8'b00101000;
    b=8'b11111111;
    c_in=1'b1;
    
    #5 
    a=8'b00111000;
    b=8'b11100010;
    c_in=1'b1;
    
    #5 
    a=8'b00011110;
    b=8'b01100000;
    c_in=1'b1;
    
    #5 
    a=8'b00011110;
    b=8'b01010000;
    c_in=1'b1;
    
    #5 
    a=8'b00111000;
    b=8'b11111110;
    c_in=1'b1;
    
    #5
    $finish;
end
endmodule