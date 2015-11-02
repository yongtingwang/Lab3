`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:21:17 08/20/2015 
// Design Name: 
// Module Name:    count 
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
module count(
	clk_out,  //input
	rst_n,   //input
	in2,    //output
	in3    //output
    );
input clk_out,rst_n;
output reg [3:0] in2,in3;

reg [3:0] num2,num2_temp,num3,num3_temp;

always@(posedge clk_out or negedge rst_n)
begin
if (~rst_n)  begin
num2<=0;
num3<=0; end
else  begin
num2<=num2_temp;	
num3<=num3_temp;	 end
end


always@(*)
if(num3==4'd9&&num2==4'd9)  begin
	num2_temp=0;
	num3_temp=0; end
else if (num3==4'd9&&num2!=4'd9) begin
	num3_temp=0;
	num2_temp=num2+1'b1;  end 
else  begin
num3_temp=num3+1'b1;
num2_temp=num2;  end 
always@(*)
begin
in2=num2;
in3=num3;
end

endmodule
