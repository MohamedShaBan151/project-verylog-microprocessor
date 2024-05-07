`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/06/2024 01:18:58 PM
// Design Name: 
// Module Name: RAM
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


module RAM(
 input clk,
 input [2:0] AR ,   
 input [7:0] comm_bus  ,  
 input R  ,
 input T1 ,
 input T6 ,
 input T4 ,
 input D3 ,
 input D5 ,
 input D6 ,   
 output reg [7:0] RAM_out  
);

wire W ;
assign W = ~(R&T1|D3&T4|D5&T4|D6&T6)   ;    // control signal for Ram
reg [7:0] memory [7:0] ;   
 initial begin 
 
 memory [0]  = 8'hf8 ;  // location 0
 memory [1]  = 8'h3f ;  // location 1
 memory [2]  = 8'hf8 ;  // location 2
 memory [3]  = 8'h1f ;  // location 3
 memory [4]  = 8'hf4 ;  // location 4
 memory [5]  = 8'h71 ;  // location 5
 memory [6]  = 8'h00 ;  // location 6
 memory [7]  = 8'h00 ;  // location 7
 
 end

always @(posedge clk) begin
if (W == 0)
    begin
memory [AR] <= comm_bus  ;     // Write operation
RAM_out <= 8'hzz ;
    end
else 
    begin
RAM_out <=  memory [AR] ;   // Read operation
    end
end

endmodule
