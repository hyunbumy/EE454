//////////////////////////////////////////////////////////////////////////////////
// Module Name: ALU
// Author: Daniel Dai, Brad Yang, Juliana Echternach
//////////////////////////////////////////////////////////////////////////////////

module ALU(input clk, 
            input [5:0] A_in, 
            input [5:0] B_in, 
            input instruction_in,
            input inst_load_en,
            input reset_instr,
            input reset_all,
            output reg [11:0] result
			    );

  wire qs3, qs2, qs1, qs0;

	localparam  ADD = 4'b1000, 
              SUBTRACT = 4'b1001, 
              MODULUS = 4'b1010, 
              MULTIPLY = 4'b1011,
              DIVIDE = 4'b1100,
              NOT = 4'b1101,
              AND = 4'b1110,
              OR = 4'b1111,
              XOR = 4'b0000,
              SHIFT_LEFT = 4'b0010,
              SHIFT_RIGHT = 4'b0001,
              GETOP = 4'b0100;

	reg [3:0] state;
	assign {qs3, qs2, qs1, qs0} = state;
  reg [3:0] opcode;
  reg [2:0] counter;
  
  reg [5:0] A;
  reg [5:0] B;   
  
  reg flag; 
  /*
  initial
  begin
    A <= 6'bXXXXXX;
    B <= 6'bXXXXXX;
    opcode <= 4'b0000;
    counter <= 2'b00;
    
  end
*/
	always @(posedge clk)
	begin
		if(reset_all) 
		begin
		    state <= GETOP;
		    A <= 6'bXXXXXX;
		    B <= 6'bXXXXXX;
        opcode <= 4'b0000;
        counter <= 2'b00;
        result <= 12'b000000000000;
        flag <= 0; 
		end
    
    else
    begin    
        case(state)
        GETOP:
        begin
            if (!reset_instr)
            begin
                counter <= 0;
            end
            
            else if (counter == 3'b100)
            begin
                A <= A_in;
                B <= B_in;
                case (opcode)
                  ADD:
                  begin
                    state <= ADD;
                  end
                  SUBTRACT:
                  begin
                    state <= SUBTRACT;
                  end
                  MODULUS:
                  begin
                    state <= MODULUS;
                  end
                  MULTIPLY:
                  begin
                    state <= MULTIPLY;
                  end
                  DIVIDE:
                  begin
                    state <= DIVIDE;
                  end 
                  NOT:
                  begin
                    state <= NOT;
                  end
                  AND:
                  begin
                    state <= AND;
                  end
                  OR:
                  begin
                    state <= OR;
                  end
                  XOR:
                  begin
                    state <= XOR;
                  end
                  SHIFT_LEFT:
                  begin
                    state <= SHIFT_LEFT;
                  end
                  SHIFT_RIGHT:
                  begin
                    state <= SHIFT_RIGHT;
                  end                                                                                                                                 
                endcase
            end
            else if (inst_load_en)
                        begin
                            if( ~flag) 
                                begin
                                    opcode[counter] <= instruction_in;
                                    counter <= counter + 1;
                                    flag <= 1;
                                end
                        end
            else if(~inst_load_en)
                    begin
                        flag <=0; 
                    end
        end
        ADD:
        begin
            result <= A + B;
            state <= GETOP;
        end
        SUBTRACT:
        begin
            result <= A - B;
            state <= GETOP;
        end
        MODULUS:
        begin
          result <= A % B;
          state <= GETOP;
        end
        MULTIPLY:
        begin
          result <= A * B;
          state <= GETOP;
        end
        DIVIDE:
        begin
          result <= A / B;
          state <= GETOP;
        end 
        NOT:
        begin
          result <= ~A;
          state <= GETOP;
        end
        AND:
        begin
          result <= A & B;
          state <= GETOP;
        end
        OR:
        begin
          result <= A | B;
          state <= GETOP;
        end
        XOR:
        begin
          result <= A ^ B;
          state <= GETOP;
        end
        SHIFT_LEFT:
        begin
          result <= A << B;
          state <= GETOP;
        end
        SHIFT_RIGHT:
        begin
          result <= A >> B;
          state <= GETOP;
        end        
        endcase
        //state <= GETOP;
     end
	end 
	
endmodule
