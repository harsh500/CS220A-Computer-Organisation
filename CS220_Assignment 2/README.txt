To execute code for question 1:

iverilog -o A2Q1_eight_bit_carry_lookahead_adder_tb.vvp A2Q1_eight_bit_carry_lookahead_adder_tb.v
vvp A2Q1_eight_bit_carry_lookahead_adder_tb.vvp

To execute code for question 2:

iverilog -o A2Q2_johnson_counter_tb.vvp A2Q2_johnson_counter_tb.v
vvp A2Q2_johnson_counter_tb.vvp

Assumptions/Information for question 1 (Carry Look Ahead Adder):
- We have given a gate-level implementation of the 8-bit carry look ahead adder


Assumptions/Information for question 2 (Johnson Counter):

- We have implemented the 8-bit Johnson counter using 8 D flip flops, though there is also
  a direct way of implementing it in Verilog code without instantiating the D flip flops
- We have declared the Qs of the Johnson counter as inouts since they are acting as inputs
  to some D flip flops and themselves are also outputs.

Detailed description is given in the PDF files 