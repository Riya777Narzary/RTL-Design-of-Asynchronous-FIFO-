`timescale 1ns/1ps


module wptr_full(
                  input winc, wclk, wrst_n, input[3:0] wq2_rptr,
                  output reg wfull, output [2:0] waddr, output reg [3:0] wptr
                  );
                  
                  reg [3:0] wbin;
                  wire [3:0] wbinnext;
                  wire wfull_val;
                  wire [3:0] wgraynext;
                  
                  always@(posedge wclk) begin
                    if(wrst_n == 0)
                        {wbin, wptr} <= 0;
                    else
                        {wbin, wptr} <= {wbinnext, wgraynext};
                  end
                  
                  assign waddr = wbin[2:0];
                  
                  assign wbinnext = wbin + (winc & ~wfull);
                  assign wgraynext = (wbinnext >> 1) ^ wbinnext;
                  
                  assign wfull_val = ((wgraynext[3] != wq2_rptr[3]) &&
                                      (wgraynext[2] != wq2_rptr[2]) &&
                                      (wgraynext[1:0] == wq2_rptr[1:0]));
                  
                  always@(posedge wclk) begin
                    if(!wrst_n)
                        wfull <= 0;
                    else
                        wfull <= wfull_val;
                  end
                  
                   
endmodule