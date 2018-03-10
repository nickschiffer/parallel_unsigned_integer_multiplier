`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Nickolas Schiffer
// 
// Create Date: 03/09/2018 03:55:17 PM
// Design Name: 
// Module Name: flopr
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Parameterized D Register
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module flopenr #(parameter WIDTH = 8)
(
input clk, reset,
input en,
input      [WIDTH - 1:0] d,
output reg [WIDTH - 1:0] q
);

//asynchronous, active HIGH reset with enable input
    always @ (posedge clk, posedge reset)
    begin
        if (reset)
            q <= 0;
        else if (en)
            q <= d;
        else
            q <= q;
    end
endmodule
