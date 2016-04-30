`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:14:17 03/22/2016 
// Design Name: 
// Module Name:    A0 
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
module EAB(input[10:0] IR, input[1:0] selEAB2, input selEAB1, input [15:0] PC, input [15:0] Ra, output[15:0] eabOut);
	wire[15:0] w2, w1, w0;
	wire[15:0] e1, e0;
	
	//Sin extending.
	assign w2 = IR[10]?{11111, IR[10:0]}:{00000, IR[10:0]};
	assign w1 = IR[8]?{1111111, IR[8:0]}:{0000000, IR[8:0]};
	assign w0 = IR[5]?{1111111111, IR[5:0]}:{0000000000, IR[5:0]};
	
	//Mux.
	assign e1 = selEAB2[1]?(selEAB2[0]?w2:w1):(selEAB2[0]?w0:0);
	assign e0 = selEAB1?Ra:PC;
	
	//Add.
	assign eabOut = e1 + e0;
endmodule
