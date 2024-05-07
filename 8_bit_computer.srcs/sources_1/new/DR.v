`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/07/2024 04:56:41 AM
// Design Name: 
// Module Name: DR
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


module DR(
input D0 , 
input D1 ,
input D2 ,
input D6 ,
input T5, 
input T4 ,
input CLK,
input [7:0] comm_bus,
output reg [7:0] DR
 );
 
 wire LOAD ;
 wire inr;
 assign inr =(D6&T5);
 assign LOAD  = ~( (D0 | D1 | D2  ) & T4 );
 
 initial begin 
 DR = 8'h00 ;
 end 
 
 always @(posedge CLK )
 begin
         if (inr) 
            DR <= DR  + 1;
         else if (LOAD == 0)
            DR <= comm_bus; 
     end
  
  
endmodule
