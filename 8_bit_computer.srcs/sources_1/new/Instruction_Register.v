`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/07/2024 05:01:19 AM
// Design Name: 
// Module Name: Instruction_Register
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


module Instruction_Register(
 input CLK,          
 input R,
 input T1,
 input [7:0] comm_bus, 
 output reg [7:0] IR,      
 output D0, D1, D2, D3, D4, D5, D6, D7,
 output B0,
 output B1,
 output B2,
 output B3,
 output reg  J
);

wire Load ;
wire IR4 , IR5 ,IR6 ;
reg [7:0] D ;

assign Load = ~R&T1 ;
assign B0 = IR[0]  ;
assign B1 = IR[1]  ;
assign B2 = IR[2]  ;
assign B3 = IR[3]  ;
assign IR4  = IR[4]  ;
assign IR5  = IR[5]  ;
assign IR6  = IR[6]  ;
assign D0 = D[0]  ;
assign D1 = D[1]  ;
assign D2 = D[2]  ;
assign D3 = D[3]  ;
assign D4 = D[4]  ; 
assign D5 = D[5]  ;
assign D6 = D[6]  ;
assign D7 = D[7]  ;

initial begin 
IR = 8'h00 ;
end 

always @(posedge CLK) begin
   J <= IR[7];               // D input of the flip-flop is connected to IR[7]
end
always @(posedge CLK) begin
   // Load data into the Instruction Register if IR_load is asserted
   if (Load) begin
       IR <= comm_bus;
   end
end
always @(*) begin
 // Decoder 3X8 to Decode op_code
 case({IR6,IR5,IR4}) 
   3'b000  : D = 8'b00000001  ;
   3'b001  : D = 8'b00000010  ;
   3'b010  : D = 8'b00000100  ;
   3'b011  : D = 8'b00001000  ;
   3'b100  : D = 8'b00010000  ;
   3'b101  : D = 8'b00100000  ;
   3'b110  : D = 8'b01000000  ;
   3'b111  : D = 8'b10000000  ;
   default : D = 8'b00000001  ;
 endcase   
 end 
  
endmodule
