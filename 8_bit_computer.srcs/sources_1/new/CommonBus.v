`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/07/2024 04:44:51 AM
// Design Name: 
// Module Name: CommonBus
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


module CommonBus(
input D7,
input D6,
input D5,
input D4,
input D3,
input D2,
input D0,
input D1,
input T6,
input T5,
input T4,
input R,
input T2,
input B2,
input T1,
input T3,
input J,
input T0,
input [7:0] AC,
input [7:0] DR,
input [3:0] AR,
input [3:0] PC,
input [7:0] RAM_out,
input [7:0] IR,
input [7:0] TR,
output reg [7:0] comm_bus      );

  wire X1, X2, X3, X4, X5, X6, X7;
  reg [2:0] Z;

  assign X1 = (D4 & T4) | (D5 & T5);
  assign X2 = (T4 & D5) | T0       ;
  assign X3 = (D2 & D5) | (D6 & T6);
  assign X4 = (D3 & T4) | (D7 & J & T3 & B2);
  assign X5 = ~R & T2 ;
  assign X6 = R & T1  ;
  assign X7 = (~R & T1) | (~D7 & J & T3) | ((D0 | D1 | D2 | D6) & T4);

  always @(*) begin
    case ({X7, X6, X5, X4, X3, X2, X1})
      
      7'b0000001: Z = 3'b001;
      7'b0000010: Z = 3'b010;
      7'b0000100: Z = 3'b011;
      7'b0001000: Z = 3'b100;
      7'b0010000: Z = 3'b101;
      7'b0100000: Z = 3'b110;
      7'b1000000: Z = 3'b111;
      
    endcase

    case (Z)
     
      3'b001: comm_bus <= AR;
      3'b010: comm_bus <= PC;
      3'b011: comm_bus <= DR;
      3'b100: comm_bus <= AC;
      3'b101: comm_bus <= IR;
      3'b110: comm_bus <= TR;
      3'b111: comm_bus <= RAM_out;
    endcase
  end

endmodule
