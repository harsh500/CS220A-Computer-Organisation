//Dataflow level implementation
module claadd8(sum, c_out, a,b,c_in);
    
    // Inputs and outputs
    output [7:0] sum;
    output c_out; 
    input [7:0] a,b; 
    input c_in;
    
    // Internal wires
    wire p0,g0,
         p1,g1,
         p2,g2,
         p3,g3,
         p4,g4,
         p5,g5,
         p6,g6,
         p7,g7;
         
    wire c7,c6,c5,c4, c3,c2,c1;
    
    // compute the p for each stage
    // we have taken p to be xor BUT it could also have been OR
    assign 
        p0 = a[0]^b[0],
        p1 = a[1]^b[1],
        p2 = a[2]^b[2],
        p3 = a[3]^b[3],
        p4 = a[4]^b[4],
        p5 = a[5]^b[5],
        p6 = a[6]^b[6],
        p7 = a[7]^b[7];

    // compute the g for each stage assign gO
    assign 
        g0 = a[0]&b[0],
        g1 = a[1]&b[1],
        g2 = a[2]&b[2],
        g3 = a[3]&b[3],
        g4 = a[4]&b[4],
        g5 = a[5]&b[5],
        g6 = a[6]&b[6],
        g7 = a[7]&b[7];

    // compute the carry for each stage 
    // Note that c_in is equivalent c0 in the arithmetic equation for
    // carry lookahead computation
    assign 
        c1=g0 | (p0 & c_in),
        c2=g1 | (p1 & g0) | (p1 & p0 & c_in),
        c3=g2 | (p2 & g1) | (p2 & p1 & g0) | (p2 & p1 & p0 & c_in),
        c4=g3 | (p3 & g2) | (p3 & p2 & g1) | (p3 & p2 & p1 & g0) | (p3 & p2 & p1 & p0 & c_in),
        c5=g4 | (p4 & g3) | (p4 & p3 & g2) | (p4 & p3 & p2 & g1) | (p4 & p3 & p2 & p1 & g0) | (p4 & p3 & p2 & p1 & p0 & c_in),
        c6=g5 | (p5 & g4) | (p5 & p4 & g3) | (p5 & p4 & p3 & g2) | (p5 & p4 & p3 & p2 & g1) | (p5 & p4 & p3 & p2 & p1 & g0) | (p5 & p4 & p3 & p2 & p1 & p0 & c_in),
        c7=g6 | (p6 & g5) | (p6 & p5 & g4) | (p6 & p5 & p4 & g3) | (p6 & p5 & p4 & p3 & g2) | (p6 & p5 & p4 & p3 & p2 & g1) | (p6 & p5 & p4 & p3 & p2 & p1 & g0) | (p6 & p5 & p4 & p3 & p2 & p1 & p0 & c_in),
        c8=g7 | (p7 & g6) | (p7 & p6 & g5) | (p7 & p6 & p5 & g4) | (p7 & p6 & p5 & p4 & g3) | (p7 & p6 & p5 & p4 & p3 & g2) | (p7 & p6 & p5 & p4 & p3 & p2 & g1) | (p7 & p6 & p5 & p4 & p3 & p2 & p1 & g0) | (p7 & p6 & p5 & p4 & p3 & p2 & p1 & p0 & c_in);

    // Compute Sum 
    assign 
        sum[0] = p0 ^ c_in,
        sum[1] = p1 ^ c1,
        sum[2] = p2 ^ c2,
        sum[3] = p3 ^ c3,
        sum[4] = p4 ^ c4,
        sum[5] = p5 ^ c5,
        sum[6] = p6 ^ c6,
        sum[7] = p7 ^ c7;

    // Assign carry output 
    assign c_out = c8;
endmodule