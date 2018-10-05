
module ALU_top(
         ClkPort,
		     CPU_RESET, 
         swt, 
			   An3, An2, An1, An0,			       // 4 anodes
         Ca, Cb, Cc, Cd, Ce, Cf, Cg,        // 7 cathodes
         Dp 
			   );
			   
	input CPU_RESET;
	input ClkPort;
	input [15:0] swt;
	
	output 	Cg, Cf, Ce, Cd, Cc, Cb, Ca, Dp;
  output  An0, An1, An2, An3;  
		
	wire [5:0] A, B;
	wire inst_load_en, instruction_in, reset_instr, reset_all; 
	wire [11:0] result;
	wire [3:0] dig1, dig2, dig3, dig4;
	
	assign A = swt[5:0];
	assign B = swt[11:6];
	assign instruction_in = swt[12];
	assign inst_load_en = swt[13];
	assign reset_instr = swt[14];
	assign reset_all = swt[15];
	
	
	ALU UUT(.clk(ClkPort),
		   .A_in(A), 
		   .B_in(B),
		   .instruction_in(instruction_in),
		   .inst_load_en(inst_load_en), 
		   .reset_instr(reset_instr),
		   .reset_all(reset_all),
		   .result(result)
	);
	
	decoder decoder(result, dig1, dig2, dig3, dig4);
	ssg ssg(dig1, dig2, dig3, dig4, ClkPort, CPU_RESET, An3, An2, An1, An0, Ca, Cb, Cc, Cd, Ce, Cf, Cg, Dp);
		
endmodule