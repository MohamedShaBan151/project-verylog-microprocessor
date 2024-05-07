`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/07/2024 05:28:28 AM
// Design Name: 
// Module Name: OUTPR
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


module OUTPR(
input  [7:0] comm_bus,
input  D7,
input  T3,
input  J , 
input  B2,
input  CLK,
output reg [7:0] OUTPR

);

wire Load ;
assign Load = B2&J&D7&T3 ;
initial begin 
OUTPR= 8'h00 ;
end 

always @(posedge CLK) begin

    if (Load) begin
          OUTPR<= comm_bus ;
     end 
end

endmodule
