Question 1:

Command to run:
iverilog -o A3Q1_seq_counter_tb.vvp A3Q1_seq_counter_tb.v
vvp A3Q1_seq_counter_tb.vvp

Assumptions and information:
- Due to the race conditions at the clock posedge we have given a one time unit delay while displaying the 
  output.
- We have considered 5 states in total to make the code easier to comprehend, though it could have also 
  been done in 4 states.

Question 2:

Command to run:
iverilog -o A3Q2_odd_parity_tb.vvp A3Q2_odd_parity_tb.v
vvp A3Q2_odd_parity_tb.vvp

Assumptions and information:
- It takes 4 cycles to find the parity for 3 bit input (we display the parity bit at the 4th clock cycle)

Please refer to the attached PDF file for the detailed report.