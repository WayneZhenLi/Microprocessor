`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:49:28 03/22/2016 
// Design Name: 
// Module Name:    PC 
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
module FF_DC(q, clk, clr, en, d);
	input clk, clr, en;
	input[15:0] d;
	output reg[15:0] q;

	always @(posedge clk)
	if (clr) q <= 0;
	else if (en)  q <= d;
endmodule


module PC(output[15:0] PC, input[15:0] Buss, input[15:0] eabOut, input[1:0] selPC, input clk, input reset, input ldPC);
	 wire[15:0] w;
	 assign w = selPC[1]?Buss:(selPC[0]?eabOut:(PC + 1));
	 FF_DC ff(PC, clk, reset, ldPC, w);
endmodule
