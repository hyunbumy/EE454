`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/02/2018 10:53:12 AM
// Design Name: 
// Module Name: dummy
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


module dummy(
    input clk,
    input rx_done,
    input tx_done,
    input [7:0] din,
    output reg [7:0] dout,
    output reg tx_en,
    output [3:0] o_led
    );
    
    parameter s_IDLE         = 3'b000;
    parameter s_GET_BITS     = 3'b001;
    parameter s_SEND_BITS    = 3'b010;
    parameter s_DONE         = 3'b011;
    parameter s_WAIT_DONE    = 3'b100;
    
    reg [2:0] state = 0;
    reg [7:0] data[199:0];
    reg [7:0] i;
    
    always @(posedge clk)
    begin
        case (state)
            s_IDLE:
            begin
                if (rx_done & din == 0)
                begin
                    state <= s_GET_BITS;
                end
                
                tx_en <= 0;
                i <= 0;
            end
            
            s_GET_BITS:
            begin
                if (i == 199 & rx_done)
                begin
                    state <= s_SEND_BITS;
                end
                
                if (i < 200 & rx_done)
                begin
                    i <= i+1;
                    data[i] <= din;
                    if (i == 199)
                    begin
                        i <= 0;
                    end
                end
            end
            
            s_SEND_BITS:
            begin
                state <= s_WAIT_DONE;
                
                dout <= data[199-31+i];
                tx_en <= 1;
//                if (i < 32 & tx_done)
//                begin
//                    i <= i+1;
//                    tx_en <= 1;
//                end
            end
            
            s_WAIT_DONE:
            begin
                if (i == 31 & tx_done)
                begin
                    state <= s_DONE;
                end
                
                else if (tx_done)
                begin
                    state <= s_SEND_BITS;
                    i <= i+1;
                end
                
                tx_en <= 0;
            end
            
            s_DONE:
            begin
                tx_en <= 0;
                state <= s_IDLE;
            end
        
        endcase
    end
        
    assign o_led[0] = state == s_IDLE;
    assign o_led[1] = state == s_GET_BITS;
    assign o_led[2] = state == s_SEND_BITS;
    assign o_led[3] = state == s_DONE;
    
endmodule
