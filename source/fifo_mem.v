`timescale 1ns/1ps


module fifomem(wdata, waddr, raddr, wclk, wclken, wfull, rdata);
    parameter DATASIZE = 8;
    parameter ADDRSIZE = 3;
    
    input [DATASIZE - 1:0] wdata;
    input [ADDRSIZE - 1:0] waddr, raddr;
    input wclk,  wclken, wfull;
    output [DATASIZE - 1:0] rdata;
    
    
    localparam DEPTH = 8;
    //memory
    reg [DATASIZE - 1 : 0] mem [0 : DEPTH -1]; 
    
    
    
    assign rdata = mem[raddr];
    
    always@(posedge wclk) begin
        if(wclken && !wfull)
            mem[waddr] <= wdata;
        else
            mem[waddr] <= 8'b0;
    end
    
//    initial 
//    begin
//        mem[0] = 8'hf2;
//        mem[1] = 8'hfa;
//        mem[2] = 8'he2;
//        mem[3] = 8'h32;
//        mem[4] = 8'hb6;
//        mem[5] = 8'h12;
//        mem[6] = 8'hdf;
//        mem[7] = 8'h65;
        
//    end


endmodule