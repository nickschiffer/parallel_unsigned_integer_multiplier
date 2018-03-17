`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/16/2018 10:27:58 PM
// Design Name: 
// Module Name: pipeline_IUM_FPGA
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


module pipeline_IUM_FPGA(
input clk100MHz, rst,
input [3:0] A, B,
input button,
output [7:0] LEDSEL, LEDOUT,
output button_indicator,
output [3:0] A_out, B_out
);

supply1 [7:0] vcc;
wire DONT_USE, clk_5KHz;
wire debounced_button;
wire [7:0] P;

wire [7:0] LED0, LED1, LED2; 
wire [3:0] BCD0, BCD1, BCD2;

button_debouncer DBNC (
.clk(clk_5KHz),
.button(button),
.debounced_button(debounced_button)
);

pipeline_unsigned_integer_multiplier UIM (
.clk(debounced_button),
.A(A),
.B(B),
.P(P)
);

P_to_BCD_8bit BCD (.P(P), .BCD0(BCD0), .BCD1(BCD1), .BCD2(BCD2));

bcd_to_7seg BSEG0 (.BCD(BCD0), .s(LED0));
bcd_to_7seg BSEG1 (.BCD(BCD1), .s(LED1));
bcd_to_7seg BSEG2 (.BCD(BCD2), .s(LED2));
 

led_mux LED (clk_5KHz, rst, vcc, vcc, vcc, vcc, vcc, LED2, LED1, LED0, LEDSEL, LEDOUT);
clk_gen      CLK        (clk100MHz, rst, DONT_USE, clk_5KHz);

assign button_indicator = button;
assign A_out = A;
assign B_out = B;

endmodule
