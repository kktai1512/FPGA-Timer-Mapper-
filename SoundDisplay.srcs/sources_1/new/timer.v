`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/27/2021 02:04:37 AM
// Design Name: 
// Module Name: timer
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
module timer(input stop_watch_frequency, SPU, SPD, SP_CLOCK, task_id, reset,sw4, input enable, output [7:0] A, B, C, D);
    reg [13:0] total_seconds;
    reg [13:0] initial_seconds;
    reg started = 0;
    reg resetted = 0;
    always @ (posedge stop_watch_frequency or negedge reset)
    begin
        if (reset) 
            begin
                total_seconds <= 0;
                started <= 0;  
            end
        else 
            begin
                if (task_id == 1) 
                    begin
                    
                    if (enable && sw4) 
                        begin
                        total_seconds <= total_seconds != 0 ? total_seconds - 1 : 0; 
                        started = 1;
                        end
                     if (!started)
                        total_seconds <= initial_seconds;
                        
                    end
                    
                 if (task_id == 0) 
                    begin
                        started = 1; // csnnot adjust time
                        if (enable && sw4) total_seconds <= total_seconds + 1; 
                    end 
                    
             end
     end

    
    always @ (posedge SP_CLOCK) 
    begin
        if (task_id == 1) begin
            if (SPU && initial_seconds != 6000 && !started) initial_seconds <= initial_seconds + 60;
            if (SPD && initial_seconds != 0 && !started ) initial_seconds <= initial_seconds - 60;
        end
    end

    total_seconds_to_mm_ss ms (.total_seconds(total_seconds), .A(A), .B(B), .C(C), .D(D));
    //time_setter(.SPU(SPU), .SPD(SPD), .SP_CLOCK(SP_CLOCK), .started(started), .initial_seconds(initial_seconds));
    endmodule