/*
 * These source files contain a hardware description of a network
 * automatically generated by CONNECT (CONfigurable NEtwork Creation Tool).
 *
 * This product includes a hardware design developed by Carnegie Mellon
 * University.
 *
 * Copyright (c) 2012 by Michael K. Papamichael, Carnegie Mellon University
 *
 * For more information, see the CONNECT project website at:
 *   http://www.ece.cmu.edu/~mpapamic/connect
 *
 * This design is provided for internal, non-commercial research use only, 
 * cannot be used for, or in support of, goods or services, and is not for
 * redistribution, with or without modifications.
 * 
 * You may not use the name "Carnegie Mellon University" or derivations
 * thereof to endorse or promote products derived from this software.
 *
 * THE SOFTWARE IS PROVIDED "AS-IS" WITHOUT ANY WARRANTY OF ANY KIND, EITHER
 * EXPRESS, IMPLIED OR STATUTORY, INCLUDING BUT NOT LIMITED TO ANY WARRANTY
 * THAT THE SOFTWARE WILL CONFORM TO SPECIFICATIONS OR BE ERROR-FREE AND ANY
 * IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE,
 * TITLE, OR NON-INFRINGEMENT.  IN NO EVENT SHALL CARNEGIE MELLON UNIVERSITY
 * BE LIABLE FOR ANY DAMAGES, INCLUDING BUT NOT LIMITED TO DIRECT, INDIRECT,
 * SPECIAL OR CONSEQUENTIAL DAMAGES, ARISING OUT OF, RESULTING FROM, OR IN
 * ANY WAY CONNECTED WITH THIS SOFTWARE (WHETHER OR NOT BASED UPON WARRANTY,
 * CONTRACT, TORT OR OTHERWISE).
 *
 */


//
// Generated by Bluespec Compiler, version 2012.01.A (build 26572, 2012-01-17)
//
// On Fri Nov 18 09:45:42 EST 2016
//
// Method conflict info:
// Method: enq
// Conflict-free: deq, notEmpty, notFull
// Conflicts: enq
//
// Method: deq
// Conflict-free: enq, notEmpty, notFull
// Conflicts: deq
//
// Method: notEmpty
// Conflict-free: enq, deq, notEmpty, notFull
//
// Method: notFull
// Conflict-free: enq, deq, notEmpty, notFull
//
//
// Ports:
// Name                         I/O  size props
// deq                            O    70
// notEmpty                       O     2 reg
// notFull                        O     2 reg
// CLK                            I     1 clock
// RST_N                          I     1 reset
// enq_fifo_in                    I     1
// enq_data_in                    I    70
// deq_fifo_out                   I     1
// EN_enq                         I     1
// EN_deq                         I     1
//
// No combinational paths from inputs to outputs
//
//

`ifdef BSV_ASSIGNMENT_DELAY
`else
`define BSV_ASSIGNMENT_DELAY
`endif

