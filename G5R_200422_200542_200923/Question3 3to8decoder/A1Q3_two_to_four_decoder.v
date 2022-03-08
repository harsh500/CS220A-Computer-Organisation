module two_to_four_decoder(I, Y, E);
    
    input[1:0] I;       //two-bit input
    input E;            //the Enable input
    output[3:0] Y;      //4 bit output
    wire[1:0] NI;
    and a0(Y[0], NI[0], NI[1], E);
    and a1(Y[1], I[0], NI[1], E);
    and a2(Y[2], NI[0], I[1], E);
    and a3(Y[3], I[0], I[1], E);
    not n0(NI[0], I[0]);
    not n1(NI[1], I[1]);

endmodule

