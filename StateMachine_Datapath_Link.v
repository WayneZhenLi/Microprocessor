`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:43:32 04/04/2016 
// Design Name: 
// Module Name:    Full 
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
module Full(input clk, input reset);
	
	wire[1:0] selPC, selEAB2, aluControl;
	wire[2:0] DR, SR1, SR2;
	wire[15:0] IR;
	wire selMAR, ldPC, enaMARM, enaPC, regWE, selEAB1, ldIR, enaALU, flagWE, enaMDR, ldMAR, ldMDR, memWE, selMDR;
	wire N, Z, P;
	Datapath data_obj(
     selMAR, selPC,  ldPC,  clk,  reset,
	  enaMARM,  enaPC,DR,  SR1,  SR2,
	  regWE,  selEAB1, selEAB2,  ldIR, aluControl,
	  enaALU,  flagWE,  enaMDR, ldMAR,  ldMDR,  memWE,
	  selMDR,  N,  Z,  P, IR);
	
	LC3_Control control_obj(
		aluControl, SR1, SR2, DR, selPC, selEAB1, selEAB2,
		enaALU, regWE, flagWE, enaMARM, selMAR, enaPC, ldPC,
		ldIR, ldMAR, ldMDR, selMDR, memWE, enaMDR, clk, reset,
		IR, N, Z, P
	);
endmodule
