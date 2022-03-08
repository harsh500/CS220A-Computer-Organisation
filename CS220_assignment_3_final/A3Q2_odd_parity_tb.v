`include "A3Q2_odd_parity.v"
`timescale 1ns/1ps
module oddparity_tb();
//input 3bits and output 1 bit
reg [0:2] in;
wire parity;
reg clk;
initial clk = 1;
reg reset=1'b0;
//our clk cycle is of 1.25 time units
always #0.625 clk = ~clk;
//module instantations
topodd h (parity,in,clk);
initial begin
    $dumpfile("oddparity_tb.vcd");
    $dumpvars(0,oddparity_tb);    
end
initial begin
    //our fsm take 1 bit in each clk cyle and give the output
    //so it takes 4 clk cycle to compute the parity bit
    #5
    in=3'b000;
    #5
    $display("parity=%b for input=%b",parity,in,);
    in=3'b001;
    #5
    $display("parity=%b for input=%b ",parity,in);
    in=3'b101;
    #5
    $display("parity=%b for input=%b ",parity,in);
    in=3'b111;
    #5
    $display("parity=%b for input=%b ",parity,in);
    in=3'b110;
    #5
    $display("parity=%b for input=%b ",parity,in);
    in=3'b100;
    #5
    $display("parity=%b for input=%b ",parity,in);
    in=3'b011;
    #5
    $display("parity=%b for input=%b ",parity,in);
    in=3'b110;
    #5
    $display("parity=%b for input=%b ",parity,in);
    $finish;
end
endmodule