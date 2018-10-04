
module ALU_top(
			   input clk, 
			   input [15:0] swt, 
			   output [11:0] seg // some sort of seven seg name
			   );
		
	wire [5:0] A, B;
	wire inst_load_en, instruction_in, reset_instr, reset_all; 
	wire [11:0] result; 
	
	assign A = swt[5:0];
	assign B = swt[11:6];
	assign instruction_in = swt[12];
	assign inst_load_en = swt[13];
	assign reset_instr = swt[14];
	assign reset_all = swt[15];
	
	
	ALU UUT(.clk(clk),
		   .A(A), 
		   .B(B),
		   .instruction_in(instruction_in),
		   .inst_load_en(inst_load_en), 
		   .reset_instr(reset_instr),
		   .reset_all(reset_all),
		   .result(result)
	);
	
	assign seg = result; // OR WHATEVER IT IS 
		
endmodule