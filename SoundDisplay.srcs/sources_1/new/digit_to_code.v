`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/25/2021 04:01:39 PM
// Design Name: 
// Module Name: digit_to_code
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


module digit_to_code(input [4:0] digit, output reg [7:0] code = 8'b1100_0000);
 //constants
   parameter [7:0] nine = 8'b1001_0000; // 9
   parameter [7:0] eight =8'b1000_0000; // 8
   parameter [7:0] seven =8'b1111_1000; // 7
   parameter [7:0] six =8'b1000_0010; // 6
   parameter [7:0] five =8'b1001_0010; // 5
   parameter [7:0] four = 8'b1001_1001; // 4
   parameter [7:0] three =8'b1011_0000; // 3
   parameter [7:0] two =8'b1010_0100; // 2
   parameter [7:0] one =8'b1111_1001; // 1 
   parameter [7:0] zero =8'b1100_0000; // 0
   
   always @ *
   begin
   case (digit)
       0: code <= zero;
       1: code <= one;
       2: code <= two;
       3: code <= three;
       4: code <= four;
       5: code <= five;
       6: code <= six;
       7: code <= seven;
       8: code <= eight;
       9: code <= nine; endcase
    end
endmodule
