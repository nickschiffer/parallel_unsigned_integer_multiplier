`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/09/2018 05:07:55 PM
// Design Name: 
// Module Name: combinational_unsigned_integer_multiplier
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


module combinational_unsigned_integer_multiplier(
input  [3:0] A,
input  [3:0] B,
output reg [7:0] P,
output overflow
);

wire [7:0] pp_from_AND0;
wire [7:0] pp_from_AND1;
wire [7:0] pp_from_AND2;
wire [7:0] pp_from_AND3;

wire [7:0] PP0;
wire [7:0] PP1;
wire [7:0] PP2;
wire [7:0] PP3;

wire [7:0] PP0_plus_PP1;
wire [7:0] PP2_plus_PP3;

wire carry_from_PP0_plus_PP1;
wire carry_from_PP2_plus_PP3;



AND5 AND0 (A, B[0], pp_from_AND0);
AND5 AND1 (A, B[1], pp_from_AND1);
AND5 AND2 (A, B[2], pp_from_AND2);
AND5 AND3 (A, B[3], pp_from_AND3);

bit_shifter_rotator SHIFT0 (2'b00, pp_from_AND0, PP0); //Shift Result by 0
bit_shifter_rotator SHIFT1 (2'b01, pp_from_AND1, PP1); //Shift Result by 1
bit_shifter_rotator SHIFT2 (2'b10, pp_from_AND2, PP2); //Shift Result by 2
bit_shifter_rotator SHIFT3 (2'b11, pp_from_AND3, PP3); //Shift Result by 3

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
    .A(PP0_plus_PP1), 
    .B(PP2_plus_PP3), 
    .c_in(carry_from_PP0_plus_PP1), 
    .SUM(P), 
    .c_out(overflow));





endmodule
