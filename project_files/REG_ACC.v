`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/23/2021 12:40:55 PM
// Design Name: 
// Module Name: REG_ACC
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

`define WIDTH_3 8
module REG_ACC(
clr_ACC , i_clk , ld_ACC ,d_in_3, co , sel_sum , out_ACC
    );
input i_clk ;
input clr_ACC ;
input ld_ACC;
input [`WIDTH_3-1:0] d_in_3 ;
output reg [`WIDTH_3-1:0] out_ACC ;
input co , sel_sum ;

always @ (posedge i_clk ) 
 begin
  if (clr_ACC)
   begin
    out_ACC <= 4'b0000;
    end
     else if (ld_ACC)
       begin
      out_ACC <= {co&sel_sum , d_in_3[7:1]} ;   ///shift right with sel_sum & carry out from ADDER (ACC AND Register B ) //////
      end
       else
        begin
         out_ACC <= out_ACC ;
          end
           end
                
endmodule
