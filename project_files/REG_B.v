`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/23/2021 12:41:13 PM
// Design Name: 
// Module Name: REG_B
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


////B is Multiplier////
`define WIDTH_1 8
module REG_B(
i_clk , ld_B  , d_in_1 , out_B
    );
input i_clk ;
//input rst_n ;
input ld_B ;
input [`WIDTH_1-1:0] d_in_1 ;
output reg [`WIDTH_1-1:0] out_B ;


always @ (posedge i_clk) 
begin
     if (ld_B==1'b1)
        begin
          out_B <= d_in_1 ;
          end
        else
          begin
            out_B <= out_B  ;
             end
              end           
endmodule

