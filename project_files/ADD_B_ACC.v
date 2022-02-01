`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/23/2021 12:41:39 PM
// Design Name: 
// Module Name: ADD_B_ACC
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

`define WIDTH_5 8
module ADD_B_ACC(
b_in , acc_in , sum , c_o 
    );
 input [`WIDTH_5-1:0] b_in ;
 input [`WIDTH_5-1:0] acc_in ;
 output [`WIDTH_5-1:0] sum ;
 output c_o ;
 
 assign {c_o , sum } = b_in + acc_in ;
    
endmodule
