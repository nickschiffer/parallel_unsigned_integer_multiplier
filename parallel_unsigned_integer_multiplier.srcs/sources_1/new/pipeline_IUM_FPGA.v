`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Nickolas Schiffer
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
//output [3:0] A_out, B_out,
output [7:0] P_out
);

supply1 [7:0] vcc;
wire DONT_USE, clk_5KHz;
wire debounced_button;
wire [7:0] P;

wire [7:0] LED0, LED1, LED2, LED3, LED4, LED5, LED6; 
wire [3:0] BCD0, BCD1, BCD2;

wire [3:0] A_BCD0, A_BCD1;
wire [3:0] B_BCD0, B_BCD1;

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

P_2_BCD BCD (.P(P), .ones(BCD0), .tens(BCD1), .hundreds(BCD2));
P_2_BCD OP1 (.P({4'b0,A}), .ones(A_BCD0), .tens(A_BCD1));
P_2_BCD OP2 (.P({4'b0,B}), .ones(B_BCD0), .tens(B_BCD1));

bcd_to_7seg BSEG0 (.BCD(BCD0), .s(LED0));
bcd_to_7seg BSEG1 (.BCD(BCD1), .s(LED1));
bcd_to_7seg BSEG2 (.BCD(BCD2), .s(LED2));

bcd_to_7seg BSEGA0 (.BCD(A_BCD0), .s(LED5));
bcd_to_7seg BSEGA1 (.BCD(A_BCD1), .s(LED6));
bcd_to_7seg BSEGB0 (.BCD(B_BCD0), .s(LED3));
bcd_to_7seg BSEGB1 (.BCD(B_BCD1), .s(LED4));

 

led_mux LED (clk_5KHz, rst, LED6, LED5, LED4, LED3, vcc, LED2, LED1, LED0, LEDSEL, LEDOUT);
clk_gen      CLK        (clk100MHz, rst, DONT_USE, clk_5KHz);

assign button_indicator = debounced_button;
//assign A_out = A;
//assign B_out = B;
assign P_out = P;

endmodule
