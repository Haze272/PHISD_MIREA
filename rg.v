`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.10.2024 20:28:22
// Design Name: 
// Module Name: rg
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


module rg(
 input CLK,  
 input [2:0] D,    
 input RST,  
 input EN,   
 output [2:0] Q
);

wire QD;

dtr inst_dtr_2(
    .CLK(CLK),
    .D(D[2]),
    .RST(RST),
    .EN(EN),
    .Q(QD)
);

dtr inst_dtr_1(
    .CLK(CLK),
    .D(D[1]),
    .RST(RST),
    .EN(EN),
    .Q(Q[1])
);

dtr inst_dtr_0(
    .CLK(CLK),
    .D(D[0]),
    .RST(RST),
    .EN(EN),
    .Q(Q[0])
);

dtr inst_dtr(
    .CLK(CLK),
    .D(QD),
    .RST(RST),
    .EN(EN),
    .Q(Q[0])
);

endmodule
