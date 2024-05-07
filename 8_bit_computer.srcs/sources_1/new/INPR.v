`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/07/2024 05:28:48 AM
// Design Name: 
// Module Name: INPR
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


module INPR(
input CLK ,
input [7:0] INPR_in   ,
output reg [7:0] INPR 
);

always @(posedge CLK) begin 
INPR <= INPR_in ;
end 

endmodule
