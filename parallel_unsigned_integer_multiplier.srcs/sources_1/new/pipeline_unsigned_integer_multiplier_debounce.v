`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Nickolas Schiffer
// 
// Create Date: 03/16/2018 08:44:07 PM
// Design Name: 
// Module Name: pipeline_unsigned_integer_multiplier_debounce
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


module pipeline_unsigned_integer_multiplier_debounce(

input clk, button,
input  [3:0] A,
input  [3:0] B,
output [7:0] P, //Product
output reg overflow

);

wire debounced_button;

wire [4:0] B_from_IN_REG;
wire [4:0] A_from_IN_REG;
wire [7:0] P_from_OUT_REG;



wire [7:0] PP0_plus_PP1_AFTER_REG;
wire [7:0] PP2_plus_PP3_AFTER_REG;

wire [7:0] PP_from_AND0;
wire [7:0] PP_from_AND1;
wire [7:0] PP_from_AND2;
wire [7:0] PP_from_AND3;

wire [7:0] PP0;
wire [7:0] PP1;
wire [7:0] PP2;
wire [7:0] PP3;

wire [7:0] PP0_plus_PP1;
wire [7:0] PP2_plus_PP3;
wire [7:0] P_final;
wire overflow_final;

wire carry_from_PP0_plus_PP1;
wire carry_from_PP2_plus_PP3;

button_debouncer DBNC (
.clk(clk),
.button(button),
.debounced_button(debounced_button)
);

flopenr #(4) B_IN_REG (
.clk(debounced_button),
.en(1'b1),
.d(B),
.q(B_from_IN_REG));

flopenr #(4) A_IN_REG (
.clk(debounced_button),
.en(1'b1),
.d(A),
.q(A_from_IN_REG));

flopenr #(8) P_OUT_REG (
.clk(debounced_button),
.en(1'b1),
.d(P_final),
.q(P_from_OUT_REG));

flopenr #(8) STAGE_PP2_PLUS_PP3_REG (
.clk(debounced_button),
.en(1'b1),
.d(PP2_plus_PP3),
.q(PP2_plus_PP3_AFTER_REG));

flopenr #(8) STAGE_PP0_PLUS_PP1_REG (
.clk(debounced_button),
.en(1'b1),
.d(PP0_plus_PP1),
.q(PP0_plus_PP1_AFTER_REG));

AND5 AND0 (A_from_IN_REG, B_from_IN_REG[0], PP_from_AND0); //Pre-shifted PP0
AND5 AND1 (A_from_IN_REG, B_from_IN_REG[1], PP_from_AND1); //Pre-shifted PP1
AND5 AND2 (A_from_IN_REG, B_from_IN_REG[2], PP_from_AND2); //Pre-shifted PP2
AND5 AND3 (A_from_IN_REG, B_from_IN_REG[3], PP_from_AND3); //Pre-shifted PP3

bit_shifter_rotator SHIFT0 (2'b000, PP_from_AND0, PP0); //Shift Result by 0
bit_shifter_rotator SHIFT1 (2'b001, PP_from_AND1, PP1); //Shift Result by 1
bit_shifter_rotator SHIFT2 (2'b010, PP_from_AND2, PP2); //Shift Result by 2
bit_shifter_rotator SHIFT3 (2'b011, PP_from_AND3, PP3); //Shift Result by 3

CLA_adder_8bit ADD_PP0_PP1 (
    .A(PP0), 
    .B(PP1), 
    .c_in(1'b0), 
    .SUM(PP0_plus_PP1), 
    .c_out(carry_from_PP0_plus_PP1));

CLA_adder_8bit ADD_PP2_PP3 (
    .A(PP2), 
    .B(PP3), 
    .c_in(carry_from_PP0_plus_PP1), 
    .SUM(PP2_plus_PP3), 
    .c_out(carry_from_PP2_plus_PP3));
    
CLA_adder_8bit ADD_TOTAL (
    .A(PP0_plus_PP1_AFTER_REG), 
    .B(PP2_plus_PP3_AFTER_REG), 
    .c_in(1'b0), 
    .SUM(P_from_OUT_REG), 
    .c_out(overflow_final));

//always @ (*)
//begin
//P <= P_final;
//overflow <= overflow_final;
//end

assign P = P_from_OUT_REG;




endmodule
