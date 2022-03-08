Commands to run Q1:
iverilog -o A4Q1_grey_tb.vvp A4Q1_grey_tb.v
vvp A4Q1_grey_tb.vvp

Commands to run Q2:
iverilog -o A4Q2_add_sub_tb.vvp A4Q2_add_sub_tb.v
vvp A4Q2_add_sub_tb.vvp

Assumptions/Information for Q1:
- We have contructed the grey counter module with the output terminals- state and q(output). It could have 
  been also done with only one output port(q only) but for better clarity in output display, we used two output ports.
- We have implemented synchronous reset for the gray counter.
- We haven't used any flip flops particularly in our code, since Verilog allows behavioural design,
  which makes code easier to read.

Assumptions/Information for Q2:
- As instructed in question, have used two modules for the adder/subtractor.

*Detailed report is in the PDF files*

