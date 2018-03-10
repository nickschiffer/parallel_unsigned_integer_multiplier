`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/19/2018 08:00:20 PM
// Design Name: 
// Module Name: bit_shifter_rotator
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


module bit_shifter_rotator(ctrl, in, out);
input [2:0] ctrl;
input [7:0] in;
output reg [7:0] out;


always @(*)
begin
//assign tmp = in;
    case(ctrl)
        3'b000: out <= in;
        3'b001: out <= in << 1;
        3'b010: out <= in << 2;
        3'b011: out <= in << 3;
        3'b100: out <= in << 4;
        3'b101: out <= {in[0], in[3:1]};
        3'b110: out <= {in[1:0], in[3:2]};
        3'b111: out <= {in[2:0], in[3]};
     endcase
end
    
endmodule
