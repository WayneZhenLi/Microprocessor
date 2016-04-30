`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:18:15 03/22/2016 
// Design Name: 
// Module Name:    IR 
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
module FF_DC2(q, clk, clr, en, d);
	input clk, clr, en;
	input[15:0] d;
	output reg[15:0] q;

	always @(posedge clk)
	if (clr) q <= 0;
	else if (en)  q <= d;
endmodule
module IR_block(output[15:0] IR, input[15:0] Buss, input clk, input ldIR, input reset);
	FF_DC2 ff(IR, clk, reset, ldIR, Buss);
endmodule
