`include "A1Q4_priority_encoder.v"

// Define the stimulus (top level module OR test-bench)
module stimulus;
    // Set up variables
    reg [7:0] IN;
    wire [2:0] OUT;
    // Instantiate the priority encoder
    pencoder obj(OUT, IN);
    // Setup the monitoring for the signal values
    initial
        begin
        $monitor($time," IN= %b, OUT=%b\n",IN,OUT);
        end
    // Stimulate inputs
    
    initial
        begin
        //We are using Blocking assignments so as to avoid any complications (race)
        #0 IN = 8'b00000000;
        #5 IN = 8'b00001001;
        #5 IN = 8'b01010010;
        #5 IN = 8'b11100100;
        #5 IN = 8'b01011000;
        #5 IN = 8'b10110000;
        #5 IN = 8'b00100000;
        #5 IN = 8'b11000000;
        #5 IN = 8'b10000000;
           
        end    
endmodule

