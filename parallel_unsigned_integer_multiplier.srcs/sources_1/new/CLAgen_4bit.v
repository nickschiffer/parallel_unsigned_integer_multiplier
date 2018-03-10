`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/03/2018 05:04:37 PM
// Design Name: 
// Module Name: CLA_4bit
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


module CLAgen_4bit(
input [3:0] G,
input [3:0] P,
input c_in,
output reg [4:1] C
);

//always@(*)
//begin
//        C[1] = G[0] + (P[0] & c_in);
//        C[2] = G[1] + (P[1] & C[1]);
//        C[3] = G[2] + (P[2] & C[2]);
//        C[4] = G[3] + (P[3] & C[3]);
//end
always@(*)
begin
        C[1] <= G[0] | (P[0] & c_in);
        C[2] <= G[1] | (P[1] & (G[0])| (P[1] & P[0] & c_in));
        C[3] <= G[2] | (P[2] & (G[1] | (P[1] & (G[0]) | (P[1] & P[0] & c_in))));
        C[4] <= G[3] | (P[3] & (G[2] | (P[2] & (G[1] | (P[1] & (G[0]) | (P[1] & P[0] & c_in))))));
end
endmodule
