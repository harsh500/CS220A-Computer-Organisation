//D flip-flop - used to construct the Johnson Counter

module D_FF(q, d, clk, reset);

    output q, qbar;
    input d, clk, reset;
    reg q;
    
    always@(posedge clk) begin
        if(reset)
            q <= 1'b0;
        else
            q <= d;
    end
    
endmodule