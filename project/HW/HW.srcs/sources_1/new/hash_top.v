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
        input UART_TXD_IN,
        output [11:0] LED,
        output UART_RXD_OUT
    );
    
    wire [7:0] tx_data;
    wire rx_done, tx_done, tx_en;
    wire [7:0] rx_data;
    wire [3:0] tx_led;
    wire [3:0] rx_led;
    wire [3:0] dummy_led;
    
    assign LED[11:8] = tx_led;
    assign LED[3:0] = rx_led;
    assign LED[7:4] = dummy_led;
    
    uart_tx #(.CLKS_PER_BIT(25)) tx_inst(
        .i_Clock(CLK100MHZ),
        .i_Tx_DV(tx_en),
        .i_Tx_Byte(tx_data),
        .o_Tx_Active(),
        .o_Tx_Serial(UART_RXD_OUT),
        .o_Tx_Done(tx_done),
        .o_led(tx_led)
    );
    
    uart_rx #(.CLKS_PER_BIT(25)) rx_inst(
        .i_Clock(CLK100MHZ),
        .i_Rx_Serial(UART_TXD_IN),
        .o_Rx_DV(rx_done),
        .o_Rx_Byte(rx_data),
        .o_led(rx_led)
    );
    
    dummy dum_inst(
        .clk(CLK100MHZ),
        .rx_done(rx_done),
        .tx_done(tx_done),
        .din(rx_data),
        .dout(tx_data),
        .tx_en(tx_en),
        .o_led(dummy_led)
    );
    
//    debounce db(
//        .pb_in(BTNC),
//        .clk(CLK100MHZ),
//        .pb_out(button)
//    );
    
endmodule
