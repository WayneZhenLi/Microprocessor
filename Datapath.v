`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:06:33 04/04/2016 
// Design Name: 
// Module Name:    Datapath 
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
module Datapath(
    input selMAR, input[1:0] selPC, input ldPC, input clk, input reset,
	 input enaMARM, input enaPC, input[2:0] DR, input[2:0] SR1, input[2:0] SR2,
	 input regWE, input selEAB1, input[1:0] selEAB2, input ldIR, input[1:0] aluControl,
	 input enaALU, input flagWE, input enaMDR, input ldMAR, input ldMDR, input memWE,
	 input selMDR, output N, output Z, output P, output[15:0] IR);
	 
	wire[15:0] MARMuxOut, Buss, PC_out, Ra, Rb, aluOut, mdrOut, eabOut;
	MARMUX marmux_obj(MARMuxOut, IR[7:0], eabOut, selMAR);
	PC pc_obj(PC_out, Buss, eabOut, selPC, clk, reset, ldPC);
	RegFile reg_obj(Ra, Rb, clk, regWE, reset, Buss, DR, SR1, SR2);
	EAB eab_obj(IR[10:0], selEAB2, selEAB1, PC_out, Ra, eabOut);
	IR_block ir_obj(IR, Buss, clk, ldIR, reset);
	NZP nzp_obj(N, Z, P, clk, flagWE, reset, Buss);
	ALU alu_obj(aluOut, aluControl, IR[5:0], Ra, Rb);
	
	Memory mem_obj(mdrOut, Buss, clk, reset, ldMAR, ldMDR, selMDR, memWE);
	
	ts_driver marm_ena(MARMuxOut ,Buss, enaMARM);
	ts_driver pc_ena(PC_out ,Buss, enaPC);
	ts_driver mdr_ena(mdrOut ,Buss, enaMDR);
	ts_driver alu_ena(aluOut ,Buss, enaALU);
endmodule

