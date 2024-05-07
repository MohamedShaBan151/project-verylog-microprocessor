`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/07/2024 05:29:34 AM
// Design Name: 
// Module Name: TR
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


module TR(
input  [7:0] comm_bus,
input  T0, 
input  R,
input  CLK,
output reg [7:0] TR

);
wire Load ;
assign Load = T0&R ;

initial begin 
TR= 8'h00 ;
end 
 
always @(posedge CLK) begin
      if (Load) begin
            TR <= comm_bus;
       end 
end

endmodule
