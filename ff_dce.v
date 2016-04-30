`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:38:00 03/22/2016 
// Design Name: 
// Module Name:    ff_dce 
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
module ff_dce(q, clk, d, reset, en);
	output reg q;
	input clk, reset, en, d;
	
	always @(posedge clk)
		if(reset) q <= 0;
		else if(en) q <= d;

endmodule
