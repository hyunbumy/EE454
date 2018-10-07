// Top Module 

module ALU_top(
                ClkPort, 
                CPU_RESET, 
                swt, 
                LED, 
                An3, An2, An1, An0,			       // 4 anodes
                Ca, Cb, Cc, Cd, Ce, Cf, Cg,        // 7 cathodes
                Dp 
                );
			   
    // define inputs and outputs 
	input ClkPort;
	input CPU_RESET;
	input [15:0] swt;
	output 	Cg, Cf, Ce, Cd, Cc, Cb, Ca, Dp;
    output  An0, An1, An2, An3;  
    output [15:0] LED; 

	wire [5:0] A, B;
	wire inst_load_en, instruction_in, reset_instr, reset_all; 
	wire [11:0] result;
	wire [3:0] dig1, dig2, dig3, dig4;
	
	wire  Cg1, Cf1, Ce1, Cd1, Cc1, Cb1, Ca1, Dp1;
    wire  An01, An11, An21, An31;  
	ALU UUT(.clk(ClkPort),
		   .A_in(A), 
		   .B_in(B),
		   .instruction_in(instruction_in),
		   .inst_load_en(inst_load_en), 
		   .reset_instr(reset_instr),
		   .reset_all(reset_all),
		   .result(result)
	);
	
	
    decoder d(.value(result), .dig1(dig1), .dig2(dig2), .dig3(dig3), .dig4(dig4));
    
    ssg s(.dig1(dig1), 
         .dig2(dig2), 
         .dig3(dig3), 
         .dig4(dig4), 
         .ClkPort(ClkPort), 
         .reset(reset_all), 
         .An3(An31), 
         .An2(An21), 
         .An1(An11), 
         .An0(An01), 
         .Ca(Ca1), 
         .Cc(Cc1), 
         .Cd(Cd1), 
         .Ce(Ce1), 
         .Cf(Cf1),
         .Cg(Cg1), 
         .Dp(Dp1)
      );
      
      assign Cg = Cg1;
      assign Cf = Cf1;
      assign Ce = Ce1;
      assign Cd = Cd1;
      assign Cc = Cc1;
      assign Cb = Cb1;
      assign Ca = Ca1;
      assign Dp = Dp1;
      assign An0 = An01;
      assign An1 = An11;
      assign An2 = An21;
      assign An3 = An31;  
      
	assign LED[0] = Cg1;
	assign LED[1] = Cf1;
	assign LED[2] = Ce1;
	assign LED[3] = Cd1;
	assign LED[4] = Cc1;
	assign LED[5] = Cb1;
	assign LED[6] = Ca1;
	assign LED[7] = Dp1;
	assign LED[8] = An01;
	assign LED[9] = An11;
	assign LED[10] = An21;
	assign LED[11] = An31;  
	assign LED[12] = swt[12];
	assign LED[13] = swt[13];
	assign LED[14] = swt[14];	
    assign LED[15] = swt[15];
	
      // connect the design under test with the switches
      assign A = swt[5:0];
      assign B = swt[11:6];
      assign instruction_in = swt[12];
      assign inst_load_en = swt[13];
      assign reset_instr = swt[14];
      assign reset_all = swt[15];
	
	
	
endmodule
