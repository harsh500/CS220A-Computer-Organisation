`include "A2Q2_D_flip_flop.v"

module johnson_counter(q, clk, reset);
    //declaring the ports
    inout [7:0]q;
    input clk, reset;
    //declaring the 8 D flip-flops which together make the Johnson counter
    D_FF d_ff0(q[7], ~q[0], clk, reset);
    D_FF d_ff1(q[6], q[7], clk, reset);
    D_FF d_ff2(q[5], q[6], clk, reset);
    D_FF d_ff3(q[4], q[5], clk, reset);
    D_FF d_ff4(q[3], q[4], clk, reset);
    D_FF d_ff5(q[2], q[3], clk ,reset);
    D_FF d_ff6(q[1], q[2], clk ,reset);
    D_FF d_ff7(q[0], q[1], clk, reset);

endmodule