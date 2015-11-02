`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:08:05 08/20/2015 
// Design Name: 
// Module Name:    up_count 
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
module up_count(
	clk_out,
	display,
	rst_n 
    );
input clk_out,rst_n ;
output reg [11:0] display;
reg [3:0] num,num_temp;

always@(posedge clk_out or negedge rst_n)
begin
if (~rst_n)  
num<=0;
else 
num<=num_temp;	

case(num)
4'b0000: display<=12'b1110_00000011; //0
4'b0001: display<=12'b1110_10011111; //1
4'b0010: display<=12'b1110_00100100; //2
4'b0011: display<=12'b1110_00001100; //3
4'b0100: display<=12'b1110_10011000; //4
4'b0101: display<=12'b1110_01001000; //5
4'b0110: display<=12'b1110_01000000; //6
4'b0111: display<=12'b1110_00011011; //7
4'b1000: display<=12'b1110_00000000; //8
4'b1001: display<=12'b1110_00001000; //9
default display<=12'b1110_01110001; //F
endcase
end

always@(*)
if(num==4'b1001) 
num_temp=0;
else 
num_temp=num+1'b1;


endmodule
