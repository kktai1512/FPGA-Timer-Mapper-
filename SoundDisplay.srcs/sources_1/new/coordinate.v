`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/11/2021 02:59:19 PM
// Design Name: 
// Module Name: coordinate
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

//95 // 63
module coordinate(input [12:0] pixel_index, output [6:0] x, output[5:0]y);
    assign x = pixel_index % 96;
    assign y = pixel_index / 96;
endmodule
