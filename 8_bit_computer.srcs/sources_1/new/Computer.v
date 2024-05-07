`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/07/2024 06:15:59 AM
// Design Name: 
// Module Name: Computer
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


module Computer(
input CLK           ,
input [7:0] INPR    ,
output R            ,  
output E            ,
output FGI          ,
output FGO          ,
output T0           ,
output T1           ,
output T2           ,
output T3           ,
output T4           ,
output T5           ,
output T6           ,
output T7           ,
output [2:0] AR     ,
output [2:0] PC     ,
output [7:0] AC     ,
output [7:0] DR     ,
output [7:0] TR     ,
output [7:0] RAM    ,
output [7:0] IR     ,
output [7:0] OUTPR

    );
    
wire wire_clk       ;
wire wire_R         ;
wire wire_E         ;
wire wire_j         ;
wire wire_d0        ;
wire wire_d1        ;
wire wire_d2        ;
wire wire_d3        ;
wire wire_d4        ;
wire wire_d5        ;
wire wire_d6        ;
wire wire_d7        ;
wire wire_t0        ;
wire wire_t1        ;
wire wire_t2        ;
wire wire_t3        ;
wire wire_t4        ;
wire wire_t5        ;
wire wire_t6        ;
wire wire_t7        ;
wire wire_b0        ;
wire wire_b1        ;
wire wire_b2        ;
wire wire_b3        ;
wire [7:0] wire_INPR        ;
wire [2:0]  wire_AR         ;
wire [2:0]  wire_PC         ;
wire [7:0]  wire_AC         ;
wire [7:0]  wire_DR         ;
wire [7:0]  wire_TR         ;
wire [7:0]  wire_RAM_out    ;
wire [7:0]  wire_IR         ;
wire [7:0]  wire_OUTPR      ;
wire [7:0] wire_alu_out     ;
wire [7:0] wire_comm_bus    ; 

assign CLK    = wire_clk          ;
assign INPR   = wire_INPR         ;   
assign E      = wire_E            ;
assign R      = wire_R            ;
assign AR     = wire_AR           ;
assign PC     = wire_PC           ;
assign AC     = wire_AC           ;
assign DR     = wire_DR           ;
assign TR     = wire_TR           ;
assign RAM    = wire_RAM_out      ;
assign IR     = wire_IR           ;
assign OUTPR  = wire_OUTPR        ;
assign T0 = wire_t0 ;
assign T1 = wire_t1 ;
assign T2 = wire_t2 ;
assign T3 = wire_t3 ;
assign T4 = wire_t4 ;
assign T5 = wire_t5 ;
assign T6 = wire_t6 ;
assign T7 = wire_t7 ;



  Secounce_Counter sc (
       . clk(wire_clk),         
       . D0(wire_d0), 
       . D1(wire_d1),
       . D2(wire_d2), 
       . D3(wire_d3),
       . D4(wire_d4),
       . D5(wire_d5),
       . D6(wire_d6), 
       . D7(wire_d7),
       . J(wire_j  ),
       . R(wire_R  ),
       . B0(wire_b0),
       . T0(wire_t0),
       . T1(wire_t1),
       . T2(wire_t2),
       . T3(wire_t3),
       . T4(wire_t4),
       . T5(wire_t5),
       . T6(wire_t6),
       . T7(wire_t7) 
       
    );
    
    
     Accumulator ac(
        . B2(wire_b2),
        . D7(wire_d7),
        . J(wire_j  ),
        . T3(wire_t3),
        . B1(wire_b1),
        . D0(wire_d0),
        . D1(wire_d1),
        . D2(wire_d2),
        . T5(wire_t5),
        . B3(wire_b3),
        . CLK(wire_clk),
        . alu_out(wire_alu_out),
        . AC(wire_AC)
    );
    
    
    DR dr(
     . D0(wire_d0), 
     . D1(wire_d1),
     . D2(wire_d2),
     . D6(wire_d6), 
     . T4(wire_t4),
     . T5(wire_t5),
     . CLK(wire_clk),
     . comm_bus(wire_comm_bus),
     . DR(wire_DR)
     
     );
     
      ALU alu (
    . D0(wire_d0), 
    . D1(wire_d1),
    . D2(wire_d2),
    . D7(wire_d7),
    . B1(wire_b1),
    . B2(wire_b2),
    . B3(wire_b3),
    . J(wire_j),
    . T3(wire_t3),
    . T5(wire_t5),
    . DR(wire_DR),
    . INPR(wire_INPR ),
    . AC(wire_AC),
    . alu_out(wire_alu_out),
    . E(wire_E)
 
     );
     
     Instruction_Register   ir(
      . CLK(wire_clk),    
      . R(wire_R),
      . T1(wire_t1),
      . comm_bus(wire_comm_bus),
      . IR(wire_IR),
      . D0(wire_d0), 
      . D1(wire_d1),
      . D2(wire_d2), 
      . D3(wire_d3),
      . D4(wire_d4),
      . D5(wire_d5),
      . D6(wire_d6), 
      . D7(wire_d7), 
      . B0(wire_b0),
      . B1(wire_b1),
      . B2(wire_b2),
      . B3(wire_b3),
      . J(wire_j)
     );
     
     CommonBus bus(
     . D0(wire_d0), 
     . D1(wire_d1),
     . D2(wire_d2), 
     . D3(wire_d3),
     . D4(wire_d4),
     . D5(wire_d5),
     . D6(wire_d6), 
     . D7(wire_d7), 
     . T0(wire_t0),
     . T1(wire_t1),
     . T2(wire_t2),
     . T3(wire_t3),
     . T4(wire_t4),
     . T5(wire_t5),
     . T6(wire_t6),
     . R(wire_R), 
     . B2(wire_b2), 
     . J(wire_j),
     . AC(wire_AC),
     . DR(wire_DR),
     . AR(wire_AR),
     . PC(wire_PC),
     . RAM_out(wire_RAM_out),
     . IR(wire_IR),
     . TR(wire_TR),
     . comm_bus(wire_comm_bus)
     
     );
     
      RAM ram( 
     . clk(wire_clk),   
     . AR(wire_AR),   
     . comm_bus(wire_comm_bus) ,
     . R(wire_R),
     . T1(wire_t1),
     . T6(wire_t6),
     . T4(wire_t4),
     . D3(wire_d3),
     . D5(wire_d5),
     . D6(wire_d6),    
     . RAM_out(wire_RAM_out)
    );
    
    
     PC pc(
    . D4(wire_d4),
    . D5(wire_d5),
    . D6(wire_d6), 
    . T4(wire_t4),
    . T5(wire_t5),
    . T6(wire_t6),
    . T1(wire_t1),
    . T2(wire_t2),
    . R(wire_R),
    . CLK(wire_clk), 
    . comm_bus(wire_comm_bus) ,
    . PC(wire_PC)
    );
    
      TR tr(
    . comm_bus(wire_comm_bus) ,
    . T0(wire_t0),
    . R(wire_R),
    . CLK(wire_clk), 
    . TR(wire_TR)
    
    );
    
    
    
    
     AR ar(
    . D5(wire_d5),
    . D7(wire_d7),
    . T0(wire_t0),
    . T2(wire_t2),
    . T3(wire_t3),
    . T4(wire_t4),
    . J(wire_j),
    . R(wire_R),
    . CLK(wire_clk), 
    . comm_bus(wire_comm_bus) ,
    . AR(wire_AR)
    );
    
     Interrupt IN(
     . T0(wire_t0),
     . T1(wire_t1),
     . T2(wire_t2),
     . T3(wire_t3),
     . D7(wire_d7),
     . B2(wire_b2),
     . B3(wire_b3),
     . J(wire_j  ),
     . FGO(FGO) ,
     . FGI(FGI) ,
     . CLK(wire_clk), 
     . R(wire_R)
    );
    
     OUTPR outpr(
    .comm_bus(wire_comm_bus) ,
    .D7 (wire_d7)  ,
    .T3 (wire_t3)  ,
    .J (wire_j)    ,
    .B2(wire_b2)   ,
    .CLK(wire_clk) , 
    .OUTPR(wire_OUTPR) 
    
    );
    
    INPR inpr(
    .CLK(CLK),
    .INPR(wire_INPR),
    .INPR_in(INPR)
    
       );
    
    
endmodule
