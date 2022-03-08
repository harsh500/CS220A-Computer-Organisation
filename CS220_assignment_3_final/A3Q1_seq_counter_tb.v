`timescale 1ns/1ps
`include "A3Q1_seq_counter.v"

module test_seq_counter;

    reg clk;        //clock
    reg in;         //input
    wire out;       //output
    reg reset;      //reset
    initial begin
        clk = 1;
        reset = 1;
    end
    seq_counter s(clk, reset, in, out);
    
    always #2.50 clk = ~clk;        //time period of clock is 5 time units

    always @(posedge clk) begin
        #1 $display("In = %b, Out = %b, Time = %3t", in, out, $time);
    end

    initial begin
        $dumpfile("test_seq_counter.vcd");
        $dumpvars(0, test_seq_counter);
    end
  
    initial begin
        // giving the test cases
        #1.5 in = 0;
        #5 reset = 0;
        #5 in = 1;
        #5 in = 0;
        #5 in = 1;
        #5 in = 0;      //expecting output 1 here
        #5 in = 0;
        #5 in = 1;
        #5 in = 0;
        #5 in = 1;
        #5 in = 0;      //expecting output 1 here
        #5 in = 0;
        #5 in = 1;
        #5 in = 1;
        #5 in = 0;
        #5 in = 1;
        #5 $finish;
    end


endmodule