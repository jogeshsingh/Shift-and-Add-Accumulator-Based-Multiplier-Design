`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/14/2021 10:16:04 AM
// Design Name: 
// Module Name: Top_Data_control_tb
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

`define D_WIDTH 8
`define State_WIDTH 4
module Top_Data_control_tb();
reg i_clk ;
reg start ;
wire [`D_WIDTH-1:0]  shift_ADD ;
reg [`D_WIDTH-1:0] data_input ;
wire [`D_WIDTH-1:0] out_ACC_reg ;
wire [`D_WIDTH-1:0] out_A_reg ;
wire [`D_WIDTH-1:0] out_B_reg ;
wire [`D_WIDTH-1:0] Data_out ;
wire [`D_WIDTH-1:0] Data_out1;
wire [`State_WIDTH-1:0] p_STATE ;
wire A_out ;
wire done ;




DATA_PATH DUT(
i_clk , load_B , load_ACC, load_A , clr_ACC_reg, sel_SUM , shift_A_reg, data_input ,
 out_ACC_reg , out_A_reg , out_B_reg, Lsb_out , Msb_out, A_out , shift_ADD, Data_out , Data_out1
    );
    
   Controller UUT(
i_clk  , load_ACC , load_B , load_A ,
 shift_A_reg , clr_ACC_reg , Lsb_out  , Msb_out,sel_SUM ,
A_out, start , done , p_STATE
);


initial
begin
 i_clk = 1'b0 ;
 start = 1'b0 ;
 data_input = 8'b0 ;
 end



////clock gen ///
always #5 i_clk = ~i_clk ;



initial
 begin
  #3 start = 1'b1 ;
  #1 data_input = 8'b0000_0011 ;
  #10 data_input = 8'b0000_1100 ;
  #5 data_input = 8'b0000_1110;
   #800 $finish ;
    end

endmodule
