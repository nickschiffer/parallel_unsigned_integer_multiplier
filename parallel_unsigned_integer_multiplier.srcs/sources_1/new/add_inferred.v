`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/03/2018 04:55:04 PM
// Design Name: 
// Module Name: add_inferred
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


module add_inferred(
input [7:0] A, B,
input c_in,
output reg [7:0] SUM,
output reg c_out
);
always @ (*)
        {c_out,SUM} = {1'b0,A} + {1'b0,B} + {1'b0,c_in};
endmodule
