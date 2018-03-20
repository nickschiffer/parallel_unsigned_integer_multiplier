`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Nickolas Schiffer
// 
// Create Date: 03/19/2018 05:46:14 PM
// Design Name: 
// Module Name: UIM_pipeline_self_check_tb
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


module UIM_pipeline_self_check_tb;
parameter A_width = 4, B_width = 4, P_width = 8;

reg  [A_width - 1:0] in_A_tb;            //Input A for inferred mult
reg  [B_width - 1:0] in_B_tb;            //Input B for inferred mult

wire [P_width - 1:0] P_Inferred_tb;      //Output for inferred
                                         //Output for Carry-Out bit for Inferred
wire [P_width - 1:0] P_Pipeline_tb; //Output for combinational unsigned integer multiplier

reg clk = 0;

reg [7:0] clk1, clk2, clk3;

integer i = 0;
integer j = 0;
integer count = 0;

unsigned_integer_multiplier_inferred DUTCONTROL (
.A(in_A_tb[A_width-1:0]), 
.B(in_B_tb[B_width-1:0]),  
.P(P_Inferred_tb) 
);

pipeline_unsigned_integer_multiplier DUT (
.A(in_A_tb[A_width-1:0]), 
.B(in_B_tb[B_width-1:0]),
.clk(clk),  
.P(P_Pipeline_tb) 
);




task cycle;
    input myClk;
    begin
        clk <= 1;
        #1;
        clk <= 0;
    end
endtask


    initial
    begin
    
    clk1 = 0;
    clk2 = 0;
    clk3 = 0;
        $display("Pipeline UIM Self Test Begin");
            for(i = 0; i < 16; i = i + 1)   //2^(4) = 16 combinations
            begin
                in_A_tb = i;
                for(j = 0; j < 16; j = j + 1)
                begin
                    in_B_tb = j; #5
                        count = count + 1;
                        clk3 <= clk2;
                        clk2 <= clk1;
                        clk1 <= P_Inferred_tb;
                        cycle(1);
                        if ((P_Pipeline_tb != clk3))
                        begin
                            $display("Error");
                            $display("A=%b=%d",in_A_tb[A_width -1:0],in_A_tb[A_width -1:0]);
                            $display("B=%b=%d",in_B_tb[B_width-1:0],in_B_tb[B_width-1:0]);
                            $display("P = %b = %d", P_Pipeline_tb[P_width - 1:0],P_Pipeline_tb[P_width - 1:0]);
                            $display("clk = %b",clk); 
                            $display("Inferred Product=%b=%d",P_Inferred_tb[P_width - 1:0],P_Inferred_tb[P_width - 1:0]);
                            $stop;
                        end
                    
                end
            end
            $display("Test Successful. %d Trials. Time=%dns.",count, $time);
            $finish;
     end
endmodule
