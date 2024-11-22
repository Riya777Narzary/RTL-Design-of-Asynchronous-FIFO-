`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.07.2024 08:36:24
// Design Name: 
// Module Name: TOP_MODULE
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

module TOP_MODULE
(input [7 : 0] wdata,
input wclk, wrst_n, winc, 
input rclk, rrst_n, rinc,
output [7 : 0]rdata
);




wire [2 : 0] waddr, raddr;
wire [3:0]  wptr, rptr, wq2_rptr, rq2_wptr;
wire wfull, rempty;
//wire master_rrst, master_wrst;

De_assertion_rst master_rrst(rclk, wrst_n, mrrst);
De_assertion_rst master_wrst(wclk, rrst_n, mwrst);

sync_r2w sync_r2w(.wclk(wclk), .wrst_n(mwrst), .rptr(rptr), .wq2_rptr(wq2_rptr));

sync_w2r sync_w2r(.rclk(rclk), .rrst_n(mrrst), .wptr(wptr), .rq2_wptr(rq2_wptr));

rptr_empty rptr_empty(
                      .rinc(rinc), .rclk(rclk), .rrst_n(mrrst), .rq2_wptr(rq2_wptr),
                      .rempty(rempty), .raddr(raddr), .rptr(rptr)
                      );

wptr_full wptr_full(
                    .winc(winc), .wclk(wclk), .wrst_n(mwrst), .wq2_rptr(wq2_rptr), 
                    .wfull(wfull), .waddr(waddr), .wptr(wptr)
                    );

fifomem fifo_mem(
                 .wdata(wdata), .waddr(waddr), .raddr(raddr), .wclk(wclk), .wclken(winc),
                 .wfull(wfull), .rdata(rdata)
                 );


endmodule
