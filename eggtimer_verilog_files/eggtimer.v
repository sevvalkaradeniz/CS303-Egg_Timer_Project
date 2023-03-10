`timescale 1ns / 1ps

module eggtimer(
    input CLK100MHZ,
    input rst,
    input beginn, 
    input reset,
    input [3:0] PM10,
    input [3:0] PM1,
    input [3:0] PS10,
    input [3:0] PS1,
    output [6:0] SEVEN,
    output DP,
    output [7:0] AN
    );

    reg [1:0] state;

    wire c1khz, start, endd, zero, countdown;
    
    wire [3:0] m10;
    wire [3:0] m1;
    wire [3:0] s10;
    wire [3:0] s1;
    
    counter mycounter(rst, c1khz, start, endd);
    clk_divider mydivider(CLK100MHZ, rst, c1khz);
    display mydisplay(rst, c1khz, m10, m1, s10, s1, SEVEN, DP, AN);
    downcounter mydown(rst, c1khz, countdown, reset, PM10, PM1, PS10, PS1, m10, m1, s10, s1, zero);

    // state machine to go here
 
endmodule
