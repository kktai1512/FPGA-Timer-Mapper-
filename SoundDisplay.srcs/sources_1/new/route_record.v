`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.10.2021 03:36:46
// Design Name: 
// Module Name: route_record
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


module route_record(input [6:0] x_pos,input [5:0] y_pos, input [5:0] y, input [6:0] x, input sw15, sw14, SPL, SPU, SPD, SPR, input clk_25mhz, output reg [3:0] status = 0
    );
    reg [1:0] been_there [0:47] [0:31];
    reg [7:0] i = 0;
    reg [7:0] j = 0;


    always @ (posedge clk_25mhz) begin
    
                
        if (~sw15 && sw14) begin
            if (been_there [x_pos/2] [y_pos/2] != 1)
            been_there [x_pos/2] [y_pos/2] = 1;       
                 
            status <= 1;  
                if ((x == x_pos) && (y == y_pos))
                    status <= 11;
                    if ((x >= 1 && x <= 23 && y >= 1 && y <= 38)|
                        (x >= 24 && x <= 28 && y >= 18 && y <= 38) |
                        (x >= 10 && x <= 21 && y >= 39 && y <= 43)|
                        (x >= 29 && x <= 33 && y >= 27 && y <= 33)|
                        (x >= 52 && x <= 90 && y >= 28 && y <= 57)) begin // 50 elevation
                            status <= 2;
                    end
    
                    if ((x >= 3 && x <= 18 && y >= 4 && y <= 29)|
                        (x >= 60 && x <= 84 && y >= 34 && y <= 49)|
                        (x >= 58 && x <= 59 && y >= 37 && y <= 47)|
                        (x >= 72 && x <= 76 && y >= 8 && y <= 12)|
                        (x == 85 && y >= 37 && y <= 46)) begin // 100 elevation
                        status <= 3;
                    end
                
                    if ((x >= 5 && x <= 13 && y >= 10 && y <= 21)|
                        (x >= 66 && x <= 82 && y >= 39 && y <= 44)) begin // 150 elevation
                        status <= 4;
                    end            
                
                    if ((x >= 6 && x <= 9 && y >= 12 && y <= 15)|
                        (x == 74 && y == 10)) begin // 200 elevation
                        status <= 5;
                    end 
                    if (been_there [x/2] [y/2] == 1)
                        status <= 11;
//            for (j = 0; j < i; j = j + 1) begin
//                if (x == x_record[j] && y == y_record[j])
//                    status <= 11;
//            end 

        end
     end
    
endmodule
