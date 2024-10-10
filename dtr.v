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


module dtr #(
    parameter WDT = 7
) (
    input CLK,
    input [WDT - 1 : 0]D,
    input RST,
    input EN,
    output reg [WDT - 1 : 0]Q
);

//always@(posedge CLK) sync rest
always@(posedge CLK, posedge RST) // async
    if (RST)
        Q <= {WDT{1'b0}}; // OR  Q <= 0;
    else if (EN)
        Q <= D;

endmodule
