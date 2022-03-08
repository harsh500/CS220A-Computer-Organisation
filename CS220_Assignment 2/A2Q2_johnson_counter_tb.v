`include "A2Q2_johnson_counter.v"
`timescale 1ns/1ns

module johnson_counter_tb;

    reg clk;
    reg reset;
    initial clk = 0;
    always #5 clk = ~clk;
    wire [7:0]out;
    //module instantiation
    johnson_counter jc(out, clk, reset);

    initial begin
        $monitor("Time = %3t, Output = %b, reset = %b", $time, out, reset);
    end
    initial begin
        reset =1;
        #20 reset = 0;
        #200 $finish;
    end

endmodule