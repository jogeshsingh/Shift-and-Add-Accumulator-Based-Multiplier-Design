# Shift-and-Add-Accumulator-Based-Multiplier-Design
This project includes 4 bit configuration of Datapath and controller of shift and add sequential multiplier design . It was designed in Xilinx VIVADO using Verilog HDL.

#TABLE OF CONTENTS

1. ###Introduction

Shift and ADD Accumulator based Multiplier design is a RTL level design which incorportates specific logical unit and shift registers and multiplexers . In any Multiplier unit we basically use array of logc gates or array multiplier in which we use some adder units , but that requires a huge logic components and delay gets increased in those type of multipliers . But in this Multiplier unit (Shift and Add logic) , a control unit takes care of sequences of operations which carry out the process of data depending upon the datapath unit. 

2. ### Design Approach & Methodology

Design is pretty simple , it is interconnected using blocks of shift register(left-shift) , adder , nultiplexer and an add gate. 
Resister P (8-bit) , Register B (8-bit) , Register A (8-bit) . Here P is an accumulator , B is multiplier , A is multiplicand.
   let's get through a basic example of multiplication.
   
   
   take multiplicand ---> 14 (decimal)  ---B register
        muliplier   --->  12 (decimal)  ---A register
        
          14
        * 12
       __________
          2 8
      + 1 4 *
       ________
        1 6 8
        _____
        
        Now see how computer actually does in binary ----->>>>>
                    1110 (14)
                  * 1100 (12)
        ______________________
                     0 0 0 0
                  0  0 0 0 *
               1  1  1 0 * *
        +   1  1  1  0 * * *
            __________________
           (1  0  1 0 1 0 0 0 )2   --- 168 (decimal)
           
           
           Quite a lot of shifting and adding , right ? so from this particular way of multiplication we may 
           use some techniques to get through the design scenario--->>>
           
           let's understand by taking our previous registers P , B , A .
           
           we have adder unit in which if we get the LSB bit of register A then we'll add (P+B) in the register P and shift 
           the data from P(right shift) in the MSB(nit position             of 7 ) in  Register A . else if LSB of A is 0 then we 'll only shift 
           the P into MSB of register A with 0's added in P with previous data in P ( P(previous) +0000_0000). 
           
           
           SUPPOSE IN FIRST CYCLE (t=1) 
           P IS LOADED WITH (0000_0000) ,  A is loaded with 12 ( 00001100) , B is laoded with (00001110) 
                   as lsb of A is = 0 , so shift the LSB of P register into A .
                   now A becomes 0000_0110 and P is still 0000_0000.
                   
              SECOND CYCLE (t=2) 
              since LSB OF A IS STILL 0 , so shift right again (P to right shift into A(MSB of A)) .
                                now A becomes 0000_0011.
                                P is still 0000_0000.
              THIRD CYCLE (t=3) 
              LSB OF A IS 1 , add B into P and shift the data into MSB OF A .
              ADDITION (B+P) = 0000_1110 --P 
              shift == 0000_0111 ---P , A = 0000_0001.
              
              Fourth cycle (t=4) 
              LSB of A is 1 , do the same as in cycle in 3 , 
              P = 0001_0101 . AFTER ADDITION 
              P = 0000_1010 , A = 1000_0000 , after shifting.  
              
              FIFTH cycle (t=5)
              NOW LSB OF A is 0 , so only right shift .
              P = 0000_0101 , A = 0100_0000 .
              
              SIXTH cycle (t= 6) 
              P = 0000_0010 , A = 1010_0000 , since MSB of A was 0 in t=5 , so only shift .
              
              SEVENTH cycle (t=7)
              P = 0000_0001 , A = 0101_0000 ,    since MSB of A was 0 in t=6 , so only shift .
              
              Eighth cycle (t=8)
              P = 0000_0000 , A = 1010_1000   -------Now P regsister got reset to zero , and A is holding our result --->>> 1010_1000 --->>> 168(decimal)
              
              
              
           3. ###Design View ( RTL analysis) 
           
           
           
           In TOP level verilog design module , some signals can be eleiminated as out_b reg , out_ACC_reg , and shift_ADD which is generally a wire , 
           rather these data signals can be included from DATAPATH in simulation window.
         
           
          
           










































![RTL_VIEW (2)](https://user-images.githubusercontent.com/98607828/154934645-cb2c47e0-5754-443c-b384-506e0b503cb3.jpg)


4.  #### Simulation results 
        
        


















































































![Simulation](https://user-images.githubusercontent.com/98607828/154930805-d6c1bee4-15aa-4016-91ac-70c317f54382.jpg)
