`timescale 1ns/1ns
`include "A1Q3_three_to_eight_decoder.v"

module test_decoder();

    reg [2:0] I;
    wire [7:0] Y;
    reg E;
    three_to_eight_decoder decode(I, Y, E);
    initial begin
        E = 1'b0;
        I = 3'b000;
        #5 I = 3'b001;
        #5 I = 3'b010;
        #5 I = 3'b011;
        #5 I = 3'b100;
        #5 I = 3'b101;
        #5 I = 3'b110;
        #5 I = 3'b111;
        #5 
        begin 
            E = 1'b1;
            I = 3'b000;
        end
        #5 I = 3'b001;
        #5 I = 3'b010;
        #5 I = 3'b011;
        #5 I = 3'b100;
        #5 I = 3'b101;
        #5 I = 3'b110;
        #5 I = 3'b111;
        #5 $finish;
    end

    initial begin
         $monitor("E = ", E, " I = %b", I, " Y0 = ", Y[0], " Y1 = ", Y[1], " Y2 = ", Y[2], " Y3 = ", Y[3], " Y4 = ", Y[4]
         , " Y5 = ", Y[5], " Y6 = ", Y[6], " Y7 = ", Y[7]);
    end

    

endmodule