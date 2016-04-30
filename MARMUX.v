`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:42:52 03/22/2016 
// Design Name: 
// Module Name:    MARMUX 
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
module MARMUX(output[15:0] MARMuxOut, input[7:0] IR, input[15:0] eabOut, input selMAR);
	assign MARMuxOut = selMAR?{8'b00000000, IR}:eabOut;
endmodule
