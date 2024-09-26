`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.09.2024 20:35:11
// Design Name: 
// Module Name: BS_DC_HEX_ASCII
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


module BS_DC_HEX_ASCII(
    input [3:0] hex,
    output reg [7:0] ascii     
);

always@(*)
    case(hex)
        4'h0: ascii = 8'h30;
        4'h1: ascii = 8'h31;
        4'h2: ascii = 8'h32;
        4'h3: ascii = 8'h33;
        
        4'h4: ascii = 8'h34;
        4'h5: ascii = 8'h35;
        4'h6: ascii = 8'h36;
        4'h7: ascii = 8'h37;
        
        4'h8: ascii = 8'h38;
        4'h9: ascii = 8'h39;
        4'hA: ascii = 8'h41;
        4'hB: ascii = 8'h42;
        
        4'hC: ascii = 8'h43;
        4'hD: ascii = 8'h44;
        4'hE: ascii = 8'h45;
        4'hF: ascii = 8'h46;
    endcase
endmodule
