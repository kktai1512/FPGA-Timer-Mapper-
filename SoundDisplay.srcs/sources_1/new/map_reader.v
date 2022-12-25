`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.10.2021 16:28:22
// Design Name: 
// Module Name: map_reader
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


module map_reader(input [6:0] x_pos, input [5:0] y_pos, input [5:0] y, input [6:0] x, input sw15, sw14, input clk_25mhz, output reg [3:0] status = 0
    );
    
    always @ (posedge clk_25mhz) begin
        if (sw15 && ~sw14) begin
            status <= 1; // 0 elevation
            if ((x == x_pos) && (y == y_pos)) begin
                status <= 6;
                end
            //else begin
            if ((x >= 1 && x <= 23 && y >= 1 && y <= 38)|
            (x >= 24 && x <= 28 && y >= 18 && y <= 38) |
            (x >= 10 && x <= 21 && y >= 39 && y <= 43)|
            (x >= 29 && x <= 33 && y >= 27 && y <= 33)|
            (x >= 52 && x <= 90 && y >= 28 && y <= 57)) begin // 50 elevation
                if ((x == x_pos) && (y == y_pos))
                    status <= 7;
                else
                    status <= 2;
            end
            if ((x >= 3 && x <= 18 && y >= 4 && y <= 29)|
            (x >= 60 && x <= 84 && y >= 34 && y <= 49)|
            (x >= 58 && x <= 59 && y >= 37 && y <= 47)|
            (x >= 72 && x <= 76 && y >= 8 && y <= 12)|
            (x == 85 && y >= 37 && y <= 46)) begin // 100 elevation
                if ((x == x_pos) && (y == y_pos))
                    status <= 8;
                else
                    status <= 3;
            end
            if ((x >= 5 && x <= 13 && y >= 10 && y <= 21)|
            (x >= 66 && x <= 82 && y >= 39 && y <= 44)) begin // 150 elevation
                if ((x == x_pos) && (y == y_pos))
                    status <= 9;
                else
                    status <= 4;
            end            
            
            if ((x >= 6 && x <= 9 && y >= 12 && y <= 15)|
            (x == 74 && y == 10)) begin // 200 elevation
                if ((x == x_pos) && (y == y_pos))
                    status <= 10;
                else
                    status <= 5;
             end 
        end
    end
endmodule
