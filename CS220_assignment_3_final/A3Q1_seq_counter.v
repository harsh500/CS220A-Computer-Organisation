// module to detect the sequence 1010
`timescale 1ns/1ps


module seq_counter(clk, reset, in, out);
    //defining the ports
    input clk, reset, in;   
    output out;
    //defining the states
    parameter S0 = 3'b000;  //Idle state
    parameter S1 = 3'b001;  //sequence is . . .1
    parameter S2 = 3'b010;  //sequence is . . .1 0
    parameter S3 = 3'b011;  //sequence us . . .1 0 1
    parameter S4 = 3'b100;  //sequence is . . .1 0 1 0
    reg [4:0] state;
    initial state = S0;
    // Sequential logic
    always @ (posedge clk) begin
        if(reset) begin
            state <= S0;
        end
        else begin
            if(state == S0) begin
                if(in == 0) state <= S0;
                else state <= S1;
            end
            else if(state == S1) begin
                if(in) state <= S1;
                else state <= S2;
            end
            else if(state == S2) begin
                if(in) state <= S3;
                else state <= S0;
            end
            else if(state == S3) begin
                if(in) state <= S1;
                else state <= S4;
            end
            else if(state == S4) begin
                if(in) state <= S1;
                else state <= S3;
            end
            else begin
                state <= S0;
            end

        end
    end
    //combinational logic for output
    assign out = (state == S4) ? 1 : 0;
    


endmodule





    // reg [4:0] next_state;

    // always @ (state or in) begin
    //     case (state)
    //         S0:
    //             if(in) begin
    //                 next_state = S1;
    //             end
    //             else begin
    //                 next_state = S0;
    //             end
    //         S1:
    //             if(in) begin 
    //                 next_state = S1;
    //             end
    //             else begin
    //                 next_state = S2;
    //             end
    //         S2:
    //             if(in) begin 
    //                 next_state = S3;
    //             end
    //             else begin
    //                 next_state = S0;
    //             end
    //         S3:
    //             if(in) begin 
    //                 next_state = S1;
    //             end
    //             else begin
    //                 next_state = S4;
    //             end
    //         S4:
    //             if(in) begin 
    //                 next_state = S3;
    //             end
    //             else begin
    //                 next_state = S0;
    //             end
    //         default: next_state = S0;
    //     endcase

    // end

    // always @(posedge clk) begin 
    //     if(reset) begin
    //         state <= S0;
    //     end
    //     else begin
    //         state <= next_state;
    //     end
        
    // end

    // always @ (posedge clk) begin
    //     if(reset) begin
    //         out <= 1'b0;
    //     end
    //     else begin
    //         if(state == S4) begin
    //             out <= 1'b1;
    //         end
    //         else out <= 1'b0;
    //     end
   // end

