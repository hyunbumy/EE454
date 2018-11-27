`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/18/2018 06:30:23 PM
// Design Name: 
// Module Name: hash_top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module hash_top(
        input CLK100MHZ,
        input BTNC,
        input UART_TXD_IN,
        output UART_RXD_OUT
    );
    
    wire [7:0] in;
    wire button;
    
    assign in = 8'd97;
    
    uart_tx #(.CLKS_PER_BIT(870)) tx_inst(
        .i_Clock(CLK100MHZ),
        .i_Tx_DV(button),
        .i_Tx_Byte(in),
        .o_Tx_Active(),
        .o_Tx_Serial(UART_RXD_OUT),
        .o_Tx_Done()
    );
    
    debounce db(
        .pb_in(BTNC),
        .clk(CLK100MHZ),
        .pb_out(button)
    );
    
endmodule
