`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/07/2024 04:36:18 AM
// Design Name: 
// Module Name: ALU
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


module ALU(
input D0  ,
input D1  ,
input D2  ,
input D7  ,
input B1  ,
input B2  ,
input J   ,
input T5  ,
input B3  ,
input T3  ,
input [7:0] DR    ,
input [7:0] INPR  ,
input [7:0] AC    ,
output reg [7:0] alu_out ,
output reg E                   );
wire P    ;
wire r    ;
wire LDA  ;
wire AND  ;
wire ADD  ;
wire CIR  ;
wire CIL  ;
wire INP  ;

assign P   = J&D7&T3    ;
assign r   = ~J&D7&T3   ;
assign LDA =  (D2&T5)   ;
assign AND = D0&T5      ;
assign ADD = D1&T5      ;
assign CIR = r&B2       ;
assign CIL = r&B1       ;
assign INP = P&B3       ;


initial begin
E  = 0 ;
end

always @(*) begin
if (LDA == 1)
   begin
alu_out <= DR  ;
   end
 else if (AND == 1)
   begin
alu_out <= DR & AC ;
   end
else if (ADD == 1) 
   begin
{E , alu_out} <= DR + AC ;
   end
else if (CIR == 1)
     begin
        alu_out = (alu_out>> 1); 
         alu_out[7] = E;
        E = alu_out[0];
     end

else if (CIL == 1)   
   begin
 alu_out= ( alu_out << 1);
                        alu_out[0] = E;
                       E =  alu_out[7];
   end

else if (INP == 1)
   begin   
alu_out <= INPR ;
   end
else 
   begin
alu_out <= 8'hzz ;
   end   
end

endmodule
