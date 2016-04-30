`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:12:24 03/22/2016 
// Design Name: 
// Module Name:    ALU 
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
module ALU(aluOut, aluControl, IR, Ra, Rb);
	output [15:0] aluOut;
	input [1:0] aluControl;
	input [5:0] IR;
	input [15:0] Ra, Rb;
	
	//aluControl 00: Pass A 01: Add A + B
	//				 10: And A * B  11: Not A
	
	wire [15:0] B;
	//SR2MUX
	assign B = IR[5] ? {{11{IR[4]}},IR[4:0]} : Rb;
	
	assign aluOut = aluControl[1] ? (aluControl[0] ? ~Ra : (Ra & B))
							: (aluControl[0] ? (Ra + B) : Ra);


endmodule
