`include "A1Q3_two_to_four_decoder.v"

module three_to_eight_decoder(I, Y, E);
    
    input[2:0] I;
    input E;
    output[7:0] Y;
    two_to_four_decoder t0(I[1:0], Y[3:0], E & (!I[2]));
    two_to_four_decoder t1(I[1:0], Y[7:4], E & I[2]);

endmodule