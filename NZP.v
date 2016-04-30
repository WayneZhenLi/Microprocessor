`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:20:02 03/22/2016 
// Design Name: 
// Module Name:    NZP 
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
module NZP(N, Z, P, clk, flagWE, reset, Buss);
	output N, Z, P;
	input clk, flagWE, reset;
	input [15:0] Buss;
	
	wire Nval, Zval, Pval;
	
	ff_dce REGN(N, clk, Nval, reset, flagWE);
	ff_dce REGZ(Z, clk, Zval, reset, flagWE);
	ff_dce REGP(P, clk, Pval, reset, flagWE);
	
	//if Negative
	assign Nval = Buss[15];
	//if Zero
	assign Zval = &(~Buss);
	//if Positive
	assign Pval = ~Zval & ~Buss[15];
	
endmodule
