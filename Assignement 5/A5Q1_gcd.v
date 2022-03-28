module gcd(clk, a, b, out, reset, enable);

    // Port declarations
    input [7:0] a, b;
    input reset, clk, enable;
    output reg [7:0] out;
    reg en;
    integer count;
    reg [7:0] u1, y;

    always@(enable) begin
        en = 0;
    end

    // sequential logic
    always @(posedge clk) begin
           
        if (en == 0) begin    
            if(reset) begin
                u1 <= a;
                y <= b;
                count = 0;
            end
            // various conditions of the two nos' parity
            else if (u1 != y) begin
                // both even
                if (u1[0] == 0 && y[0] == 0) begin
                    u1 <= u1 >> 1;
                    y <= y >> 1;
                    count = count + 1;
                end
                // one is odd, other is even
                else if (u1[0] == 1 && y[0] == 0) begin
                    y <= y >> 1;
                end
                // one is odd, other is even
                else if (u1[0] == 0 && y[0] == 1) begin
                    u1 <= u1 >> 1;
                end
                // both odd
                else begin
                    if (u1 >= y) begin
                        u1 <= (u1 - y) >> 1;
                    end
                    else begin
                        y <= (y - u1) >> 1;
                    end
                end
            end
            else begin
                while (count > 0) begin
                    u1 = u1 << 1;
                    count -= 1;
                end
                out = u1;
                en = 1;
            end
        end
        else begin
            // IDLE state
        end
    end

endmodule