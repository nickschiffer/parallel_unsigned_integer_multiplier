`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/09/2018 04:25:30 PM
// Design Name: 
// Module Name: AND5
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


module AND5(
input [3:0] A,
input b_j,
output reg PP_j
    );
    
always @ (*)
begin
   PP_j <= (&A) & b_j; 
end
endmodule
