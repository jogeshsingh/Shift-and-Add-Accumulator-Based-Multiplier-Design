`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/23/2021 12:40:17 PM
// Design Name: 
// Module Name: Controller
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

`define DATA_WIDTH_2   8
`define idle     4'b0000
`define init     4'b0001
`define s2       4'b0010
`define s3       4'b0011
`define s4       4'b0100
`define s5       4'b0101
`define s6       4'b0110
`define s7       4'b0111
`define s8       4'b1000
`define s9       4'b1001
`define rslt_1   4'b1010
`define rslt_2   4'b1011

module Controller(
i_clk  , load_ACC , load_B , load_A ,
 shift_A_reg , clr_ACC_reg , Lsb_out  , Msb_out,sel_SUM ,
A_out, start , done , p_STATE
);

input i_clk ;
input start ;
input A_out ;
output load_ACC ;
output load_B ;
output load_A ;
output shift_A_reg ;
output clr_ACC_reg ;
output done ;
output Lsb_out ;
output Msb_out ;
output sel_SUM ;

output reg [3:0] p_STATE ;      ///this is a state register /////

reg [8:0] CV ;   ///intermediate register for assigning the values to output variables ////

assign load_A      =  CV[8] ;
assign load_ACC    =  CV[7] ;
assign load_B      =  CV[6] ;
assign clr_ACC_reg =  CV[5] ;
assign shift_A_reg =  CV[4] ;
assign Lsb_out     =  CV[3] ;
assign Msb_out     =  CV[2] ;
assign sel_SUM     =  CV[1] ;
assign done        =  CV[0] ;



///data register ///

always @ (posedge i_clk)
  begin
   case (p_STATE )
   `idle : begin
    if (start)
              p_STATE <= `init ;
               else
               p_STATE <= `idle ;
               end
   `init : begin
               p_STATE <= `s2 ;
               end
    `s2 , `s3, `s4, `s5, `s6, `s7, `s8  : begin                        ////these states point to the add/shift operation depending upon  the lsb of A_reg ////
                                     p_STATE <= p_STATE + 1'b1 ;
                                      end 
    `rslt_1 : begin
                p_STATE <= `rslt_2 ;
                end  
    `rslt_2 : begin
                 p_STATE <= `idle ;
                  end 
                  
          default : begin
                      p_STATE <= `idle ;
                      end          
                  endcase 
                   end    
                   
       always @ (p_STATE or A_out or start )
        begin
         case (p_STATE)
        `idle : begin 
                 if (start==1'b0)
                   CV   = 9'b00000_0001 ;        ////done signal is active ///
                   else 
                   CV = 9'b11010_0000;             ////load_A  , load_ACC  , clrn_ACC   , are active ///
                   end
         `init : begin   
                     CV = 9'b00100_0000;            /// load_B is active here ////
                     end 
                     
                     
 `s2 , `s3 , `s4 , `s5 , `s6  , `s7 , `s8 , `s9 : begin 
                                                  if (A_out) 
                                                  CV = 9'b01001_0010;    ////shift_A_reg  , sel_sum  , load_ACC are active /////
                                                  else
                                                  CV = 9'b01001_0000;    ////Shift_A_reg , load_ACC are active ////
                                                  end 
          `rslt_1 : begin
                     CV = 9'b00000_1000;               //////Lsb_out is active which points to th output from A_reg///
                      end                                                                                              
           `rslt_2 : begin 
                     CV = 9'b00000_0100;              ////Msb_out is active which points to the output from the Accumulator ACC ////
                     end 
             default : begin  
                       CV = 9'b00000_0000;
                       end        
                    endcase 
                    end        



endmodule
