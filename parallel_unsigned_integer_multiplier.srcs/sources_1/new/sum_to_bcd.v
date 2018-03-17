`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/16/2018 10:52:15 PM
// Design Name: 
// Module Name: sum_to_bcd
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


module P_to_BCD_8bit(
input [7:0] P, 
output reg [3:0] BCD0, BCD1, BCD2
);

reg [7:0] PVar;
reg [3:0] B0, B1, B2;
always @ (*)
begin
PVar = P;
B0 = PVar % 8'b0000_1010;
PVar = PVar / 8'b0000_1010;
B1 = PVar % 8'b0000_1010;
PVar = PVar / 8'b0000_1010;
B2 = PVar;
BCD0 = B0;
BCD1 = B1;
BCD2 = B2;
end    
endmodule
