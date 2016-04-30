`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:36:28 03/22/2016 
// Design Name: 
// Module Name:    RegFile 
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
module RegFile(Ra, Rb, clk, regWE, reset, 
			Buss, DR, SR1, SR2);
	output [15:0] Ra, Rb;
	input [15:0] Buss;
	input clk, regWE, reset;
	input [2:0] DR, SR1, SR2;
	
	//array of 8 elements of 16 bits
	wire [15:0] regs [7:0];
	
	//write decoder
	wire [7:0] write;
	assign write = {8{regWE}} & (8'd1 << DR); 
	
	//the registers
	register16 REG0(regs[0], clk, Buss, reset, write[0]);
	register16 REG1(regs[1], clk, Buss, reset, write[1]);
	register16 REG2(regs[2], clk, Buss, reset, write[2]);
	register16 REG3(regs[3], clk, Buss, reset, write[3]);
	register16 REG4(regs[4], clk, Buss, reset, write[4]);
	register16 REG5(regs[5], clk, Buss, reset, write[5]);
	register16 REG6(regs[6], clk, Buss, reset, write[6]);
	register16 REG7(regs[7], clk, Buss, reset, write[7]);

	//the read outputs
	assign Ra = regs[SR1];
	assign Rb = regs[SR2];

endmodule
