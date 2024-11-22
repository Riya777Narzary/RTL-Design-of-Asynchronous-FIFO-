`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.09.2024 12:26:04
// Design Name: 
// Module Name: De_assertion_rst
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


module De_assertion_rst(
                        input clk, rst,
                        output reg master_rst 
);

reg q1;

always@(posedge clk, negedge rst) begin
    if(!rst) begin
        master_rst <= 1'b0;
        q1 <= 1'b0; end
    else begin
        q1 <= 1'b1;
        master_rst <= q1;
        end
        
end

endmodule
