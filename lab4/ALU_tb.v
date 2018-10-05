//////////////////////////////////////////////////////////////////////////////////
// Module Name: ALU_tb
// Author: Daniel Dai, Brad Yang, Juliana Echternach
//////////////////////////////////////////////////////////////////////////////////

module ALU_tb();
	
	reg clk, instruction_in, inst_load_en, reset_instr, reset_all;
	reg [5:0] A, B; 
	wire [11:0] result;
	
	
	parameter CLK_PERIOD = 100;
    always begin
        #(CLK_PERIOD/2) 
        clk = ~clk;
    end 
	
	
	initial begin
		clk = 0; 
		instruction_in = 1; 
		inst_load_en = 1; 
		reset_all = 1; 
		reset_instr = 1; 
		#100 ;
		reset_instr = 1; 
		reset_all = 0;
		inst_load_en = 1; 
		A = 6'b000001;
        B = 6'b000001;
        #(2*CLK_PERIOD);
        inst_load_en = 0; 
        #(2*CLK_PERIOD);
        inst_load_en = 1; 
        #(2*CLK_PERIOD);
        inst_load_en = 0; 
        #(2*CLK_PERIOD);
        inst_load_en = 1; 
		#CLK_PERIOD;
		instruction_in = 1;
		
		#(CLK_PERIOD);
        instruction_in = 1; 
        inst_load_en = 0;
        A = 6'b000101;
        B = 6'b000101;
		#50 
		inst_load_en = 0; 
		instruction_in = 0; 
		#100 
		A = 6'b0010;
		B = 6'b0011;
		#50
		inst_load_en = 1; 
		instruction_in = 1; 
		reset_instr = 1; 
		#50 
		A = 6'b1010;
		B = 6'b1011;
		 
		
	end
	
	ALU UUT(.clk(clk),
			   .A_in(A), 
			   .B_in(B),
			   .instruction_in(instruction_in),
			   .inst_load_en(inst_load_en), 
			   .reset_instr(reset_instr),
			   .reset_all(reset_all),
			   .result(result)
	);

			 
endmodule 
