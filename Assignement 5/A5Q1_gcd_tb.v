`include "A5Q1_gcd.v"
`timescale 1ns/1ps

module test_gcd;

    // port declarations
    reg [7:0] u1, y;
    reg reset;
    reg clk;
    reg en;
    wire [7:0] ans;
    gcd g(clk, u1, y, ans, reset, en);

    initial begin
        $dumpfile("gcd_behavioural_tb.vcd");
        $dumpvars(0, test_gcd);
    end
    initial begin 
        clk = 0;
        en = 0;
    end
    always begin
        #0.1 clk = ~clk;
    end

    
    initial begin
        #5
        
        en = ~en;
        reset = 1;
        u1 = 200;
        y = 68;
        #0.6 reset = 0;

        #5
        $display("a = %d, b = %d, gcd = %d", u1, y, ans);
        reset = 1;
        u1 = 120;
        y = 40;
        en= 0;
        #0.6 reset = 0;

        #5
        $display("a = %d, b = %d, gcd = %d", u1, y, ans);
        en = ~en;
        reset = 1;
        u1 = 200;
        y = 250;
        #0.6 reset = 0;

        #5
        $display("a = %d, b = %d, gcd = %d", u1, y, ans);
        en = ~en;
        reset = 1;
        u1 = 100;
        y = 102;
        #0.6 reset = 0;

        #5
        $display("a = %d, b = %d, gcd = %d", u1, y, ans);
        en = ~en;
        reset = 1;
        u1 = 255;
        y = 2;
        #0.6 reset = 0;
       

        #5 
        $display("a = %d, b = %d, gcd = %d", u1, y, ans);
        en = ~en;
        reset = 1;
        u1 = 20;
        y = 24;
        #0.6 reset = 0;

        #5 
        $display("a = %d, b = %d, gcd = %d", u1, y, ans);
        en = ~en;
        reset = 1;
        u1 = 21;
        y = 24;
        #0.6 reset = 0;

        #5 
        $display("a = %d, b = %d, gcd = %d", u1, y, ans);
        en = ~en;
        reset = 1;
        u1 = 10;
        y = 15;
        #0.6 reset = 0;

        #5 
        $display("a = %d, b = %d, gcd = %d", u1, y, ans);
        en = ~en;
        reset = 1;
        u1 = 2;
        y = 2;
        #0.6 reset = 0;

        #5 
        $display("a = %d, b = %d, gcd = %d", u1, y, ans);
        en = ~en;
        reset = 1;
        u1 = 5;
        y = 4;
        #0.6 reset = 0;

        #5 
        $display("a = %d, b = %d, gcd = %d", u1, y, ans);
        en = ~en;
        reset = 1;
        u1 = 55;
        y = 66;
        #0.6 reset = 0;

        #5 
        $display("a = %d, b = %d, gcd = %d", u1, y, ans);
        en = ~en;
        reset = 1;
        u1 = 78;
        y = 169;
        #0.6 reset = 0;

        #5 
        $display("a = %d, b = %d, gcd = %d", u1, y, ans);
        en = ~en;
        reset = 1;
        u1 = 20;
        y = 43;
        #0.6 reset = 0;

        

        #5 
        $display("a = %d, b = %d, gcd = %d", u1, y, ans);
        en = ~en;
        reset = 1;
        u1 = 100;
        y = 72;
        #0.6 reset = 0;

        #5 
        $display("a = %d, b = %d, gcd = %d", u1, y, ans);
        en = ~en;
        reset = 1;
        u1 = 153;
        y = 18;
        #0.6 reset = 0;

        #5 
        $display("a = %d, b = %d, gcd = %d", u1, y, ans);
        en = ~en;
        reset = 1;
        u1 = 225;
        y = 20;
        #0.6 reset = 0;
        #1000 $finish;
    end

endmodule