`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/29/2021 10:53:05 AM
// Design Name: 
// Module Name: seg_controller_v2
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


module seg_controller_v2(input [7:0] A, B, C, D, input sw_dillon, input [3:0] height_status,  input fast_clock, input clock_200hz,  output reg [7:0] seg = 8'b1111_1111, reg [3:0]an = 4'b0001);

    reg [1:0] seg_counter = 0; 
    always @ (posedge clock_200hz)
    begin
        seg_counter <= seg_counter + 1;
    end
    
    always @ (posedge fast_clock)
    begin
        if (!sw_dillon) 
        begin
            case(seg_counter)
                0: begin seg [7:0] <= A[7:0] ;  an[3:0] <= 4'b0111; end
                1: begin seg [7:0] <= B[7:0] ; an[3:0] <= 4'b1011; end
                2: begin seg [7:0] <= C[7:0] ; an[3:0] <= 4'b1101; end
                3: begin seg [7:0] <= D[7:0]  ; an[3:0] <= 4'b1110; end
             endcase
         end
         
         if (sw_dillon)
         begin
         
            case(height_status)
            6 :
             begin
                case(seg_counter)
                  0: begin seg [7:0] <= 8'b1100_0000 ;  an[3:0] <= 4'b0111; end
                  1: begin seg [7:0] <= 8'b1100_0000 ; an[3:0] <= 4'b1011; end
                  2: begin seg [7:0] <= 8'b1100_0000 ; an[3:0] <= 4'b1101; end
                  3: begin seg [7:0] <= 8'b1100_0000  ; an[3:0] <= 4'b1110; end
                endcase
               end
     
            
            7: 
                begin
                 case(seg_counter)
                   0: begin seg [7:0] <= 8'b1100_0000 ;  an[3:0] <= 4'b0111; end
                   1: begin seg [7:0] <= 8'b1100_0000 ; an[3:0] <= 4'b1011; end
                   2: begin seg [7:0] <= 8'b1001_0010 ; an[3:0] <= 4'b1101; end
                   3: begin seg [7:0] <= 8'b1100_0000  ; an[3:0] <= 4'b1110; end
                 endcase
                end
            
            8:
             begin
             case(seg_counter)
               0: begin seg [7:0] <= 8'b1100_0000 ;  an[3:0] <= 4'b0111; end
               1: begin seg [7:0] <= 8'b1111_1001 ; an[3:0] <= 4'b1011; end
               2: begin seg [7:0] <= 8'b1100_0000 ; an[3:0] <= 4'b1101; end
               3: begin seg [7:0] <= 8'b1100_0000  ; an[3:0] <= 4'b1110; end
             endcase
            end
            
            9: 
                begin
                 case(seg_counter)
                   0: begin seg [7:0] <= 8'b1100_0000 ;  an[3:0] <= 4'b0111; end
                   1: begin seg [7:0] <= 8'b1111_1001 ; an[3:0] <= 4'b1011; end
                   2: begin seg [7:0] <= 8'b1001_0010 ; an[3:0] <= 4'b1101; end
                   3: begin seg [7:0] <= 8'b1100_0000  ; an[3:0] <= 4'b1110; end
                 endcase
                end
                        

            10:
                begin
                 case(seg_counter)
                   0: begin seg [7:0] <= 8'b1100_0000 ;  an[3:0] <= 4'b0111; end
                   1: begin seg [7:0] <= 8'b1010_0100 ; an[3:0] <= 4'b1011; end
                   2: begin seg [7:0] <= 8'b1100_0000 ; an[3:0] <= 4'b1101; end
                   3: begin seg [7:0] <= 8'b1100_0000  ; an[3:0] <= 4'b1110; end
                 endcase
                end
                        
             endcase 
         end
         
         
     end
     
endmodule