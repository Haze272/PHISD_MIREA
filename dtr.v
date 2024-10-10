`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.10.2024 20:14:35
// Design Name: 
// Module Name: dtr
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


module dtr(
    input CLK,
    input D,
    input RST,
    input EN,
    output reg Q
);

//always@(posedge CLK) sync rest
always@(posedge CLK, posedge RST) // async
    if (RST)
        Q <= 1'b0;
    else if (EN)
        Q <= D;

endmodule
