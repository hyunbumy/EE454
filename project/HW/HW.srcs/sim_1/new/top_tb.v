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
  parameter c_CLOCK_PERIOD_NS = 100;
  parameter c_CLKS_PER_BIT    = 87;     // 100000000 / 2000000
  parameter c_BIT_PERIOD      = 8600;
   
  reg r_Clock = 0;
  reg r_Tx_DV = 0;
  wire w_Tx_Done;
  reg [7:0] r_Tx_Byte = 0;
  reg r_Rx_Serial = 1;
  wire [7:0] w_Rx_Byte;
  wire w_Tx_Bit;   
  wire r_Rx_Bit;
  
  integer i;
  
    // Takes in input byte and serializes it 
  task UART_WRITE_BYTE;
    input [7:0] i_Data;
    integer     ii;
    begin
       
      // Send Start Bit
      r_Rx_Serial <= 1'b0;
      #(c_BIT_PERIOD);
      #1000;
       
       
      // Send Data Byte
      for (ii=0; ii<8; ii=ii+1)
        begin
          r_Rx_Serial <= i_Data[ii];
          #(c_BIT_PERIOD);
        end
       
      // Send Stop Bit
      r_Rx_Serial <= 1'b1;
      #(c_BIT_PERIOD);
     end
  endtask // UART_WRITE_BYTE
  
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
    .UART_TXD_IN(r_Rx_Serial),
    .UART_RXD_OUT(w_Tx_Bit)
   );
 
   
  always
    #(c_CLOCK_PERIOD_NS/2) r_Clock <= !r_Clock;
 
   
  // Main Testing:
  initial
    begin
       
      // Tell UART to send a command (exercise Tx)
      @(posedge r_Clock);
      UART_WRITE_BYTE(8'd0);
      @(posedge r_Clock);
      
      for (i = 0; i < 50; i=i+1)
      begin
        UART_WRITE_BYTE(8'd97);
        UART_WRITE_BYTE(8'd98);
        UART_WRITE_BYTE(8'd99);
        UART_WRITE_BYTE(8'd100);
      end
      @(posedge r_Clock);
      
      
       
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