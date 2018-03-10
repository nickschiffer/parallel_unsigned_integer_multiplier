`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Nickolas Schiffer
// 
// Create Date: 03/09/2018 05:29:25 PM
// Design Name: 
// Module Name: CLA_adder_8bit
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


module CLA_adder_8bit(
input [7:0] A,
input [7:0] B,
input c_in,
output reg [7:0] SUM,
output reg c_out
);

wire c_out_from_ADD1;

CLA_adder_4bit ADD1 (
.A(A[3:0]),
.B(B[3:0]),
.c_in(c_in),
.c_out(c_out_from_ADD1),
.SUM(SUM[3:0])
);

CLA_adder_4bit ADD2 (
.A(A[7:4]),
.B(B[7:4]),
.c_in(c_out_from_ADD1),
.c_out(c_out),
.SUM(SUM[7:4])
);


endmodule
