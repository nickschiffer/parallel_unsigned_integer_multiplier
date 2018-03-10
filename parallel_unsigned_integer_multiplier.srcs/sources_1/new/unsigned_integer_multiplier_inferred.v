`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/09/2018 04:29:45 PM
// Design Name: 
// Module Name: unsigned_integer_multiplier_inferred
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


module unsigned_integer_multiplier_inferred(
input [3:0] A,
input [3:0] B,
output reg [7:0] P
    );
always @ (*)
    P <= A * B;
endmodule
