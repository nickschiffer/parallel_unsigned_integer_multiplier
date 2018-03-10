`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Nickolas Schiffer
// 
// Create Date: 03/09/2018 04:31:36 PM
// Design Name: 
// Module Name: UIM_inferred_tb
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


module UIM_inferred_tb;

parameter A_width = 4, B_width = 4, P_width = 8;

reg  [A_width - 1:0] in_A_tb;           //Input A for inferred mult
reg  [B_width - 1:0] in_B_tb;           //Input B for inferred mult

wire [P_width - 1:0] P_Inferred_tb;     //Output for inferred
                                        //Output for Carry-Out bit for Inferred

unsigned_integer_multiplier_inferred DUT (
.A(in_A_tb[A_width-1:0]), 
.B(in_B_tb[B_width-1:0]),  
.P(P_Inferred_tb) 
);

integer i = 0;
integer j = 0;
integer count = 0;
    initial
    begin
        $display("Inferred Test Begin");
            for(i = 0; i < 16; i = i + 1)   //2^(4) = 16 combinations
            begin
                in_A_tb = i;
                for(j = 0; j < 16; j = j + 1)
                begin
                    count = count + 1;
                    in_B_tb = j; #5
                    
                    //$display("A=%b, B=%b, c_in = %b",in_A_tb[A_width -1:0], in_B_tb[B_width-1:0], in_A_tb[A_width]);
                    //$display("Inferred Sum=%b, Inferred Carry-Out=%b, CLA Sum=%b, CLA Carry-Out=%b\n",SUM_Inferred_tb, c_out_Inferred ,SUM_CLA_tb, c_out_CLA);
                    
                    if ((P_Inferred_tb != (in_A_tb * in_B_tb)))
                        begin
                            $display("Error at time=%dns A=%b, B=%b, c_in = %b",$time, in_A_tb[A_width -1:0], in_B_tb[B_width-1:0], in_A_tb[A_width]);
                            $display("Inferred P=%d",P_Inferred_tb);
                            $stop;
                        end
                end
            end
            $display("Test Successful. %d Trials. Time=%dns.",count, $time);
            $finish;
     end
endmodule
