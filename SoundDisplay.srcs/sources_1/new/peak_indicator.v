`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/29/2021 10:18:00 AM
// Design Name: 
// Module Name: peak_indicator
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


module peak_indicator(input oled_clock, sampling_clock, [6:0] x, [5:0]y, [11:0] mic_in, output reg [2:0] status = 0 );
  reg [2:0] level = 0;
  reg [11:0] peak = 0;
  reg [11:0] curr_level = 0;
  reg [31:0] counter = 0;
 always @ (posedge oled_clock) begin
   status <= 0;
   if (level >= 0) begin
       if (x >= 17 && x <= 76 && y >= 12 && y <= 49) 
           status <= 1;
       if ((x >= 1 && x <= 93 && y == 0)|(x >= 1 && x <= 93 && y == 61)|(x == 1 && y >= 1 && y <= 60)|(x == 93 && y >= 1 && y <= 60)) 
           status <= 1; end
   if (level >= 1) begin
       if (x >= 17 && x <= 76 && y >= 19 && y <= 42) 
            status <= 2;
       if ((x >= 3 && x <= 91 && y == 2)|(x >= 3 && x <= 91 && y == 59)|(x == 3 && y >= 2 && y <= 59)|(x == 91 && y >= 2 && y <= 59))
            status <= 2; end
   if (level >=2 ) begin
       if (x >= 17 && x <= 76 && y >= 26 && y <= 35) 
           status <= 3;
       if ((x >= 5 && x <= 89 && y >= 4 && y <=6)|(x >= 5 && x <= 89 && y >= 55 && y <= 57)|(x >= 5 && x <= 7 && y >= 4 && y <= 57)|(x >= 87 && x <= 89 && y >= 4 && y <= 57)) 
           status <= 3; end
   end


   always @ (posedge sampling_clock)
   begin
       counter = counter + 1;
       curr_level <= mic_in;
       peak <= (peak< curr_level) ? curr_level: peak;
       if (counter % 2000 == 0) begin
            if (peak > 2048 && peak <= 3000) 
               level <= 0;
            if (peak > 3000 && peak <= 3500) 
               level <= 1;
            if (peak > 3500 && peak <= 4000) 
                level <= 2;  
              peak <= 0;   end              
       end
endmodule
