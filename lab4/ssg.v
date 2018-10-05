
//////////////////////////////////////////////////////////////////////////////////
// Author:			Brandon Franzke, Gandhi Puvvada, Bilal Zafar
// Create Date:		02/17/2008, 2/6/2012 
// File Name:		ee201_numlock_top.v [EXERCISE given to studnents]
// Description: 
//
//
// Revision: 		2.1
// Additional Comments: Students: Search for the "TODO" sections and complete them.
//                                There are about eleven "TODO" sections.
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 1ps

module ee201_numlock_top (

        ClkPort,                           // the 100 MHz incoming clock signal
		// Sw7, Sw6, Sw5, Sw4, Sw3, Sw2, Sw1, Sw0, // 8 switches
			Sw3, Sw2, Sw1, Sw0,
		Ld7, Ld6, Ld5, Ld4, Ld3, Ld2, Ld1, Ld0, // 8 LEDs
		An3, An2, An1, An0,			       // 4 anodes
		Ca, Cb, Cc, Cd, Ce, Cf, Cg,        // 7 cathodes
		Dp                                 // Dot Point Cathode on SSDs
	  );


	/*  INPUTS */
	// Clock & Reset I/O
	input		ClkPort;	
// TODO: DEFINE THE INPUTS (buttons and switches) you need for this project
// make sure to add those to the ee201_numlock_top PORT list also!	
	// Project Specific Inputs
	input		Sw3, Sw2, Sw1, Sw0;	

	
	
	/*  OUTPUTS */
	// Project Specific Outputs
	// SSD Outputs
	output 	Cg, Cf, Ce, Cd, Cc, Cb, Ca, Dp;
	output 	An0, An1, An2, An3;	
	
	
	
	/*  LOCAL SIGNALS */
	wire			reset, ClkPort;
	wire			board_clk, sys_clk;
	wire [1:0]		ssdscan_clk;
	reg [26:0]	    DIV_CLK;
	wire [3:0]		SSD0, SSD1, SSD2, SSD3;	
	reg [6:0]  		SSD_CATHODES;
	wire [6:0] 		SSD_CATHODES_blinking;	

	
	
	
//------------
// CLOCK DIVISION

	// The clock division circuitary works like this:
	//
	// ClkPort ---> [BUFGP2] ---> board_clk
	// board_clk ---> [clock dividing counter] ---> DIV_CLK
	// DIV_CLK ---> [constant assignment] ---> sys_clk;
	
	BUFGP BUFGP1 (board_clk, ClkPort); 	
	
//------------
	// Our clock is too fast (100MHz) for SSD scanning
	// create a series of slower "divided" clocks
	// each successive bit is 1/2 frequency
// TODO: create the sensitivity list
	always @ (board_clk, reset)  
	begin : CLOCK_DIVIDER
      if (reset)
			DIV_CLK <= 0;
      else
			DIV_CLK <= DIV_CLK + 1'b1;
			// just incrementing makes our life easier
// TODO: add the incrementer code
			
			
	end		
//------------	
	// pick a divided clock bit to assign to system clock
	// your decision should not be "too fast" or you will not see you state machine working
	assign	sys_clk = DIV_CLK[25]; // DIV_CLK[25] (~1.5Hz) = (100MHz / 2**26) 
	

	
//------------
// SSD (Seven Segment Display)

// TODO: finish the assignment for SSD3, SSD2, SSD1	
	assign SSD3 = ;
	assign SSD2 = ;
	assign SSD1 = ; 
	assign SSD0 = ;
	
	
	// need a scan clk for the seven segment display 
	
	// 100 MHz / 2^18 = 381.5 cycles/sec ==> frequency of DIV_CLK[17]
	// 100 MHz / 2^19 = 190.7 cycles/sec ==> frequency of DIV_CLK[18]
	// 100 MHz / 2^20 =  95.4 cycles/sec ==> frequency of DIV_CLK[19]
	
	// 381.5 cycles/sec (2.62 ms per digit) [which means all 4 digits are lit once every 10.5 ms (reciprocal of 95.4 cycles/sec)] works well.
	
	//                  --|  |--|  |--|  |--|  |--|  |--|  |--|  |--|  |   
    //                    |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  | 
	//  DIV_CLK[17]       |__|  |__|  |__|  |__|  |__|  |__|  |__|  |__|
	//
	//               -----|     |-----|     |-----|     |-----|     |
    //                    |  0  |  1  |  0  |  1  |     |     |     |     
	//  DIV_CLK[18]       |_____|     |_____|     |_____|     |_____|
	//
	//         -----------|           |-----------|           |
    //                    |  0     0  |  1     1  |           |           
	//  DIV_CLK[19]       |___________|           |___________|
	//
	
	assign ssdscan_clk = DIV_CLK[19:18];
	
	assign An0	= !(~(ssdscan_clk[1]) && ~(ssdscan_clk[0]));  // when ssdscan_clk = 00
	assign An1	= !(~(ssdscan_clk[1]) &&  (ssdscan_clk[0]));  // when ssdscan_clk = 01
	assign An2	= !( (ssdscan_clk[1]) && ~(ssdscan_clk[0]));  // when ssdscan_clk = 10
	assign An3	= !( (ssdscan_clk[1]) &&  (ssdscan_clk[0]));  // when ssdscan_clk = 11
	
	
	always @ (ssdscan_clk, SSD0, SSD1, SSD2, SSD3)
	begin : SSD_SCAN_OUT
		case (ssdscan_clk) 
		2'b00: SSD = SSD0;
		2'b01: SSD = SSD1;
		2'b10: SSD = SSD2;
		2'b11: SSD = SSD3;

		endcase 
	end	
	always @ (SSD) 
	begin : HEX_TO_SSD
		case (SSD)
			4'b0000: SSD_CATHODES = 7'b0000001; // 0
			4'b0001: SSD_CATHODES = 7'b1001111; // 1
			4'b0010: SSD_CATHODES = 7'b0010010; // 2
			4'b0011: SSD_CATHODES = 7'b0000110; // 3
			4'b0100: SSD_CATHODES = 7'b1001100; // 4
			4'b0101: SSD_CATHODES = 7'b0100100; // 5
			4'b0110: SSD_CATHODES = 7'b0100000; // 6
			4'b0111: SSD_CATHODES = 7'b0001111; // 7
			4'b1000: SSD_CATHODES = 7'b0000000; // 8
			4'b1001: SSD_CATHODES = 7'b0001100; // 9
// TODO: write cases for 0-9
			4'b1010: SSD_CATHODES = 7'b0001000 ; // A
			4'b1011: SSD_CATHODES = 7'b1100000 ; // B
			4'b1100: SSD_CATHODES = 7'b0110001 ; // C
			4'b1101: SSD_CATHODES = 7'b1000010 ; // D
			4'b1110: SSD_CATHODES = 7'b0110000 ; // E
			4'b1111: SSD_CATHODES = 7'b0111000 ; // F    
			default: SSD_CATHODES = 7'bXXXXXXX ; // default is not needed as we covered all cases
		endcase
	end	
	
endmodule


