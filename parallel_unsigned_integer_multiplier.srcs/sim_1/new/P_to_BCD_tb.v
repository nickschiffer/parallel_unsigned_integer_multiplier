`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Nickolas Schiffer
// 
// Create Date: 03/16/2018 11:45:08 PM
// Design Name: 
// Module Name: P_to_BCD_tb
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


module P_to_BCD_tb;

reg  [7:0] in_P_tb;                     
wire  [3:0] BCD0_tb;                    
wire  [3:0] BCD1_tb;
wire  [3:0] BCD2_tb;

P_2_BCD DUT (.P(in_P_tb[7:0]), .ones(BCD0_tb[3:0]),.tens(BCD1_tb[3:0]),.hundreds(BCD2_tb[3:0]));

integer i = 0;
initial
    begin
        for (i = 0; i < 256; i = i + 1)
        begin
        in_P_tb = i;
        $display("P = %b = %d",in_P_tb[7:0],in_P_tb[7:0]);
        $display("BCD0 = %b = %d",BCD0_tb[3:0],BCD0_tb[3:0]);
        $display("BCD1 = %b = %d",BCD1_tb[3:0],BCD1_tb[3:0]);
        $display("BCD2 = %b = %d\n\n",BCD2_tb[3:0],BCD2_tb[3:0]);
        end
        $finish;
end

endmodule
