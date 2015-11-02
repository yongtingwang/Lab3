`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:06:00 08/20/2015 
// Design Name: 
// Module Name:    lab3_2 
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
module lab3_2(
	display[11:0],
	clk,
	rst_n 
    );
output [11:0] display;
input rst_n,clk;

wire clk_out;

freq_div f1(
	.clk_out(clk_out), // divided clock output
	.clk(clk), // global clock input
	.rst_n(rst_n) // active low reset
	);
up_count c1(
	.clk_out(clk_out),
	.display(display),
	.rst_n (rst_n) 
    );

endmodule
