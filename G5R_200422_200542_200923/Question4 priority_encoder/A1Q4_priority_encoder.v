// Define a lower bit Priority Encoder via Behavioural level Implementation

module pencoder(out, in);
    // I/O port declarations
    output reg [2:0] out;
    input [7:0] in;

    // define the always block containing switch case block
    always @(in)
    begin    
        // we use masking (to extract digits) followed by or-reduction
        //This is a priority encoder because only 1 if is executed in the guaranteed order of lowest to most significant bit check.
        if (|(in & 8'd1))
            out=3'd0;
        else if(|(in & 8'd2))
            out=3'd1;
        else if(|(in & 8'd4))
            out=3'd2;
        else if(|(in & 8'd8))
            out=3'd3;
        else if(|(in & 8'd16))
            out=3'd4;
        else if(|(in & 8'd32))
            out=3'd5;
        else if(|(in & 8'd64))
            out=3'd6;
        else if(|(in & 8'd128))
            out=3'd7;
        else 
            out = 3'bxxx; 
    end     
endmodule
