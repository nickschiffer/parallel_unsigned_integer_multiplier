`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/10/2018 03:17:52 PM
// Design Name: 
// Module Name: led_mux
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


module led_mux
(input clk, rst, input [7:0] LED7, LED6, LED5, LED4, LED3, LED2, LED1, LED0,
output [7:0] LEDSEL, LEDOUT);
        reg [2:0]   index;
        reg [15:0]  led_ctrl;
        
        assign {LEDSEL, LEDOUT} = led_ctrl;
        
        always @ (posedge clk) index <= (rst) ? 3'b0 : (index + 3'd1);
        
        always @ (index, LED0, LED1, LED2, LED3, LED4, LED5, LED6, LED7)
        begin
                case (index)
                        0:      led_ctrl <= {8'b11111110, LED0};
                        1:      led_ctrl <= {8'b11111101, LED1};
                        2:      led_ctrl <= {8'b11111011, LED2};
                        3:      led_ctrl <= {8'b11110111, LED3};
                        4:      led_ctrl <= {8'b11101111, LED4};
                        5:      led_ctrl <= {8'b11011111, LED5};
                        6:      led_ctrl <= {8'b10111111, LED6};
                        7:      led_ctrl <= {8'b01111111, LED7};
                        default:led_ctrl <= {8'b11111111, 8'hFF};
                endcase
        end
endmodule
