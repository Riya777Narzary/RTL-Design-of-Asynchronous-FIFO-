`timescale 1ns/1ps


module sync_r2w(input wclk, wrst_n, input [3:0] rptr,
                output reg [3:0] wq2_rptr );
                
                reg [3:0] Q0;
                
                always@(posedge wclk or negedge wrst_n) begin
                    if(~wrst_n) begin
                        Q0 <= 4'b0;
                        wq2_rptr <= 4'b0;
                        end
                    else
                        begin
                            Q0 <= rptr;
                            wq2_rptr <= Q0; 
                        end
                end
                
                
endmodule