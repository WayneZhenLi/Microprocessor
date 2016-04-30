`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:33:40 03/29/2016 
// Design Name: 
// Module Name:    StateMachine 
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
module StateMachine(input[3:0] ir_input
    );

reg [4:0] state;
parameter IDLE = 6'd1;
parameter FETCH0 = 6'd2;
parameter FETCH1 = 6'd3;
parameter FETCH2 = 6'd4;
parameter DECODE = 6'd5;
parameter AND0 = 6'd6; 
parameter ADD0 = 6'd7;
parameter NOT0 = 6'd8;
parameter JSR0 = 6'd9;
parameter JSR1 = 6'd10;
parameter JSR2 = 6'd11;
parameter BR0 = 6'd12;
parameter LD0 = 6'd13;
parameter ST0 = 6'd14;
parameter ST1 = 6'd15;
parameter ST2 = 6'd16;
parameter RET0 = 6'd17;

always @(posedge clk)
	if(reset) state <= IDLE;
	else case (state)
		IDLE: state <= FETCH0;
		FETCH0: state <= FETCH1;
		FETCH1: state <= FETCH2;
		FETCH2: state <= DECODE;
		DECODE: if(ir_input == 4b'0001) state<=ADD0
				  else if(ir_input = )
	
	
	 assign aluControl = (state == AND0)?2'b10:
										(state == ADD0)?2'b01:
										(state == NOT0)?2'b11:
										(state == ST1)?2'b00 : 2'bZZ;
	 assign selPC = (state == FETCH1)?2'b00:
								 (state == JSR1)?2'b01 : 2'bZZ;
	 assign selEAB1 = !(state == JSR0) || state == LD0 || state == ST0;
	 assign selEAB2 = (state == JSR1)?2'b11:
									(state == LD0)?2'b10:
									(state == ST0)?2'b10: 2'bZZ;
	 assign enaALU =(state == AND0)?1'b1: 
						(state == ADD0)?1'b1: 
						(state == NOT0)?1'b1:  
						(state == ST1)?1'b1:
	assign regWE = 
					  (state == AND0)|| 
					  (state == ADD0)|| 
					  (state == NOT0)||
					  (state == JSR0)||
					 (state == LD0);
	assign flagWE = (state == AND0) || (state == ADD0) || (state == NOT0) || (state == LD0);
	assign enaMARM = (state == LD0) ||
						  (state == ST0);
	assign selMAR = 
	assign enaPC = (state == JSR0) || (state == FETCH0);
	assign ldPC = (state == FETCH1) || (state == ADD0) || (state == AND0) || (state == RET0) || (state == BR0 && ~TB);
	
	wire TB;
	TB = 	
	
	assign ldIR = (state == FETCH2);
	assign ldMAR = (state == FETCH0) || (state == LD0) || (state == ST0);
	assign ldMDR = (state == FETCH1) || (state = ST1);
	assign selMDR = 
	assign memWE = state == ST2;
	assign enaMDR = state == FETCH0;
	
endmodule
