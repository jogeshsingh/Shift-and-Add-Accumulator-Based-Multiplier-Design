`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/23/2021 12:40:37 PM
// Design Name: 
// Module Name: REG_A
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
///A is Multiplicand //////
`define WIDTH_2 8
module REG_A(
i_clk ,  ld_A  , shift_A ,s_in, d_in_2 , out_A
    );
input i_clk ;
//input rst_n ;
input ld_A ;
input shift_A ;
input [`WIDTH_2-1:0] d_in_2 ;
output reg [`WIDTH_2-1:0] out_A ;
input s_in ;

always @ (posedge i_clk) 
begin
     if (ld_A==1'b1  )
        begin 
          out_A <= d_in_2   ;  ///load the data //
          end
        else if (shift_A)
          begin
            out_A <= {s_in , out_A[7:1] } ;  ////right shift operation //
             end
           else
            begin
             out_A <= out_A ;
              end             
              end           

endmodule
