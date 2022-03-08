// Implementing a binary counter in states and implementing the grey counter as a combinational logic
`timescale 1ns/1ps

module grey_fsm(clk,reset,op,curr_grey);
//I/O wire and reg
    
    parameter SIZE=3;

    input clk;
    input reset;
    output reg op;
    output wire [SIZE-1:0] curr_grey;
    
    reg [SIZE-1:0] curr_state, next_state;
    wire [SIZE-1:0] next_grey;
    reg tr, i;
    // Cts. assignments for grey code
    assign next_grey = next_state ^ (next_state >> 1);
    assign curr_grey = curr_state ^ (curr_state >> 1);

    reg [SIZE-1:0] S7;
    reg [SIZE-1:0] S0;
    initial 
    begin
        S0 = 0;
        curr_state=S0;
        S7 = 2**(SIZE)-1;
    end

    // Combinational we calculate state at posedge to avoid the race
    always @(posedge clk) 
    begin : FSM_COMB
        next_state=(curr_state+1) % (2 ** (SIZE)); // taken modulo since state is from S0 to S7
    end

    // we set next state 
    always @ (posedge clk) 
    begin : FSM_SEQ
    if(reset)
        curr_state = S0;
    else
        curr_state<=next_state;
    end

    // we calculate parity using curr_states
    always @ (posedge clk) 
    begin : OUTPUT_LOGIC
        if(curr_state == S7 && next_state == 0)
            op<=1;
        else
            op<=0;
    end

endmodule