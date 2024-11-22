`timescale 1ns/1ps


module rptr_empty(input rinc, rclk, rrst_n, input[3:0] rq2_wptr,
                  output reg rempty, output [2:0] raddr, output reg [3:0] rptr
                  );
                  
                  reg [3:0] rbin;
                  wire [3:0]rbinnext;
                  wire rempty_val;
                  wire [3:0]rgraynext;
                  
                  always@(posedge rclk) begin
                    if(!rrst_n)
                        {rbin, rptr} <= 0;
                    else
                        {rbin, rptr} <= {rbinnext, rgraynext};
                  end
                  
                  assign raddr = rbin[2:0];
                  
                  assign rbinnext = rbin + (rinc & ~rempty);
                  assign rgraynext = (rbinnext >> 1) ^ rbinnext;
                  
                  assign rempty_val = (rgraynext == rq2_wptr);
                  
                  always@(posedge rclk) begin
                    if(!rrst_n)
                        rempty <= 1'b0;
                    else
                        rempty <= rempty_val;
                  end
                  
                   
endmodule