`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Nickolas Schiffer
// 
// Create Date: 03/16/2018 09:06:45 PM
// Design Name: 
// Module Name: UIM_pipeline_tb
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


module UIM_pipeline_tb;
parameter A_width = 4, B_width = 4, P_width = 8;

reg  [A_width - 1:0] in_A_tb;            //Input A for inferred mult
reg  [B_width - 1:0] in_B_tb;            //Input B for inferred mult

wire [P_width - 1:0] P_Inferred_tb;      //Output for inferred
                                         //Output for Carry-Out bit for Inferred
wire [P_width - 1:0] P_Pipeline_tb; //Output for combinational unsigned integer multiplier
reg clk;


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

integer i = 0;
integer j = 0;
integer clk_ = 0;
integer count = 0;
integer clock_counter = 1;
integer result_counter = 0;
reg  ctrl_results [255:0][7:0];
    initial
    begin
        $display("Pipeline UIM Test Begin");
            for(i = 0; i < 16; i = i + 1)   //2^(4) = 16 combinations
            begin
                in_A_tb = i;
                for(j = 0; j < 16; j = j + 1)
                begin
                    in_B_tb = j;                 
                    
                    for(clk_ = 0; clk_ < 4; clk_ = clk_ + 1)
                    begin
                        count = count + 1; #5
                        clock_counter = clock_counter + 1;
                        clk = clk_ % 2;
                        
                        if((clock_counter % 2) == 0)
                        begin
//                            if()
                        end
                        
                        if((clock_counter % 2) == 1)
                        begin
                        
                        end 
                        
                        $display("A=%b=%d",in_A_tb[A_width -1:0],in_A_tb[A_width -1:0]);
                        $display("B=%b=%d",in_B_tb[B_width-1:0],in_B_tb[B_width-1:0]);
                        $display("P = %b = %d", P_Pipeline_tb[P_width - 1:0],P_Pipeline_tb[P_width - 1:0]);
                        $display("clk = %b",clk); 
                        $display("Inferred Sum=%b=%d",P_Inferred_tb[P_width - 1:0],P_Inferred_tb[P_width - 1:0]);
                        
//                        if ((P_Inferred_tb != P_combinational_tb))
//                            begin
//                                $display("Error at time=%dns A=%b, B=%b,",$time, in_A_tb[A_width -1:0], in_B_tb[B_width-1:0]);
//                                $display("Inferred P=%d",P_Inferred_tb);
//                                $display("Combinational P=%d",P_combinational_tb);
//                                $stop;
//                            end
                    end
                end
            end
            $display("Test Successful. %d Trials. Time=%dns.",count, $time);
            $finish;
     end
endmodule
