`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.10.2021 12:38:43
// Design Name: 
// Module Name: pos_controller
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


module pos_controller(input SPL, SPR, SPD, SPU, SPC, clk, sw15 , sw14, sw1, sw2, sw3, output reg [6:0] x_pos = 0, output reg [5:0] y_pos = 0
    );
    
    
    always @ (posedge clk) begin
        
        x_pos <= (x_pos > 7'd96) ? 7'd0 : x_pos;
        y_pos <= (y_pos > 6'd63) ? 6'd0 : y_pos;
        

        if (sw15 | sw14) begin
            if (SPC) begin
                x_pos <= 7'd0;
                y_pos <= 7'd0;
            end
            if (SPC && sw1 && ~sw2 && ~sw3) begin
                x_pos <= 7'd32;
                y_pos <= 7'd10;
            end
            if (SPC && ~sw1 && sw2 && ~sw3) begin
                x_pos <= 7'd93;
                y_pos <= 7'd62;
            end
            if (SPC && ~sw1 && ~sw2 && sw3) begin
                x_pos <= 7'd18;
                y_pos <= 7'd56;
            end           
            if (SPL == 1) begin
                    x_pos <= x_pos - 2'b10;
            end
            if (SPR == 1) begin
                    x_pos <= x_pos + 2'b10;
            end
            if (SPU == 1) begin
                    y_pos <= y_pos - 2'b10;
            end
            if (SPD == 1) begin
                    y_pos <= y_pos + 2'b10;
            end
        end
    end
        
endmodule
