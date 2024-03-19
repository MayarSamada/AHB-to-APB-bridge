`timescale 1ns/1ps
module fsm_tb();
reg Hclk, Hrstn, Hwrite, Hsel_APB;
reg [31:0] Haddr, Hwdata, Prdata;
reg [1:0] Htrans;
wire Hready_out,Penable,Pselx,Pwrite;
wire [31:0] Hrdata, Pwdata, Paddr;
wire [1:0]Hresp;

initial begin
Hclk = 1'b1;
end
always #1 Hclk = (Hclk !== 1 ? 1:0);

fsm a1 (.Hclk(Hclk), .Hrstn(Hrstn), .Hwrite(Hwrite), .Hsel_APB(Hsel_APB), 
               .Haddr(Haddr), .Hwdata(Hwdata), .Prdata(Prdata), .Htrans(Htrans), .Hready_out(Hready_out),
               .Penable(Penable), .Pselx(Pselx), .Pwrite(Pwrite), .Hrdata(Hrdata), .Pwdata(Pwdata),
               .Paddr(Paddr), .Hresp(Hresp));

initial begin
// single read transfer
 Hrstn =1'b0;

 #2 Hrstn =1'b1;
 Hwrite =1'b0;
 Hsel_APB =1'b1;
 Htrans =2'b10;
 Haddr =32;

 #2.1 Hwrite =1'bx;
 Hsel_APB =1'b0;
 Htrans =2'bxx;
 Haddr = 32'hxxxx_xxxx;

 #1.9 Prdata=16;

// single write transfer
 #2 
 Hwrite =1'b1;
 Hsel_APB =1'b1;
 Haddr =32'h0000_0000;

 #2 Hwdata =32'h0000_00ff;
 Hsel_APB =1'b0;

 #0.1 Hwrite =1'bx;
 Htrans =2'bxx;
 Haddr =32'hxxxx_xxxx;

// burst read transfer
 #2 //IDLE State
 Hwrite =1'b0;
 Hsel_APB =1'b1;
 Htrans =2'b10;
 Haddr =32'h0000_0000;

#2.1 //READ State
 Htrans =2'b11;
 Haddr =32'h0000_0100;

 #1.9 //RENABLE State
 Prdata =32'hFFFF_FFFF;

 #2.1
 Haddr =32'h0000_1000;

 #1.9
 Prdata =32'hFFFF_FFFB;

 #2.1
 Haddr =32'h0000_1100;

 #1.9
 Prdata =32'hFFFF_FFF8;

 #2.1
 Hwrite= 1'bx;
 Haddr= 32'hxxxx_xxxx;
 Htrans= 2'bxx;
 Hsel_APB= 1'bx;

 #1.9
 Prdata=32'hFFFF_FFF4;

// burst write transfer

#2 //IDLE State
 Hwrite =1'b1;
 Hsel_APB =1'b1;
 Htrans =2'b10;
 Haddr =32'h0000_0000;

#2.1 //WWAIT State
 Hwdata =32'h0000_000F;
 Haddr =32'h0000_0100;
 Htrans =2'b11;

 #2 //WRITEP State
 Hwdata =32'h0000_00F0;
 Haddr =32'h0000_1000;

 #4 //WENABLE State
 Hwdata =32'h0000_0F00;
 Haddr =32'h0000_1100;

 #4
 Hwdata =32'h0000_F000;
 Haddr =32'hxxxx_xxxx;
 Hwrite =1'bx;
 Hsel_APB =1'bx;
 Htrans =2'bxx;

 #4
 Hwdata =32'hxxxx_xxxx; 
 #6 $finish;
end

endmodule