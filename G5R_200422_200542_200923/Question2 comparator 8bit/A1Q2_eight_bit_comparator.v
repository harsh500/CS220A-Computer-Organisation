`include "A1Q2_one_bit_comparator.v"
module comparator_8(gf,ef,lf,a1,a2);
    //I/O
    output reg gf,ef,lf;
    input[7:0] a1,a2;
    //Internal Wires
    wire[7:0] g8,l8,e8;
    //module instantation
    comparator_1 h7(g8[7],e8[7],l8[7],a1[7],a2[7]);
    comparator_1 h6(g8[6],e8[6],l8[6],a1[6],a2[6]);
    comparator_1 h5(g8[5],e8[5],l8[5],a1[5],a2[5]);
    comparator_1 h4(g8[4],e8[4],l8[4],a1[4],a2[4]);
    comparator_1 h3(g8[3],e8[3],l8[3],a1[3],a2[3]);
    comparator_1 h2(g8[2],e8[2],l8[2],a1[2],a2[2]);
    comparator_1 h1(g8[1],e8[1],l8[1],a1[1],a2[1]);
    comparator_1 h0(g8[0],e8[0],l8[0],a1[0],a2[0]);
    //using if and else to find first 0 in e8
    always @* begin
        if(e8[7]!=1)begin
        ef=e8[7];
        gf=g8[7];
        lf=l8[7];
    end
    else begin
        if(e8[6]!=1)begin
            ef=e8[6];
            gf=g8[6];
            lf=l8[6];
        end
        else begin
            if(e8[5]!=1)begin
                ef=e8[5];
                gf=g8[5];
                lf=l8[5];
            end
            else begin
                if(e8[4]!=1)begin
                    ef=e8[4];
                    gf=g8[4];
                    lf=l8[4];
                end
                else begin
                    if(e8[3]!=1)begin
                        ef=e8[3];
                        gf=g8[3];
                        lf=l8[3];
                    end
                    else begin
                        if(e8[2]!=1)begin
                            ef=e8[2];
                            gf=g8[2];
                            lf=l8[2];
                        end
                        else begin
                            if(e8[1]!=1)begin
                                ef=e8[1];
                                gf=g8[1];
                                lf=l8[1];
                            end
                            else begin
                                if(e8[0]!=1)begin
                                    ef=e8[0];
                                    gf=g8[0];
                                    lf=l8[0];
                                end
                                else begin
                                    ef=1;
                                    gf=0;
                                    lf=0;
                                end
                            end
                        end
                    end
                end
            end
        end
    end
    end
endmodule