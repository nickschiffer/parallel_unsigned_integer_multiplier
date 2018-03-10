`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Nickolas Schiffer
// 
// Create Date: 03/03/2018 04:43:52 PM
// Design Name: 
// Module Name: add_half
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


module add_half(
input a, b,
output reg c_out, 
output sum
 );
 my_xor XOR1 (a, b, sum); 
 always@(*)
 begin
//    sum = a ^ b;
    c_out <= a & b;
 end
endmodule
