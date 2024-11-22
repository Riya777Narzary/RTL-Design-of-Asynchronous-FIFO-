`timescale 1ns / 1ps



module testbench_fifo();
    reg [7 : 0] wdata;
    reg wclk, wrst_n, winc;
    reg rclk, rrst_n, rinc;
    wire [7 : 0]rdata;

    
    TOP_MODULE dut(.wdata(wdata), .wclk(wclk), .wrst_n(wrst_n), .winc(winc), .rclk(rclk),
                   .rrst_n(rrst_n), .rinc(rinc), .rdata(rdata)
               );
    
    always #40 rclk = ~ rclk;
    
    always #10 wclk = ~wclk;
    
    
    initial begin
    wdata = 8'b0;
    #31
    wdata = 8'h00;
    #20
    wdata = 8'h85;
    #20
    wdata = 8'h77;
    #20
    wdata = 8'h10;
    #20
    wdata = 8'h90;
    #20
    wdata = 8'ha0;
    #20
    wdata = 8'h99;
    #20
    wdata = 8'h73;
    #20
    wdata = 8'hcd;
    #20
    wdata = 8'hed;
    #20
    wdata = 8'hfd;
    #20
    wdata = 8'h2d;
    #20
    wdata = 8'h1d;
    #20
    wdata = 8'h3d;
    #50
    wdata = 8'h55;
    #20
    wdata = 8'h44;
    #20
    wdata = 8'h32;
    #20
    wdata = 8'h25;
    #20
    wdata = 8'h76;
    #20
    wdata = 8'h22;
    #20
    wdata = 8'h56;
    #20
    wdata = 8'hff;
    end
    
    
    initial begin
        rclk = 0;
        wclk = 0;
        wrst_n = 1'b0;
        rrst_n = 1'b0;
        rinc = 1'b0;
        winc = 1'b0;
        
        #30
        wrst_n = 1'b1;
        rrst_n = 1'b1;
        #40
         // Start sending data to fifomem.
        winc = 1'b1;
        rinc = 1'b0;
        
        #100
        
        winc = 1'b0;
        rinc = 1'b1; //Burst length given is 5
        #60
        
        winc = 1'b1;
        rinc = 1'b1;
        #100
        $finish
//        wrst_n = 1'b0;
//        rrst_n = 1'b0;
//        #2
//        wrst_n = 1'b1;
//        rrst_n = 1'b1;
//        #20
        
//        winc = 1'b1;
//        rinc = 1'b1;  
//        #10
//        winc = 1'b1;
//        rinc = 1'b1;
//        #10
//        winc = 1'b1;
//        rinc = 1'b1;
//        #10 
//        winc = 1'b1;
//        rinc = 1'b1;
//        #10
//        winc = 1'b1;
//        rinc = 1'b1;
        
        
//        #10
//        wdata = 8'h4d;   // full condition.
//        winc = 1'b1;
//        rinc = 1'b1;
//        #10
////        wdata = 8'h5d;
//        winc = 1'b1;
//        rinc = 1'b1;
//        #10
////        wdata = 8'h6d;
//        winc = 1'b1;
//        rinc = 1'b1;
//        #10
////        wdata = 8'h7d;
//        winc = 1'b1;
//        rinc = 1'b1;
//        #10
////        wdata = 8'h8d;
//        winc = 1'b1;
//        rinc = 1'b1;
//        #10
////        wdata = 8'h9d;
//        winc = 1'b1;
//        rinc = 1'b1;
//        #10
////        wdata = 8'had;
//        winc = 1'b1;
//        rinc = 1'b1;
//        #10
//        winc = 1'b1;
//        rinc = 1'b1;
//        #10
//        winc = 1'b1;
//        rinc = 1'b1;
//        #10
//        winc = 1'b0;
//        rinc = 1'b1;
//        #100  // full after empty
//        winc = 1'b1;
//        rinc = 1'b0;
        
    end
    
    
    
    
    
endmodule
