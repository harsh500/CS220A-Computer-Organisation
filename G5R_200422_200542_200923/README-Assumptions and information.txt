Q1:
- We have implemented 1 bit adder using 'and','xor' and 'or' gates.
- And then to make a 8 bit adder we have used 8 1 bit adders and we keep on passing the carry out of the previous 1 bit adder to the next one as carry in.
- Carry in for the LSB is 0

Q2:
- Firstly we have made a 1 bit comparator using 'and', 'or' and 'xnor' gate.
- Then we compare each bit of 8 bit number and store it in vector.
- Then we iterate over equalto(e8) vector from MSB to LSB in our program and find the first place where we can find a zero and that will 
  be the deciding place which decides whether a is greater or b, for this we have used if and else block.
- If all the bit in e8 is 1 then a=b and e=1
- If a > b then g = 1, else if a = b, e = 1, else l = 1

Q3:

Assumptions made in Q3:

-  Allowed to use 'AND' and 'NOT' gates along with two 2-4 decoders in implementation of 3-to-8 decoder

Information: 

- 2-to-4 decoder is implemented using gate-level design and also has an 'Enable' input
- 3-to-8 decoder also has an 'Enable' input and uses two 2-to-4 decoders
- Test bench has test cases for both Enable = 0 and Enable = 1 inputs

Q4:

Paradigm:
-We have implemented used Behavioural implementation in this part. 

Logic:
-We use masking (to extract digits) followed by or-reduction.
-We have taken the least significant 1 as the input. 0, x and z are considered as false inputs
-This is a priority encoder because only 1 if is executed in the guaranteed order of lowest to most significant bit check.

Code:
-The always block with regular event-based triggering, has the if-else construct so that whenever the input changes, this block gets executed.
-The stimulus/top-level module tests the code for 9 different cases 