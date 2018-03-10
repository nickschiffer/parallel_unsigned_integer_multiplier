`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Nickolas Schiffer
// 
// Create Date: 03/03/2018 10:15:15 PM
// Design Name: 
// Module Name: my_xo
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


module my_xor(
input a, b,
output reg y
);

always@(*)
    y <= (a & ~b) | (~a & b);
endmodule
