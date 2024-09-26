`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.09.2024 20:04:31
// Design Name: 
// Module Name: dc
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


module dc(
    input [1:0] ia,
    input is,
    output reg [3:0] oout
);

always@(*)
if (is) begin
    case(ia)
        2'd0: oout = 4'b0001;
        2'd1: oout = 4'b0010;
        2'd2: oout = 4'b0100;
        2'd3: oout = 4'b1000;
    endcase
end else oout = 4'b0000;

endmodule
