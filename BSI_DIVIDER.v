`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.10.2024 20:49:28
// Design Name: 
// Module Name: BSI_DIVIDER
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


module BSI_DIVIDER(
    input CLK,
    input RST,
    output reg CEO
);

reg [16:0] CNT;

always@(posedge CLK, posedge RST)
    if (RST) begin
        CNT <= 0;
        CEO <= 1'b0;
    end
    else if (CNT == 99999) begin
        CNT <= 0;
        CEO <= 1'b1;
    end
    else begin
        CNT <= CNT + 1'b1;
        CEO <= 1'b0;
    end
endmodule
