`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/29/2021 10:01:15 AM
// Design Name: 
// Module Name: mic_volume_led
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


module mic_volume_led(input sampling_clock, input [11:0] mic_in, output reg [15:0] led = 0, output reg enable_threshold = 0);

 always @ (posedge sampling_clock)
   begin
       if (mic_in > 2048 && mic_in <= 2176) 
       led <= 16'b0000_0000_0000_0000;
       if (mic_in > 2048 && mic_in <= 2304) 
       led <= 16'b0000_0000_0000_0001;
       if (mic_in > 2048 && mic_in <= 2432) 
       led <= 16'b0000_0000_0000_0011;
       if (mic_in > 2048 && mic_in <= 2560) 
       led <= 16'b0000_0000_0000_0111;
       if (mic_in > 2560 && mic_in <= 2688) 
       led <= 16'b0000_0000_0000_1111;
       if (mic_in > 2688 && mic_in <= 2816) 
       led <= 16'b0000_0000_0001_1111;
       if (mic_in > 2816 && mic_in <= 2944) 
       led <= 16'b0000_0000_0011_1111;
       if (mic_in > 2944 && mic_in <= 3072) 
       led <= 16'b0000_0000_0111_1111;
       if (mic_in > 3072 && mic_in <= 3200) begin
       led <= 16'b0000_0000_1111_1111; enable_threshold <= !enable_threshold; end
       if (mic_in > 3200 && mic_in <= 3328) 
       led <= 16'b0000_0001_1111_1111;
       if (mic_in > 3328 && mic_in <= 3456) 
       led <= 16'b0000_0011_1111_1111;
       if (mic_in > 3456 && mic_in <= 3584) 
       led <= 16'b0000_0111_1111_1111;
       if (mic_in > 3584 && mic_in <= 3712) 
       led <= 16'b0000_1111_1111_1111;
       if (mic_in > 3712 && mic_in <= 3840) 
       led <= 16'b0001_1111_1111_1111;
       if (mic_in > 3840 && mic_in <= 3968) 
       led <= 16'b0011_1111_1111_1111;
       if (mic_in > 3968 && mic_in <= 4096) 
       led <= 16'b0111_1111_1111_1111;
       end

endmodule
