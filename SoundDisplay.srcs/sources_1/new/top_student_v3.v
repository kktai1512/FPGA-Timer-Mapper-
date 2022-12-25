`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
//
//  FILL IN THE FOLLOWING INFORMATION:
//
//  LAB SESSION DAY (Delete where applicable): MONDAY P.M, TUESDAY P.M, WEDNESDAY P.M, THURSDAY A.M., THURSDAY P.M
//
//  STUDENT A NAME: 
//  STUDENT A MATRICULATION NUMBER: 
//
//  STUDENT B NAME: 
//  STUDENT B MATRICULATION NUMBER: 
//
//////////////////////////////////////////////////////////////////////////////////


module Top_Student (
    input sw0, sw1, sw2, sw3,sw4, sw5, sw14, sw15,
    output [15:0] led,
    input  J_MIC3_Pin3,   // Connect from this signal to Audio_Capture.v
    output J_MIC3_Pin1,   // Connect to this signal from Audio_Capture.v
    output J_MIC3_Pin4,   // Connect to this signal from Audio_Capture.v
    // Delete this comment and include other inputs and outputs here
    input basys_clock, btnC, btnU, btnD, btnL, btnR, output [7:0] JC
    , 
    output [7:0] seg, [3:0] an);
   
   //clocks instantiation
   wire clk6p25m, clock_30hz, clock_25mhz, clock_20khz, clock_1hz, clock_200hz, fast_clock; //,clock_200hz;
   clock_divider clock_6p25mhz (.basys_clock(basys_clock), .M(7), .my_clk(clk6p25m));
   clock_divider clk_30hz (.basys_clock (basys_clock), .M(166_6666), .my_clk(clock_30hz));
   clock_divider clk_25mhz (.basys_clock (basys_clock), .M(1), .my_clk(clock_25mhz));
   clock_divider clk_20khz(basys_clock, 2499, clock_20khz);
   clock_divider clk_1hz (.basys_clock (basys_clock), .M(49_999_999), .my_clk(clock_1hz));
   clock_divider clk_200hz (.basys_clock (basys_clock), .M(24_9999), .my_clk(clock_200hz));
   clock_divider fast_clk (.basys_clock (basys_clock), .M(1), .my_clk(fast_clock));
  
    
    //oled
    wire SPC, SPU, SPD, SPL, SPR;
    SP_circuit center (.SP_CLOCK(clock_30hz), .PUSHBUTTON(btnC), .pulse(SPC));
    SP_circuit up (.SP_CLOCK(clock_30hz), .PUSHBUTTON(btnU), .pulse(SPU));
    SP_circuit down (.SP_CLOCK(clock_30hz), .PUSHBUTTON(btnD), .pulse(SPD));
    SP_circuit left (.SP_CLOCK(clock_30hz), .PUSHBUTTON(btnL), .pulse(SPL));
    SP_circuit right (.SP_CLOCK(clock_30hz), .PUSHBUTTON(btnR), .pulse(SPR));
    wire [15:0] oled_data;
    wire [12:0] pixel_index;
   Oled_Display(.clk(clk6p25m), .reset(SPC), .frame_begin(), .sending_pixels(),
      .sample_pixel(), .pixel_index(pixel_index), .pixel_data(oled_data), .cs(JC[0]), .sdin(JC[1]), .sclk(JC[3]), .d_cn(JC[4]), .resn(JC[5]), .vccen(JC[6]),
      .pmoden(JC[7]) ,.teststate());
      
      
    wire [11:0] mic_in /*= 12'd0*/;
    Audio_Capture unit_audio(
    .CLK(basys_clock), .cs(clock_20khz), .MISO(J_MIC3_Pin3), .clk_samp(J_MIC3_Pin1), .sclk(J_MIC3_Pin4), .sample(mic_in));
    wire [6:0] x;
    wire [5:0] y;
    coordinate unit_coordinates (.pixel_index(pixel_index), .x(x), .y(y));
    
    //colors constants
    reg [15:0] red = 16'b11111_000000_00000;
    reg [15:0] green = 16'b00000_111111_00000;
    reg [15:0] orange = 16'b11111_100110_00000;
    
    reg [31:0] counter = 0;
    reg [2:0] level = 0;
    reg [11:0] peak = 0;
    reg [11:0] curr_level = 0;
    
    


      wire [7:0] A, B, C, D;
      wire start;
      wire [2:0] peak_status;
      
      
      // Navigation system modules and wires here
                
        wire [6:0] x_pos;
        wire [5:0] y_pos;
        wire [3:0] stat;
        wire [3:0] r_stat;
                
      mic_volume_led unit_mic (.sampling_clock(clock_20khz), .mic_in (mic_in), .led(led), .enable_threshold(start));
      seg_controller_v2 unit_seg_controller(.A(A), .B(B), .C(C), .D(D), .sw_dillon(sw15), .height_status(stat), .fast_clock(fast_clock), .clock_200hz(clock_200hz), .seg(seg), .an(an));
      timer unit_timer(.stop_watch_frequency(clock_1hz), .enable(start), .SPU(SPU), .SPD(SPD), .task_id(sw0), .reset(SPC), .sw4(sw4), .SP_CLOCK(clock_30hz), .A(A), .B(B), .C(C), .D(D));
      oled_data unit_display (.pixel_index(pixel_index), .status(stat), .task_id(sw0), .sw5(sw5), .sw14(sw14), .sw15(sw15), .r_status(r_stat), .peak_status(peak_status) ,.oled_clock(clock_25mhz), .PIXEL_DATA(oled_data)); 
      peak_indicator unit_peak(.oled_clock (clock_25mhz), .sampling_clock(clock_20khz), .x(x), .y(y),.mic_in(mic_in), .status(peak_status) );
      
      
      //dillon
      
          
          //positioning
          pos_controller unit_pos(.SPL(SPL), .SPR(SPR), .SPD(SPD), .SPU(SPU), .SPC(SPC), .clk(clock_30hz), 
          .sw15(sw15), .sw14(sw14),.sw1(sw1),.sw2(sw2),.sw3(sw3), 
          .x_pos(x_pos), .y_pos(y_pos));
          map_reader unit_map (.x_pos(x_pos), .y_pos(y_pos), .y(y), .x(x), .sw15(sw15), .sw14(sw14), .clk_25mhz(clock_25mhz), .status(stat));
         
          //route recording
          route_record unit_route(.x_pos(x_pos),.y_pos(y_pos), .y(y), .x(x),.sw15(sw15), .sw14(sw14), .SPL(SPL), .SPU(SPU), .SPD(SPD), .SPR(SPR), .clk_25mhz(clk6p25m), .status(r_stat));
      
    
      
    endmodule