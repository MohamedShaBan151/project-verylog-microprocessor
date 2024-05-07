`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/07/2024 04:50:44 AM
// Design Name: 
// Module Name: Accumulator
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


module Accumulator(
 input B2,
 input B1,
 input D0,
 input D1,
 input D2,
 input T5,
 input D7 ,
 input T3 ,
 input J ,
 input B3,
 input CLK,
 input [7:0] alu_out,
 output reg [7:0] AC
);

wire r ;
wire P ;
wire Clear ;
wire Load  ;

assign r = D7&~J&T3 ;
assign P = D7&J&T3  ;
assign Clear = ( r & B3);
assign Load  = ((B3&P)|((B2|B1)&r)|((D0|D1|D2)&T5));

initial begin 
AC = 8'h00 ;
end 

always @(posedge CLK or posedge Clear )
begin
   if (Clear == 1)
   begin
       AC <= 8'h00;
   end
   else if (Load ==1 )
   begin
       AC <= alu_out;
   end
end

endmodule
