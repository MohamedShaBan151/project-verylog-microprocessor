`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/07/2024 05:22:21 AM
// Design Name: 
// Module Name: AR
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


module AR(
input D5 ,
input D7 ,
input T0 ,
input T2 ,
input T3,
input T4 ,
input J ,
input R ,
input CLK,
input [2:0] comm_bus,
output reg [2:0]AR
);
 

wire Load  ;
wire INR   ;
wire Clear ;

 assign INR =(D5&T4);
 assign Load  = ~( ((T0 |  T2  ) & ~R)| ( J & T3 & ~D7 ) );
 assign Clear =~(T0&R);
 
 initial begin 
 AR = 3'b000 ;
 end 

 always @(posedge CLK or negedge Clear )
 begin
     if (Clear ==0)
     begin
      AR <= 3'h0;
    end
 else if (Load == 0 )
    begin
 AR <= comm_bus;
   end
 else if (INR == 1 )
         begin
 AR <= AR + 1;
       
      end
end
 
endmodule
