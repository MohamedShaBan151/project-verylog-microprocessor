`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/07/2024 05:43:58 AM
// Design Name: 
// Module Name: Interrupt
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


module Interrupt(
input T0,
input T1,
input T2,
input T3,
input D7,
input B2,
input B3,
input J ,         
input CLK,
output reg  R  , 
output reg FGI ,
output reg FGO
);
reg Q   ; 
wire J2  ;
wire K2  ;
wire J1 ;
wire K1 ;
wire x  ;
wire y  ;
assign x = D7&T3&J&B3 ;
assign y = D7&T3&J&B2 ;
assign J1 = 1'b0 ;
assign K1 = (R&T2) ;
assign J2 = Q&~(T0|T1|T2)&(FGI|FGO) ;
assign K2 = R&T2 ;
initial begin 
end 

always @(posedge CLK )
 
 begin 
    FGI <= ~x ;
    FGO <= ~y ;  
case ({J1, K1})    // Concatenate J and K inputs       
2'b00 : Q <= Q ;       // No change          
2'b01 : Q <= 0 ;
2'b10 : Q <= 1 ;
2'b11 : Q <= ~Q ;
endcase

case ({J2, K2})    // Concatenate J and K inputs       
2'b00 : R <= R ;       // No change          
2'b01 : R <= 0 ;
2'b10 : R <= 1 ;
2'b11 : R <= ~R ;
endcase  

 end

endmodule
