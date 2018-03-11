`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Nickolas Schiffer
// 
// Create Date: 03/10/2018 09:46:23 PM
// Design Name: 
// Module Name: UIM_combinational_tb
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


module UIM_combinational_tb;
parameter A_width = 4, B_width = 4, P_width = 8;

reg  [A_width - 1:0] in_A_tb;            //Input A for inferred mult
reg  [B_width - 1:0] in_B_tb;            //Input B for inferred mult

wire [P_width - 1:0] P_Inferred_tb;      //Output for inferred
                                         //Output for Carry-Out bit for Inferred
wire [P_width - 1:0] P_combinational_tb; //Output for combinational unsigned integer multiplier


unsigned_integer_multiplier_inferred DUTCONTROL (
.A(in_A_tb[A_width-1:0]), 
.B(in_B_tb[B_width-1:0]),  
.P(P_Inferred_tb) 
);

combinational_unsigned_integer_multiplier DUT (
.A(in_A_tb[A_width-1:0]), 
.B(in_B_tb[B_width-1:0]),  
.P(P_combinational_tb) 
);

integer i = 0;
integer j = 0;
integer count = 0;
    initial
    begin
        $display("UIM Combinational Test Begin");
            for(i = 0; i < 16; i = i + 1)   //2^(4) = 16 combinations
            begin
                in_A_tb = i;
                for(j = 0; j < 16; j = j + 1)
                begin
                    count = count + 1;
                    in_B_tb = j; #5
                    
                    //$display("A=%b, B=%b, c_in = %b",in_A_tb[A_width -1:0], in_B_tb[B_width-1:0], in_A_tb[A_width]);
                    //$display("Inferred Sum=%b, Inferred Carry-Out=%b, CLA Sum=%b, CLA Carry-Out=%b\n",SUM_Inferred_tb, c_out_Inferred ,SUM_CLA_tb, c_out_CLA);
                    
                    if ((P_Inferred_tb != P_combinational_tb))
                        begin
                            $display("Error at time=%dns A=%b, B=%b,",$time, in_A_tb[A_width -1:0], in_B_tb[B_width-1:0]);
                            $display("Inferred P=%d",P_Inferred_tb);
                            $display("Combinational P=%d",P_combinational_tb);
                            $stop;
                        end
                end
            end
            $display("Test Successful. %d Trials. Time=%dns.",count, $time);
            $finish;
     end
endmodule
