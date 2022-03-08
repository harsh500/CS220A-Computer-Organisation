`include "A4Q2_add_sub.v"
module add_sub_tb();
//I/O variable declarations
reg [7:0] a,b;
reg opcode;
wire [7:0] out;
wire ovflow;
// Module instantation
add_sub_top h (out,ovflow,a,b,opcode);
initial begin
    $dumpfile("add_sub.vcd");
    $dumpvars(0,add_sub_tb);    
end
//test cases
initial begin
    $monitor("a=%b b=%b opcode=%b sum=%b overflow=%b ",a,b,opcode,out,ovflow);
    a=8'b00000000;
    b=8'b00000000;
    opcode=1'b0;
    #5
    a=8'b11111111;
    b=8'b10000000;
    opcode=1'b0;   
    #5
    a=8'b00101000;
    b=8'b00000000;
    opcode=1'b1;
    #5
    a=8'b00000000;
    b=8'b01111101;
    opcode=1'b1;
    #5
    a=8'b11100000;
    b=8'b11111111;
    opcode=1'b1;
    #5
    a=8'b00000000;
    b=8'b11111111;
    opcode=1'b1;
    #5
    a=8'b00000000;
    b=8'b00111111;
    opcode=1'b1;
    #5
    a=8'b01010000;
    b=8'b00010100;
    opcode=1'b0;
    #5
    a=8'b01110000;
    b=8'b01111111;
    opcode=1'b1;
    #5
    a=8'b01010110;
    b=8'b11111010;
    opcode=1'b0;
    #5
    a=8'b11100000;
    b=8'b01111111;
    opcode=1'b0;
    #5
    a=8'b00111110;
    b=8'b11110000;
    opcode=1'b1;
    #5
    a=8'b00000000;
    b=8'b11111100;
    opcode=1'b1;
    #5
    a=8'b11111111;
    b=8'b11100000;
    opcode=1'b1;
    #5
    a=8'b01000000;
    b=8'b01000000;
    opcode=1'b0;
    #5
    $finish;
end
endmodule