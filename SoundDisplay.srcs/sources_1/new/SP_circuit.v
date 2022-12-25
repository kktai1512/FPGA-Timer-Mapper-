`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/07/2021 11:11:00 PM
// Design Name: 
// Module Name: SP_circuit
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


module SP_circuit(input PUSHBUTTON, SP_CLOCK, output pulse );
    wire Q1 , Q2;
   
    my_dff dff1(.DFF_CLOCK(SP_CLOCK), .D(PUSHBUTTON), .Q(Q1));
    my_dff dff2(.DFF_CLOCK(SP_CLOCK), .D(Q1), .Q(Q2));
    assign pulse = Q1 & (~Q2);
    
    
endmodule
