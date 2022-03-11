`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/23/2021 12:40:02 PM
// Design Name: 
// Module Name: DATA_PATH
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

`define DATA_WIDTH_1 8
module DATA_PATH(
i_clk , load_B , load_ACC, load_A , clr_ACC_reg, sel_SUM , shift_A_reg, data_in ,
 out_ACC_reg , out_A_reg , out_B_reg, Lsb_out , Msb_out, A_out ,  shift_ADD 
    );
input i_clk ;
input load_B ;
input load_ACC ;
input load_A ;
input sel_SUM ;
input clr_ACC_reg ;
input shift_A_reg ;
input  Lsb_out , Msb_out ;
input [`DATA_WIDTH_1-1:0] data_in ;
output [`DATA_WIDTH_1-1:0] out_ACC_reg ;   //accumulator /
output [`DATA_WIDTH_1-1:0] out_A_reg ;       ///reg A --multiplicand//
output [`DATA_WIDTH_1-1:0] out_B_reg ;     //reg B --- Multiplier //
 output A_out ;                 /////lsb bit of reg  A (aka : out_A_reg[0] ) ///  
output [`DATA_WIDTH_1-1:0] shift_ADD ;
wire [`DATA_WIDTH_1-1:0] SUM ;
wire cout;

assign A_out = out_A_reg[0] ;

REG_A    A1 (i_clk ,  load_A  , shift_A_reg ,shift_ADD[0], data_in , out_A_reg  );
REG_ACC   ACCUM (clr_ACC_reg , i_clk , load_ACC ,shift_ADD , cout , sel_SUM , out_ACC_reg );
REG_B      B1 (i_clk , load_B  , data_in , out_B_reg  );
MUX_ACC    M1 ( out_ACC_reg ,SUM , shift_ADD , sel_SUM );
ADD_B_ACC  ADDER (out_B_reg , out_ACC_reg , SUM , cout  );





endmodule
