`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/25/2021 03:04:18 PM
// Design Name: 
// Module Name: total_seconds_to_m_s
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


module total_seconds_to_mm_ss(input [13:0] total_seconds, output [7:0] A,B,C,D);
    wire [4:0] a,b,c,d;
    assign a = (total_seconds / 60) / 10;
    assign b = (total_seconds / 60) % 10 ;
    assign c = (total_seconds % 60) / 10 ;
    assign d = (total_seconds % 60) % 10 ;
    digit_to_code first (.digit(a), .code(A));
    digit_to_code second (.digit(b), .code(B));
    digit_to_code third (.digit(c), .code(C));
    digit_to_code fourth (.digit(d), .code(D));
endmodule
