`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/23/2021 12:42:22 PM
// Design Name: 
// Module Name: MUX_ACC
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

`define WIDTH_4 8
module MUX_ACC(
in_1 , in_2 , out_M , sel_M );

input [`WIDTH_4-1:0] in_1 , in_2 ;
input sel_M ;
output [`WIDTH_4-1:0] out_M ;


assign out_M = sel_M ? in_2 :in_1 ;

endmodule
