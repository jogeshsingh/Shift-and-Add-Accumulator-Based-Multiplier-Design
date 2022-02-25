`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Jogesh singh
// 
// Create Date: 11/23/2021 12:39:43 PM
// Design Name: TOP_data_control (SHIFT AND ADD)
// Module Name: TOP_Data_control
// Project Name: SEQUENTIAL_MULT 
// Target Devices: ARTIX-7
// Tool Versions: VIVADO 2020.2
// Description: This is top design file which is the RTL code of SEQUENTIAL
//MULTIPLIER (using add and shift operations)////
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

`define DATA_WIDTH 8
`define STATE_REG 4
module TOP_Data_control(
i_clk , data_input  , start , out_ACC_reg , out_A_reg , out_B_reg , A_out , p_STATE  ,  done
);
input i_clk ;
input start ;
wire [`DATA_WIDTH-1:0]  shift_ADD ;
input [`DATA_WIDTH-1:0] data_input ;
output [`DATA_WIDTH-1:0] out_ACC_reg ;
output [`DATA_WIDTH-1:0] out_A_reg ;
output [`DATA_WIDTH-1:0] out_B_reg ;
output [`STATE_REG-1:0] p_STATE ;
output A_out ;
output done ;
 DATA_PATH DA(
i_clk , load_B , load_ACC, load_A , clr_ACC_reg, sel_SUM , shift_A_reg, data_input ,
 out_ACC_reg , out_A_reg , out_B_reg, Lsb_out , Msb_out, A_out , shift_ADD
    );
    
   Controller CU(
i_clk  , load_ACC , load_B , load_A ,
 shift_A_reg , clr_ACC_reg , Lsb_out  , Msb_out,sel_SUM ,
A_out, start , done , p_STATE
);
 
      
                
endmodule
