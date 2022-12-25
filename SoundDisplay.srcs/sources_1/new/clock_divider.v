`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/04/2021 04:23:01 PM
// Design Name: 
// Module Name: clock_divider
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
module clock_divider (input basys_clock, input [31:0] M, output reg my_clk = 0);
    reg [31:0] counter = 0;
    always @ (posedge basys_clock) 
    begin
         counter <= (counter == M)? 0 : counter + 1;
        my_clk <= (counter == 0) ? ~my_clk : my_clk;
    end     
endmodule
