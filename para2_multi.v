`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.09.2024 19:54:20
// Design Name: 
// Module Name: para2
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


module para2(
    input [1:0] ia,
    input [2:0] id0,
    input [2:0] id1,
    input [2:0] id2,
    input [2:0] id3,
    output reg [2:0] oout
);

always@(*)
    case(ia)
        2'b00: oout = id0;
        2'b01: oout = id1;
        2'b10: oout = id2;
        2'b11: oout = id3;
    endcase

endmodule
