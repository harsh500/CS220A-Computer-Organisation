`timescale 1ns/1ps

module topodd(pari,inp,clk);
//this module is used to give our fsm 1bit at a time
    inout pari;
    input clk;
    input [0:2] inp;
    reg d;
    //initial reset=1'b0;
    reg st=0;
    oddparity m (pari,d,clk,st);
    integer i=0;
    always @(posedge clk) begin:givingbit
        if(i<3) begin
            st=0;
            d=inp[i];
        end
        i=i+1;
// at i=4 we calculate the parity bit and reset the states and i
        if(i==4)begin
            st=1;
            i=0;
        end
    end
endmodule
module oddparity(parity,inp,clk,st);
//I/O wire and reg
    input clk,inp,st;
    output reg parity;
    reg curr_state, next_state;
    parameter s0 =1'b0,s1=1'b1,IDLE=1'b0 ;
    initial begin
        curr_state=IDLE;
    end
    // we calculate state at negedge to avoid the race
    always @(negedge clk) begin:FSM
        next_state = 1'b1;
        case(curr_state)
        s0 : if (inp == 1'b0) begin
            next_state = s0;
            end else begin
            next_state= s1;
            end 
        s1 : if (inp == 1'b0) begin
            next_state = s1;
            end else begin
            next_state = s0;
            end
        default : next_state = IDLE;
        endcase
    end
    // we set next state at positive edge 
    always @ (posedge clk) begin : FSM_SEQ
        if(st==1'b1)begin
            curr_state<=IDLE;
        end
        else begin
            curr_state<=next_state;
        end
    end
    // we calculate parity using curr_states
    always @ (negedge clk) begin : OUTPUT_LOGIC
        case(curr_state)
            s0 : begin
            parity <= 1'b1;
            end
            s1 : begin
            parity <= 1'b0;
            end
        endcase
    end
endmodule