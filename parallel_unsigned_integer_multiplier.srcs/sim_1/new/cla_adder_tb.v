`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Nickolas Schiffer
// 
// Create Date: 03/03/2018 06:50:37 PM
// Design Name: 
// Module Name: cla_adder_tb
// Project Name: 
// Target Devices: Digilent Nexys 4 DDR
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


module cla_adder_tb;

parameter A_width = 8, B_width = 8, S_width = 8;

reg  [A_width:0]     in_A_tb;           //Input A for both adders, MSB is the carry-in bit
reg  [B_width - 1:0] in_B_tb;           //Input B for both adders


wire [S_width - 1:0] SUM_Inferred_tb;   //Output for inferred
wire [S_width - 1:0] SUM_CLA_tb;        //Output for CLA

wire c_out_Inferred;                    //Output for Carry-Out bit for Inferred
wire c_out_CLA;                         //Output for Carry-Out bit for CLA

add_inferred DUTCONTROL (.A(in_A_tb[A_width-1:0]), .B(in_B_tb[B_width-1:0]), .c_in(in_A_tb[A_width]), .SUM(SUM_Inferred_tb), .c_out(c_out_Inferred));
CLA_adder_8bit DUT      (.A(in_A_tb[A_width-1:0]), .B(in_B_tb[B_width-1:0]), .c_in(in_A_tb[A_width]), .SUM(SUM_CLA_tb), .c_out(c_out_CLA));

integer i = 0;
integer j = 0;
integer count = 0;
    initial
    begin
        $display("CLA Test Begin");
            for(i = 0; i < 512; i = i + 1)   //2^(9) = 512 combinations
            begin
                in_A_tb = i;
                for(j = 0; j < 256; j = j + 1)
                begin
                    in_B_tb = j; #5
                    
                    //$display("A=%b, B=%b, c_in = %b",in_A_tb[A_width -1:0], in_B_tb[B_width-1:0], in_A_tb[A_width]);
                    //$display("Inferred Sum=%b, Inferred Carry-Out=%b, CLA Sum=%b, CLA Carry-Out=%b\n",SUM_Inferred_tb, c_out_Inferred ,SUM_CLA_tb, c_out_CLA);
                    count = count + 1;
                    if (SUM_Inferred_tb != SUM_CLA_tb)
                        begin
                            $display("Error at time=%dns A=%b, B=%b, c_in = %b\n",$time, in_A_tb[A_width -1:0], in_B_tb[B_width-1:0], in_A_tb[A_width]);
                            $display("Inferred Sum=%b, Inferred Carry-Out=%b, CLA Sum=%b, CLA Carry-Out=%b\n",SUM_Inferred_tb, c_out_Inferred ,SUM_CLA_tb, c_out_CLA);
                            $stop;
                        end
                    if (c_out_Inferred != c_out_CLA)
                        begin
                            $display("Carry Error at time=%dns A=%b, B=%b, c_in = %b\n",$time, in_A_tb[A_width -1:0], in_B_tb[B_width-1:0], in_A_tb[A_width]);
                            $display("Inferred Sum=%b, Inferred Carry-Out=%b, CLA Sum=%b, CLA Carry-Out=%b\n",SUM_Inferred_tb, c_out_Inferred ,SUM_CLA_tb, c_out_CLA);
                            $stop;
                        end
                end
            end
            $display("Test Successful. %d trials, Time=%dns.",count, $time);
            $finish;
     end
                    
                      

endmodule