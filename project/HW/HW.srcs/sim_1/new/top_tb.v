//////////////////////////////////////////////////////////////////////
// File Downloaded from http://www.nandland.com
//////////////////////////////////////////////////////////////////////
 
// This testbench will exercise both the UART Tx and Rx.
// It sends out byte 0xAB over the transmitter
// It then exercises the receive by receiving byte 0x3F
`timescale 1ns/10ps
 
//`include "uart_tx.v"
//`include "uart_rx.v"
 
module top_tb ();
 
  // Testbench uses a 100 MHz clock
  // Want to interface to 9600 baud UART
  // 10000000 / 9600 = 1042 Clocks Per Bit.
  parameter c_CLOCK_PERIOD_NS = 10;
  parameter c_CLKS_PER_BIT    = 870;
//  parameter c_BIT_PERIOD      = 8600;
   
  reg r_Clock = 0;
  reg r_Tx_DV = 0;
  wire w_Tx_Done;
  reg [7:0] r_Tx_Byte = 0;
  reg r_Rx_Serial = 1;
  wire [7:0] w_Rx_Byte;
  wire w_Tx_Bit;   
   
//  uart_tx #(.CLKS_PER_BIT(c_CLKS_PER_BIT)) UART_TX_INST
//    (.i_Clock(r_Clock),
//     .i_Tx_DV(r_Tx_DV),
//     .i_Tx_Byte(r_Tx_Byte),
//     .o_Tx_Active(),
//     .o_Tx_Serial(w_Tx_Bit),
//     .o_Tx_Done(w_Tx_Done)
//     );
     
   hash_top inst (
    .CLK100MHZ(r_Clock),
    .BTNC(r_Tx_DV),
    .UART_TXD_IN(),
    .UART_RXD_OUT(w_Tx_Bit)
   );
 
   
  always
    #(c_CLOCK_PERIOD_NS/2) r_Clock <= !r_Clock;
 
   
  // Main Testing:
  initial
    begin
       
      // Tell UART to send a command (exercise Tx)
      @(posedge r_Clock);
      @(posedge r_Clock);
      r_Tx_DV <= 1'b1;
      r_Tx_Byte <= 8'd96;
      @(posedge r_Clock);
      @(posedge r_Clock);
      @(posedge r_Clock);
      @(posedge r_Clock);
      r_Tx_DV <= 1'b0;
      @(posedge w_Tx_Done);
       
      // Send a command to the UART (exercise Rx)
//      @(posedge r_Clock);
//      UART_WRITE_BYTE(8'h3F);
//      @(posedge r_Clock);
             
//      // Check that the correct command was received
//      if (w_Rx_Byte == 8'h3F)
//        $display("Test Passed - Correct Byte Received");
//      else
//        $display("Test Failed - Incorrect Byte Received");
       
    end
   
endmodule