`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Nickolas Schiffer
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
output reg [7:0] PP_j
);


    
always @ (*)
begin
   PP_j <= {A[3] & b_j, A[2] & b_j, A[1] & b_j, A[0] & b_j};
end
endmodule
