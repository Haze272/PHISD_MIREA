`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.10.2024 19:55:30
// Design Name: 
// Module Name: memory
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


module memory(
    input [6:0] ADDR,
    output [7:0] DATA
    );
    
reg [7:0] ROM0 [0:127];

initial begin
    $readmemh("ROM_mem.mem", ROM0);
end

assign DATA = ROM0[ADDR];

endmodule
