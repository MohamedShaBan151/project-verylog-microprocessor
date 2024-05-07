`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/06/2024 01:03:00 PM
// Design Name: 
// Module Name: Secounce_Counter
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


module Secounce_Counter(
 input clk,        
 input D0, D1, D2, D3, D4, D5, D6, D7,
 input R ,
 input J ,
 input B0,
 output T0, T1, T2, T3, T4, T5, T6, T7
   
);

wire s ,clear , increment ,P ,r ;
reg [7:0] SC ;
reg [2:0] count ;
assign r = ~J&D7&T3 ;
assign P = J&D7&T3  ;
assign T0 = SC[0] ;
assign T1 = SC[1] ;
assign T2 = SC[2] ;
assign T3 = SC[3] ;
assign T4 = SC[4] ;
assign T5 = SC[5] ;
assign T6 = SC[6] ;
assign T7 = SC[7] ;

assign clear = (((D0 | D1 | D2 | D5) & T5) | (R & T2) | (D6 & T6) | ((D3 | D4) & T4) | P | r) ;
assign  increment = 1 ;
assign s= (~(r&B0) & clk );

initial begin 
count = 3'h00 ;
end 

always @(posedge s or posedge clear ) begin
   if (clear) begin
       count <= 3'b000;             // Reset counter if clear is asserted
   end else if (increment) begin
       if (count == 3'b111) begin
           count <= 4'b000;        // Reset counter if it reaches its maximum value
       end else begin
           count <= count + 1;     // Increment counter otherwise
       end
   end
end

always @(*) begin
 case(count)
3'b000  : SC = 8'h01  ;
3'b001  : SC = 8'h02  ;
3'b010  : SC = 8'h04  ;
3'b011  : SC = 8'h08  ;
3'b100  : SC = 8'h10  ;
3'b101  : SC = 8'h20  ;
3'b110  : SC = 8'h40  ;
3'b111  : SC = 8'h80  ;
default : SC = 8'h01  ;
 endcase
end

endmodule
