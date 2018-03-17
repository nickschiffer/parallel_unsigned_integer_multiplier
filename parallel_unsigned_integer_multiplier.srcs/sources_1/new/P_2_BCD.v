`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/17/2018 12:39:03 AM
// Design Name: 
// Module Name: P_2_BCD
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


module P_2_BCD(
input [7:0] P,
output reg [3:0] hundreds, tens, ones
);

integer i;
always @ (P)
begin
    hundreds = 4'd0;
    tens     = 4'd0;
    ones     = 4'd0;
    
    for (i = 7; i >= 0; i= i - 1)
    begin
        if (hundreds >= 5)
            hundreds = hundreds + 3;
        if (tens >= 5)
            tens = tens + 3;
        if (ones >= 5)
            ones = ones + 3;
        
        hundreds = hundreds << 1;
        hundreds[0] = tens[3];
        tens = tens << 1;
        tens[0] = ones[3];
        ones = ones << 1;
        ones[0] = P[i];
    end
end

endmodule
