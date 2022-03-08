// test bench for 3 bit gray counter

`include "A4Q1_grey.v"
`timescale 1ns/1ps

module grey_tb();

    parameter SIZE = 3;

    //input 3 bits and output 1 bit
    wire [SIZE-1:0] curr_grey;

    //working with clock
    reg clk;
    reg reset;
    initial clk = 0;
    always #0.5 clk = ~clk;

    //module instantiations
    grey_fsm h (clk,reset,op,curr_grey);

    initial 
    begin
        clk=0;
        reset = 0;
        $dumpfile("grey_tb.vcd");
        $dumpvars(0,grey_tb);    
        reset = 1;
        #1 reset = 0;
        #10 reset = 1;
        #1 reset = 0;
        #10.5 $finish;
    end

    // initial begin
    //     $display($time, " Output q = %b , state = %b, reset = %b", op,curr_grey, reset);
    // end

    always #1 $display($time, " Output q = %b , state = %b, reset = %b", op,curr_grey, reset);

endmodule