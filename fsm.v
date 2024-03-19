`timescale 1ns/1ps
module fsm(
 input Hclk ,Hrstn ,Hwrite ,Hsel_APB,test_si,test_se,
 input [31:0]Haddr,Hwdata,Prdata, 
 input [1:0]Htrans,
 output reg Hready_out,Penable,Pselx,Pwrite,test_so,
 output reg [31:0]Hrdata,Pwdata,Paddr,
 output reg [1:0]Hresp
);

reg Valid;
reg tmp_Hwrite;
reg [31:0] tmp_Haddr;
reg [2:0] current_state, next_state;

// valid signal creation
always@(*) begin
Valid = 1'b0;
case ({Htrans,Hsel_APB}) 
3'b101 : Valid = 1'b1; //sequential transfer APB
3'b111 : Valid = 1'b1; //non_sequential transfer AHB
default: Valid = 1'b0;
endcase
end

//state encoding
parameter idle=3'b000, read=3'b001, read_enable=3'b010, write_wait=3'b011,
write=3'b100, writep=3'b101, write_enable=3'b110, write_enablep=3'b111;

//next_state sequential logic
always@(posedge Hclk or negedge Hrstn)
begin
 if(!Hrstn)
   current_state <= idle;
 else
   current_state <= next_state;
end

//next_state combinational logic 
always@(*)
begin
 next_state = current_state;
 case(current_state)
   idle:begin 
          if(Valid == 1 && Hwrite ==1)
            next_state =  write_wait;
          else if(Valid == 1 && Hwrite ==0)
             next_state = read;
          else
             next_state = idle;
        end
   write_wait:begin
          if(Valid)
            next_state = writep;
          else
            next_state = write;
          end
   read:begin
          next_state = read_enable;
        end
   write:begin
          if(Valid)
             next_state = write_enablep;
          else
             next_state = write_enable;
         end
   writep:begin
          next_state = write_enablep;
        end 
   write_enable:begin
          if(Valid == 1 && Hwrite ==1)
            next_state =  write_wait;
          else if(Valid == 1 && Hwrite ==0)
             next_state = read;
          else
             next_state = idle;
        end        
   write_enablep:begin
          if(Valid == 1 && tmp_Hwrite ==1)
            next_state =  writep;
          else if(Valid == 0 && tmp_Hwrite ==1)
             next_state = write;
          else
             next_state = read;
        end 
   read_enable:begin
          if(Valid == 1 && Hwrite ==1)
            next_state =  write_wait;
          else if(Valid == 1 && Hwrite ==0)
             next_state = read;
          else
             next_state = idle;
        end 
    default:begin
            next_state = idle;
           end
 endcase
end

// output_logic
always@(*)
begin
Hready_out=1'b0;
Penable=1'b0;
Pselx=1'b0;
Pwrite=1'b0;
Hrdata=32'b0;
Pwdata=32'b0;
Paddr=32'b0;
Hresp=2'b0;
tmp_Hwrite = 1'b0;
tmp_Haddr = 32'b0;
  case(current_state)
    idle:begin
        Hready_out = 1'b1;
        Penable = 1'b0;
        Pselx = 1'b0;
        end
   read:begin
        Paddr = Haddr;
        Pselx = 1'b1;
        Pwrite = 1'b0;
        Hready_out =1'b0;
        Penable = 1'b0;
        end
   read_enable:begin
        Hrdata = Prdata;
        Penable = 1'b1;
        Hready_out =1'b1;
        end
   write_wait:begin
        Penable = 1'b0;
        tmp_Hwrite = Hwrite;
        tmp_Haddr = Haddr;
        end
   write:begin
        Paddr = tmp_Haddr;
        Pselx = 1'b1;
        Pwdata = Hwdata;
        Pwrite = 1'b1;
        Hready_out =1'b0;
        Penable = 1'b0;
        end
    writep:begin
        Pselx = 1'b1;
        tmp_Hwrite = Hwrite;
        tmp_Haddr = Haddr;
        Paddr = tmp_Haddr;
        Pwdata = Hwdata;
        Pwrite = 1'b1;
        Penable = 1'b0;
        Hready_out =1'b0;
        end
    write_enable:begin
        Hready_out =1'b1;
        Penable = 1'b1;
        end
    write_enablep:begin
        Hready_out =1'b1;
        Penable = 1'b1;
        end

 endcase
end

endmodule