module mkInputVCQueues(CLK,
		       RST_N,

		       enq_fifo_in,
		       enq_data_in,
		       EN_enq,

		       deq_fifo_out,
		       EN_deq,
		       deq,

		       notEmpty,

		       notFull);
  input  CLK;
  input  RST_N;

  // action method enq
  input  enq_fifo_in;
  input  [69 : 0] enq_data_in;
  input  EN_enq;

  // actionvalue method deq
  input  deq_fifo_out;
  input  EN_deq;
  output [69 : 0] deq;

  // value method notEmpty
  output [1 : 0] notEmpty;

  // value method notFull
  output [1 : 0] notFull;

  // signals for module outputs
  wire [69 : 0] deq;
  wire [1 : 0] notEmpty, notFull;

  // inlined wires
  wire [2 : 0] inputVCQueues_ifc_mf_ifc_new_head$wget,
	       inputVCQueues_ifc_mf_ifc_new_tail$wget;
  wire [1 : 0] inputVCQueues_ifc_mf_ifc_rdFIFO$wget,
	       inputVCQueues_ifc_mf_ifc_wrFIFO$wget;

  // register inputVCQueues_ifc_mf_ifc_heads
  reg [2 : 0] inputVCQueues_ifc_mf_ifc_heads;
  wire [2 : 0] inputVCQueues_ifc_mf_ifc_heads$D_IN;
  wire inputVCQueues_ifc_mf_ifc_heads$EN;

  // register inputVCQueues_ifc_mf_ifc_heads_1
  reg [2 : 0] inputVCQueues_ifc_mf_ifc_heads_1;
  wire [2 : 0] inputVCQueues_ifc_mf_ifc_heads_1$D_IN;
  wire inputVCQueues_ifc_mf_ifc_heads_1$EN;

  // register inputVCQueues_ifc_mf_ifc_not_empty
  reg inputVCQueues_ifc_mf_ifc_not_empty;
  wire inputVCQueues_ifc_mf_ifc_not_empty$D_IN,
       inputVCQueues_ifc_mf_ifc_not_empty$EN;

  // register inputVCQueues_ifc_mf_ifc_not_empty_1
  reg inputVCQueues_ifc_mf_ifc_not_empty_1;
  wire inputVCQueues_ifc_mf_ifc_not_empty_1$D_IN,
       inputVCQueues_ifc_mf_ifc_not_empty_1$EN;

  // register inputVCQueues_ifc_mf_ifc_not_full
  reg inputVCQueues_ifc_mf_ifc_not_full;
  wire inputVCQueues_ifc_mf_ifc_not_full$D_IN,
       inputVCQueues_ifc_mf_ifc_not_full$EN;

  // register inputVCQueues_ifc_mf_ifc_not_full_1
  reg inputVCQueues_ifc_mf_ifc_not_full_1;
  wire inputVCQueues_ifc_mf_ifc_not_full_1$D_IN,
       inputVCQueues_ifc_mf_ifc_not_full_1$EN;

  // register inputVCQueues_ifc_mf_ifc_tails
  reg [2 : 0] inputVCQueues_ifc_mf_ifc_tails;
  wire [2 : 0] inputVCQueues_ifc_mf_ifc_tails$D_IN;
  wire inputVCQueues_ifc_mf_ifc_tails$EN;

  // register inputVCQueues_ifc_mf_ifc_tails_1
  reg [2 : 0] inputVCQueues_ifc_mf_ifc_tails_1;
  wire [2 : 0] inputVCQueues_ifc_mf_ifc_tails_1$D_IN;
  wire inputVCQueues_ifc_mf_ifc_tails_1$EN;

  // ports of submodule inputVCQueues_ifc_mf_ifc_fifoMem
  wire [69 : 0] inputVCQueues_ifc_mf_ifc_fifoMem$D_IN,
		inputVCQueues_ifc_mf_ifc_fifoMem$D_OUT;
  wire [3 : 0] inputVCQueues_ifc_mf_ifc_fifoMem$ADDR_IN,
	       inputVCQueues_ifc_mf_ifc_fifoMem$ADDR_OUT;
  wire inputVCQueues_ifc_mf_ifc_fifoMem$WE;

  // remaining internal signals
  wire [2 : 0] fifoRdPtr__h4011,
	       fifoWrPtr__h3541,
	       x__h2438,
	       x__h3030,
	       y__h2439,
	       y__h3031;
  wire IF_deq_fifo_out_THEN_NOT_inputVCQueues_ifc_mf__ETC___d89,
       IF_enq_fifo_in_THEN_NOT_inputVCQueues_ifc_mf_i_ETC___d88,
       IF_inputVCQueues_ifc_mf_ifc_new_head_whas__8_T_ETC___d58,
       IF_inputVCQueues_ifc_mf_ifc_new_tail_whas_THEN_ETC___d36,
       NOT_inputVCQueues_ifc_mf_ifc_rdFIFO_whas__2_3__ETC___d38,
       NOT_inputVCQueues_ifc_mf_ifc_rdFIFO_whas__2_3__ETC___d41,
       NOT_inputVCQueues_ifc_mf_ifc_rdFIFO_whas__2_3__ETC___d43,
       NOT_inputVCQueues_ifc_mf_ifc_wrFIFO_whas_5_OR__ETC___d60,
       NOT_inputVCQueues_ifc_mf_ifc_wrFIFO_whas_5_OR__ETC___d63,
       NOT_inputVCQueues_ifc_mf_ifc_wrFIFO_whas_5_OR__ETC___d65,
       inputVCQueues_ifc_mf_ifc_rdFIFO_whas__2_AND_in_ETC___d52,
       inputVCQueues_ifc_mf_ifc_rdFIFO_whas__2_AND_in_ETC___d54,
       inputVCQueues_ifc_mf_ifc_wrFIFO_whas_AND_input_ETC___d30,
       inputVCQueues_ifc_mf_ifc_wrFIFO_whas_AND_input_ETC___d32;

  // actionvalue method deq
  assign deq = inputVCQueues_ifc_mf_ifc_fifoMem$D_OUT ;

  // value method notEmpty
  assign notEmpty =
	     { inputVCQueues_ifc_mf_ifc_not_empty_1,
	       inputVCQueues_ifc_mf_ifc_not_empty } ;

  // value method notFull
  assign notFull =
	     { inputVCQueues_ifc_mf_ifc_not_full_1,
	       inputVCQueues_ifc_mf_ifc_not_full } ;

  // submodule inputVCQueues_ifc_mf_ifc_fifoMem
  RegFile_1port #( /*data_width*/ 32'd70,
		   /*addr_width*/ 32'd4) inputVCQueues_ifc_mf_ifc_fifoMem(.CLK(CLK),
									  .rst_n(RST_N),
									  .ADDR_IN(inputVCQueues_ifc_mf_ifc_fifoMem$ADDR_IN),
									  .ADDR_OUT(inputVCQueues_ifc_mf_ifc_fifoMem$ADDR_OUT),
									  .D_IN(inputVCQueues_ifc_mf_ifc_fifoMem$D_IN),
									  .WE(inputVCQueues_ifc_mf_ifc_fifoMem$WE),
									  .D_OUT(inputVCQueues_ifc_mf_ifc_fifoMem$D_OUT));

  // inlined wires
  assign inputVCQueues_ifc_mf_ifc_wrFIFO$wget = { 1'd1, enq_fifo_in } ;
  assign inputVCQueues_ifc_mf_ifc_rdFIFO$wget = { 1'd1, deq_fifo_out } ;
  assign inputVCQueues_ifc_mf_ifc_new_tail$wget = fifoWrPtr__h3541 + 3'd1 ;
  assign inputVCQueues_ifc_mf_ifc_new_head$wget = fifoRdPtr__h4011 + 3'd1 ;

  // register inputVCQueues_ifc_mf_ifc_heads
  assign inputVCQueues_ifc_mf_ifc_heads$D_IN = x__h3030 ;
  assign inputVCQueues_ifc_mf_ifc_heads$EN =
	     EN_deq && inputVCQueues_ifc_mf_ifc_rdFIFO$wget[1] &&
	     !inputVCQueues_ifc_mf_ifc_rdFIFO$wget[0] ;

  // register inputVCQueues_ifc_mf_ifc_heads_1
  assign inputVCQueues_ifc_mf_ifc_heads_1$D_IN = x__h3030 ;
  assign inputVCQueues_ifc_mf_ifc_heads_1$EN =
	     EN_deq && inputVCQueues_ifc_mf_ifc_rdFIFO$wget[1] &&
	     inputVCQueues_ifc_mf_ifc_rdFIFO$wget[0] ;

  // register inputVCQueues_ifc_mf_ifc_not_empty
  assign inputVCQueues_ifc_mf_ifc_not_empty$D_IN =
	     inputVCQueues_ifc_mf_ifc_wrFIFO_whas_AND_input_ETC___d32 ;
  assign inputVCQueues_ifc_mf_ifc_not_empty$EN =
	     inputVCQueues_ifc_mf_ifc_wrFIFO_whas_AND_input_ETC___d32 ||
	     EN_deq && inputVCQueues_ifc_mf_ifc_rdFIFO$wget[1] &&
	     NOT_inputVCQueues_ifc_mf_ifc_wrFIFO_whas_5_OR__ETC___d63 ;

  // register inputVCQueues_ifc_mf_ifc_not_empty_1
  assign inputVCQueues_ifc_mf_ifc_not_empty_1$D_IN =
	     inputVCQueues_ifc_mf_ifc_wrFIFO_whas_AND_input_ETC___d30 ;
  assign inputVCQueues_ifc_mf_ifc_not_empty_1$EN =
	     inputVCQueues_ifc_mf_ifc_wrFIFO_whas_AND_input_ETC___d30 ||
	     EN_deq && inputVCQueues_ifc_mf_ifc_rdFIFO$wget[1] &&
	     NOT_inputVCQueues_ifc_mf_ifc_wrFIFO_whas_5_OR__ETC___d60 ;

  // register inputVCQueues_ifc_mf_ifc_not_full
  assign inputVCQueues_ifc_mf_ifc_not_full$D_IN =
	     !EN_enq || !inputVCQueues_ifc_mf_ifc_wrFIFO$wget[1] ||
	     !NOT_inputVCQueues_ifc_mf_ifc_rdFIFO_whas__2_3__ETC___d41 ;
  assign inputVCQueues_ifc_mf_ifc_not_full$EN =
	     EN_enq && inputVCQueues_ifc_mf_ifc_wrFIFO$wget[1] &&
	     NOT_inputVCQueues_ifc_mf_ifc_rdFIFO_whas__2_3__ETC___d41 ||
	     inputVCQueues_ifc_mf_ifc_rdFIFO_whas__2_AND_in_ETC___d54 ;

  // register inputVCQueues_ifc_mf_ifc_not_full_1
  assign inputVCQueues_ifc_mf_ifc_not_full_1$D_IN =
	     !EN_enq || !inputVCQueues_ifc_mf_ifc_wrFIFO$wget[1] ||
	     !NOT_inputVCQueues_ifc_mf_ifc_rdFIFO_whas__2_3__ETC___d38 ;
  assign inputVCQueues_ifc_mf_ifc_not_full_1$EN =
	     EN_enq && inputVCQueues_ifc_mf_ifc_wrFIFO$wget[1] &&
	     NOT_inputVCQueues_ifc_mf_ifc_rdFIFO_whas__2_3__ETC___d38 ||
	     inputVCQueues_ifc_mf_ifc_rdFIFO_whas__2_AND_in_ETC___d52 ;

  // register inputVCQueues_ifc_mf_ifc_tails
  assign inputVCQueues_ifc_mf_ifc_tails$D_IN = x__h2438 ;
  assign inputVCQueues_ifc_mf_ifc_tails$EN =
	     EN_enq && inputVCQueues_ifc_mf_ifc_wrFIFO$wget[1] &&
	     !inputVCQueues_ifc_mf_ifc_wrFIFO$wget[0] ;

  // register inputVCQueues_ifc_mf_ifc_tails_1
  assign inputVCQueues_ifc_mf_ifc_tails_1$D_IN = x__h2438 ;
  assign inputVCQueues_ifc_mf_ifc_tails_1$EN =
	     EN_enq && inputVCQueues_ifc_mf_ifc_wrFIFO$wget[1] &&
	     inputVCQueues_ifc_mf_ifc_wrFIFO$wget[0] ;

  // submodule inputVCQueues_ifc_mf_ifc_fifoMem
  assign inputVCQueues_ifc_mf_ifc_fifoMem$ADDR_IN =
	     { enq_fifo_in, fifoWrPtr__h3541 } ;
  assign inputVCQueues_ifc_mf_ifc_fifoMem$ADDR_OUT =
	     { deq_fifo_out, fifoRdPtr__h4011 } ;
  assign inputVCQueues_ifc_mf_ifc_fifoMem$D_IN = enq_data_in ;
  assign inputVCQueues_ifc_mf_ifc_fifoMem$WE = EN_enq ;

  // remaining internal signals
  assign IF_deq_fifo_out_THEN_NOT_inputVCQueues_ifc_mf__ETC___d89 =
	     deq_fifo_out ?
	       !inputVCQueues_ifc_mf_ifc_not_empty_1 :
	       !inputVCQueues_ifc_mf_ifc_not_empty ;
  assign IF_enq_fifo_in_THEN_NOT_inputVCQueues_ifc_mf_i_ETC___d88 =
	     enq_fifo_in ?
	       !inputVCQueues_ifc_mf_ifc_not_full_1 :
	       !inputVCQueues_ifc_mf_ifc_not_full ;
  assign IF_inputVCQueues_ifc_mf_ifc_new_head_whas__8_T_ETC___d58 =
	     x__h3030 == y__h3031 ;
  assign IF_inputVCQueues_ifc_mf_ifc_new_tail_whas_THEN_ETC___d36 =
	     x__h2438 == y__h2439 ;
  assign NOT_inputVCQueues_ifc_mf_ifc_rdFIFO_whas__2_3__ETC___d38 =
	     (!EN_deq || !inputVCQueues_ifc_mf_ifc_rdFIFO$wget[1] ||
	      inputVCQueues_ifc_mf_ifc_wrFIFO$wget[0] !=
	      inputVCQueues_ifc_mf_ifc_rdFIFO$wget[0]) &&
	     IF_inputVCQueues_ifc_mf_ifc_new_tail_whas_THEN_ETC___d36 &&
	     inputVCQueues_ifc_mf_ifc_wrFIFO$wget[0] ;
  assign NOT_inputVCQueues_ifc_mf_ifc_rdFIFO_whas__2_3__ETC___d41 =
	     (!EN_deq || !inputVCQueues_ifc_mf_ifc_rdFIFO$wget[1] ||
	      inputVCQueues_ifc_mf_ifc_wrFIFO$wget[0] !=
	      inputVCQueues_ifc_mf_ifc_rdFIFO$wget[0]) &&
	     IF_inputVCQueues_ifc_mf_ifc_new_tail_whas_THEN_ETC___d36 &&
	     !inputVCQueues_ifc_mf_ifc_wrFIFO$wget[0] ;
  assign NOT_inputVCQueues_ifc_mf_ifc_rdFIFO_whas__2_3__ETC___d43 =
	     (!EN_deq || !inputVCQueues_ifc_mf_ifc_rdFIFO$wget[1] ||
	      inputVCQueues_ifc_mf_ifc_wrFIFO$wget[0] !=
	      inputVCQueues_ifc_mf_ifc_rdFIFO$wget[0]) &&
	     IF_inputVCQueues_ifc_mf_ifc_new_tail_whas_THEN_ETC___d36 ;
  assign NOT_inputVCQueues_ifc_mf_ifc_wrFIFO_whas_5_OR__ETC___d60 =
	     (!EN_enq || !inputVCQueues_ifc_mf_ifc_wrFIFO$wget[1] ||
	      inputVCQueues_ifc_mf_ifc_rdFIFO$wget[0] !=
	      inputVCQueues_ifc_mf_ifc_wrFIFO$wget[0]) &&
	     IF_inputVCQueues_ifc_mf_ifc_new_head_whas__8_T_ETC___d58 &&
	     inputVCQueues_ifc_mf_ifc_rdFIFO$wget[0] ;
  assign NOT_inputVCQueues_ifc_mf_ifc_wrFIFO_whas_5_OR__ETC___d63 =
	     (!EN_enq || !inputVCQueues_ifc_mf_ifc_wrFIFO$wget[1] ||
	      inputVCQueues_ifc_mf_ifc_rdFIFO$wget[0] !=
	      inputVCQueues_ifc_mf_ifc_wrFIFO$wget[0]) &&
	     IF_inputVCQueues_ifc_mf_ifc_new_head_whas__8_T_ETC___d58 &&
	     !inputVCQueues_ifc_mf_ifc_rdFIFO$wget[0] ;
  assign NOT_inputVCQueues_ifc_mf_ifc_wrFIFO_whas_5_OR__ETC___d65 =
	     (!EN_enq || !inputVCQueues_ifc_mf_ifc_wrFIFO$wget[1] ||
	      inputVCQueues_ifc_mf_ifc_rdFIFO$wget[0] !=
	      inputVCQueues_ifc_mf_ifc_wrFIFO$wget[0]) &&
	     IF_inputVCQueues_ifc_mf_ifc_new_head_whas__8_T_ETC___d58 ;
  assign fifoRdPtr__h4011 =
	     deq_fifo_out ?
	       inputVCQueues_ifc_mf_ifc_heads_1 :
	       inputVCQueues_ifc_mf_ifc_heads ;
  assign fifoWrPtr__h3541 =
	     enq_fifo_in ?
	       inputVCQueues_ifc_mf_ifc_tails_1 :
	       inputVCQueues_ifc_mf_ifc_tails ;
  assign inputVCQueues_ifc_mf_ifc_rdFIFO_whas__2_AND_in_ETC___d52 =
	     EN_deq && inputVCQueues_ifc_mf_ifc_rdFIFO$wget[1] &&
	     (!EN_enq || !inputVCQueues_ifc_mf_ifc_wrFIFO$wget[1] ||
	      inputVCQueues_ifc_mf_ifc_rdFIFO$wget[0] !=
	      inputVCQueues_ifc_mf_ifc_wrFIFO$wget[0]) &&
	     inputVCQueues_ifc_mf_ifc_rdFIFO$wget[0] ;
  assign inputVCQueues_ifc_mf_ifc_rdFIFO_whas__2_AND_in_ETC___d54 =
	     EN_deq && inputVCQueues_ifc_mf_ifc_rdFIFO$wget[1] &&
	     (!EN_enq || !inputVCQueues_ifc_mf_ifc_wrFIFO$wget[1] ||
	      inputVCQueues_ifc_mf_ifc_rdFIFO$wget[0] !=
	      inputVCQueues_ifc_mf_ifc_wrFIFO$wget[0]) &&
	     !inputVCQueues_ifc_mf_ifc_rdFIFO$wget[0] ;
  assign inputVCQueues_ifc_mf_ifc_wrFIFO_whas_AND_input_ETC___d30 =
	     EN_enq && inputVCQueues_ifc_mf_ifc_wrFIFO$wget[1] &&
	     (!EN_deq || !inputVCQueues_ifc_mf_ifc_rdFIFO$wget[1] ||
	      inputVCQueues_ifc_mf_ifc_wrFIFO$wget[0] !=
	      inputVCQueues_ifc_mf_ifc_rdFIFO$wget[0]) &&
	     inputVCQueues_ifc_mf_ifc_wrFIFO$wget[0] ;
  assign inputVCQueues_ifc_mf_ifc_wrFIFO_whas_AND_input_ETC___d32 =
	     EN_enq && inputVCQueues_ifc_mf_ifc_wrFIFO$wget[1] &&
	     (!EN_deq || !inputVCQueues_ifc_mf_ifc_rdFIFO$wget[1] ||
	      inputVCQueues_ifc_mf_ifc_wrFIFO$wget[0] !=
	      inputVCQueues_ifc_mf_ifc_rdFIFO$wget[0]) &&
	     !inputVCQueues_ifc_mf_ifc_wrFIFO$wget[0] ;
  assign x__h2438 = EN_enq ? inputVCQueues_ifc_mf_ifc_new_tail$wget : 3'd0 ;
  assign x__h3030 = EN_deq ? inputVCQueues_ifc_mf_ifc_new_head$wget : 3'd0 ;
  assign y__h2439 =
	     inputVCQueues_ifc_mf_ifc_wrFIFO$wget[0] ?
	       inputVCQueues_ifc_mf_ifc_heads_1 :
	       inputVCQueues_ifc_mf_ifc_heads ;
  assign y__h3031 =
	     inputVCQueues_ifc_mf_ifc_rdFIFO$wget[0] ?
	       inputVCQueues_ifc_mf_ifc_tails_1 :
	       inputVCQueues_ifc_mf_ifc_tails ;

  // handling of inlined registers

  always@(posedge CLK)
  begin
    if (!RST_N)
      begin
        inputVCQueues_ifc_mf_ifc_heads <= `BSV_ASSIGNMENT_DELAY 3'd0;
	inputVCQueues_ifc_mf_ifc_heads_1 <= `BSV_ASSIGNMENT_DELAY 3'd0;
	inputVCQueues_ifc_mf_ifc_not_empty <= `BSV_ASSIGNMENT_DELAY 1'd0;
	inputVCQueues_ifc_mf_ifc_not_empty_1 <= `BSV_ASSIGNMENT_DELAY 1'd0;
	inputVCQueues_ifc_mf_ifc_not_full <= `BSV_ASSIGNMENT_DELAY 1'd1;
	inputVCQueues_ifc_mf_ifc_not_full_1 <= `BSV_ASSIGNMENT_DELAY 1'd1;
	inputVCQueues_ifc_mf_ifc_tails <= `BSV_ASSIGNMENT_DELAY 3'd0;
	inputVCQueues_ifc_mf_ifc_tails_1 <= `BSV_ASSIGNMENT_DELAY 3'd0;
      end
    else
      begin
        if (inputVCQueues_ifc_mf_ifc_heads$EN)
	  inputVCQueues_ifc_mf_ifc_heads <= `BSV_ASSIGNMENT_DELAY
	      inputVCQueues_ifc_mf_ifc_heads$D_IN;
	if (inputVCQueues_ifc_mf_ifc_heads_1$EN)
	  inputVCQueues_ifc_mf_ifc_heads_1 <= `BSV_ASSIGNMENT_DELAY
	      inputVCQueues_ifc_mf_ifc_heads_1$D_IN;
	if (inputVCQueues_ifc_mf_ifc_not_empty$EN)
	  inputVCQueues_ifc_mf_ifc_not_empty <= `BSV_ASSIGNMENT_DELAY
	      inputVCQueues_ifc_mf_ifc_not_empty$D_IN;
	if (inputVCQueues_ifc_mf_ifc_not_empty_1$EN)
	  inputVCQueues_ifc_mf_ifc_not_empty_1 <= `BSV_ASSIGNMENT_DELAY
	      inputVCQueues_ifc_mf_ifc_not_empty_1$D_IN;
	if (inputVCQueues_ifc_mf_ifc_not_full$EN)
	  inputVCQueues_ifc_mf_ifc_not_full <= `BSV_ASSIGNMENT_DELAY
	      inputVCQueues_ifc_mf_ifc_not_full$D_IN;
	if (inputVCQueues_ifc_mf_ifc_not_full_1$EN)
	  inputVCQueues_ifc_mf_ifc_not_full_1 <= `BSV_ASSIGNMENT_DELAY
	      inputVCQueues_ifc_mf_ifc_not_full_1$D_IN;
	if (inputVCQueues_ifc_mf_ifc_tails$EN)
	  inputVCQueues_ifc_mf_ifc_tails <= `BSV_ASSIGNMENT_DELAY
	      inputVCQueues_ifc_mf_ifc_tails$D_IN;
	if (inputVCQueues_ifc_mf_ifc_tails_1$EN)
	  inputVCQueues_ifc_mf_ifc_tails_1 <= `BSV_ASSIGNMENT_DELAY
	      inputVCQueues_ifc_mf_ifc_tails_1$D_IN;
      end
  end

  // synopsys translate_off
  `ifdef BSV_NO_INITIAL_BLOCKS
  `else // not BSV_NO_INITIAL_BLOCKS
  initial
  begin
    inputVCQueues_ifc_mf_ifc_heads = 3'h2;
    inputVCQueues_ifc_mf_ifc_heads_1 = 3'h2;
    inputVCQueues_ifc_mf_ifc_not_empty = 1'h0;
    inputVCQueues_ifc_mf_ifc_not_empty_1 = 1'h0;
    inputVCQueues_ifc_mf_ifc_not_full = 1'h0;
    inputVCQueues_ifc_mf_ifc_not_full_1 = 1'h0;
    inputVCQueues_ifc_mf_ifc_tails = 3'h2;
    inputVCQueues_ifc_mf_ifc_tails_1 = 3'h2;
  end
  `endif // BSV_NO_INITIAL_BLOCKS
  // synopsys translate_on

  // handling of system tasks

  // synopsys translate_off
  always@(negedge CLK)
  begin
    #0;
    if (RST_N)
      if (EN_enq && IF_enq_fifo_in_THEN_NOT_inputVCQueues_ifc_mf_i_ETC___d88)
	$write("");
    if (RST_N)
      if (EN_enq && IF_enq_fifo_in_THEN_NOT_inputVCQueues_ifc_mf_i_ETC___d88)
	$write("");
    if (RST_N)
      if (EN_enq && IF_enq_fifo_in_THEN_NOT_inputVCQueues_ifc_mf_i_ETC___d88)
	$display("Dynamic assertion failed: \"MultiFIFOMem.bsv\", line 156, column 38\nEnqueing to full FIFO in MultiFIFOMem!");
    if (RST_N)
      if (EN_enq && IF_enq_fifo_in_THEN_NOT_inputVCQueues_ifc_mf_i_ETC___d88)
	$finish(32'd0);
    if (RST_N) if (EN_enq) $write("");
    if (RST_N)
      if (EN_deq && IF_deq_fifo_out_THEN_NOT_inputVCQueues_ifc_mf__ETC___d89)
	$display("Dynamic assertion failed: \"MultiFIFOMem.bsv\", line 190, column 40\nDequeing from empty FIFO in MultiFIFOMem!");
    if (RST_N)
      if (EN_deq && IF_deq_fifo_out_THEN_NOT_inputVCQueues_ifc_mf__ETC___d89)
	$finish(32'd0);
    if (RST_N) if (EN_deq) $write("");
    if (RST_N)
      if (EN_enq && inputVCQueues_ifc_mf_ifc_wrFIFO$wget[1] &&
	  NOT_inputVCQueues_ifc_mf_ifc_rdFIFO_whas__2_3__ETC___d43)
	$write("");
    if (RST_N)
      if (EN_deq && inputVCQueues_ifc_mf_ifc_rdFIFO$wget[1] &&
	  NOT_inputVCQueues_ifc_mf_ifc_wrFIFO_whas_5_OR__ETC___d65)
	$write("");
  end
  // synopsys translate_on
endmodule  // mkInputVCQueues

