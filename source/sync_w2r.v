`timescale 1ns/1ps


module sync_w2r(input rclk, rrst_n, input [3:0] wptr,
                output reg [3:0] rq2_wptr );
                
                reg [3:0] Q0;
                
                always@(posedge rclk or negedge rrst_n) begin
                    if(~rrst_n) begin
                        Q0 <= 4'b0;
                        rq2_wptr <= 4'b0;
                        end
                    else
                        begin
                            Q0 <= wptr;
                            rq2_wptr <= Q0; 
                        end
                end
                
                
endmodule