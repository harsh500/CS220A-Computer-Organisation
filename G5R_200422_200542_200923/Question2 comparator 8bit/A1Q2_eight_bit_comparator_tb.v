`timescale 1ns/1ns
`include "A1Q2_eight_bit_comparator.v"
module comparator_8_tb ();
//I/O
reg[7:0] a,b;
wire G,E,L;
comparator_8 h(G,E,L,a,b);
initial begin
    $dumpfile("comparator_8_tb.vcd");
    $dumpvars(0,comparator_8_tb);    
end
initial begin
    $monitor("a=%b b=%b g=%b e=%b l=%b",a,b,G,E,L);
end
initial begin
    a=8'b10000000;
    b=8'b00100000;
    #5 
    a=8'b00000011;
    b=8'b01000000;
    #5 
    a=8'b00000001;
    b=8'b00010000;
    #5 
    a=8'b00000000;
    b=8'b00000000;
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
    a=8'b10011110;
    b=8'b01100110;
    #5 
    a=8'b11111110;
    b=8'b01010000;
    #5 
    a=8'b11111110;
    b=8'b11111110;
    #5
    $finish;
end
endmodule