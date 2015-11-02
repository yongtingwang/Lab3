`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:17:57 08/20/2015 
// Design Name: 
// Module Name:    lab3_3 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module lab3_3(
	clk,
	rst_n,
	display,
	ftsd_ctl
    );
input clk,rst_n;
output [14:0] display;
output [3:0] ftsd_ctl;


wire clk_out;
wire [1:0] clk_ctl;
wire [3:0] in2,in3;
wire [3:0] bcd;


 freq_div f1(
	.clk_out(clk_out), // divided clock output
	.clk_ctl(clk_ctl), // divided clock output for scan freq
	.clk(clk), // global clock input
	.rst_n(rst_n) // active low reset
	); 

count c1(
	.clk_out(clk_out),  //input
	.rst_n(rst_n),   //input
	.in2(in2),    //output
	.in3(in3)    //output
    );
	 
 scan_ctl s1(
	.ftsd_ctl(ftsd_ctl), // ftsd display control signal 
	.ftsd_in(bcd), // output to ftsd display

	.in2(in2), // 3rd input
	.in3(in3), // 4th input
	.ftsd_ctl_en(clk_ctl) // divided clock for scan control
	);
	
display d1(
	.display(display), // 14-segment display output
	.bcd(bcd) // BCD input
	);
	
	
endmodule
