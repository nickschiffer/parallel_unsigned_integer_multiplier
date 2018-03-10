`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Nickolas Schiffer
// 
// Create Date: 03/03/2018 05:18:55 PM
// Design Name: 
// Module Name: CLA_top
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


module CLA_adder_4bit(
input [3:0] A,
input [3:0] B,
input c_in,
output [3:0] SUM,
output reg c_out
);

wire [3:0] p_from_ha;
wire [3:0] g_from_ha;
wire [4:1] c_from_CLA;


add_half HA0 (A[0], B[0], g_from_ha[0], p_from_ha[0]);
add_half HA1 (A[1], B[1], g_from_ha[1], p_from_ha[1]);
add_half HA2 (A[2], B[2], g_from_ha[2], p_from_ha[2]);
add_half HA3 (A[3], B[3], g_from_ha[3], p_from_ha[3]);

my_xor X0 (p_from_ha[0], c_in, SUM[0]);
my_xor X1 (p_from_ha[1], c_from_CLA[1], SUM[1]);
my_xor X2 (p_from_ha[2], c_from_CLA[2], SUM[2]);
my_xor X3 (p_from_ha[3], c_from_CLA[3], SUM[3]);


CLAgen_4bit CLAGEN (g_from_ha, p_from_ha, c_in, c_from_CLA);

always@(*)
begin
//SUM[0] = p_from_ha[0] ^ c_in;
//SUM[1] = p_from_ha[1] ^ c_from_CLA[1];
//SUM[2] = p_from_ha[2] ^ c_from_CLA[2];
//SUM[3] = p_from_ha[3] ^ c_from_CLA[3];
c_out = c_from_CLA[4];
end

//assign SUM[0] = p_from_ha[0] ^ c_in;
//assign SUM[1] = p_from_ha[1] ^ c_from_CLA[1];
//assign SUM[2] = p_from_ha[2] ^ c_from_CLA[2];
//assign SUM[3] = p_from_ha[3] ^ c_from_CLA[3];
//assign c_out = c_from_CLA[4];



endmodule
