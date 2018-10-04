//////////////////////////////////////////////////////////////////////////////////
// Module Name: ALU_tb
// Author: Daniel Dai, Brad Yang, Juliana Echternach
//////////////////////////////////////////////////////////////////////////////////

module ALU_tb();
	
	reg clk, instruction_in, inst_load_en, inst_load_en, reset_instr, reset_all;
	reg [5:0] A, B; 
	wire [11:0] result;
	
	
	parameter CLK_PERIOD = 100;
    always begin
        #(CLK_PERIOD/2) 
        clk = ~clk;
    end 
	
	
	initial begin
		clk = 0; 
		instruction_in = 0; 
		inst_load_en = 0; 
		reset_all = 0; 
		reset_instr = 0; 
		#50 
		
	end
	
	ALU_tb UUT(.clk(clk),
			   .A(A), 
			   .B(B),
			   .instruction_in(instruction_in),
			   .inst_load_en(inst_load_en), 
			   .reset_instr(reset_instr),
			   .reset_all(reset_all),
			   .result(result)
	);

			 
endmodule 