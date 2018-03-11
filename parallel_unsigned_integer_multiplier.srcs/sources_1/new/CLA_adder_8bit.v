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

wire c_out_from_ADD0;
wire c_out_from_ADD1;
wire [7:0] FINAL_SUM;
wire [3:0] sum1;
wire [3:0] sum2;
wire c_in_from_outside;
wire [8:0] in_A;
wire [8:0] in_B;

assign c_in_from_outside = c_in;
assign in_A = A;
assign in_B = B;


CLA_adder_4bit ADD0 (
.A(in_A[3:0]),
.B(in_B[3:0]),
.c_in(c_in_from_outside),
.c_out(c_out_from_ADD0),
.SUM(sum1)
);

CLA_adder_4bit ADD1 (
.A(in_A[7:4]),
.B(in_B[7:4]),
.c_in(c_out_from_ADD0),
.c_out(c_out_from_ADD1),
.SUM(sum2)
);



always @ (*)
begin
    SUM <= {sum2,sum1};
    c_out <= c_out_from_ADD1;
end


endmodule
