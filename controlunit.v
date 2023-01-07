`include "programme_counter.v"
`include "instruction_decoder.v"
`include "data_memory.v"
`include "instruction_memory.v"
`include "ALU.v"
`include "register_bank.v"


module control_unit (
  input [7:0]data,
    input clk,
    output [3:0]opcode,imm4,
    output [1:0]Rd,Rs,
    output [7:0]imm2,
    output reg s1,s2,s3,s4,
    output reg [1:0]sel1,sel2,sel3);



instruction_decoder id(data,opcode,Rd,Rs,imm2[1:0],imm4);
assign imm2[7:2] = imm2[1]?6'b1:6'b0;

always @(data) begin
    

    case (opcode)
       4'b0000 : begin
        s1=1'b1;
        sel1=2'b00;
        sel3=2'b11;
        s3=0;
       end 
       4'b0001 : begin
        sel3=2'b11;
        s3=1'b1;
        sel2=2'b00;
        s1=0;
       end
       4'b0010 : begin
       

       end
       4'b0011 : begin
     
       end
       4'b0100 : begin
  
       end
       4'b0101 : begin
   
       end
       4'b0110 : begin
   
       end
       4'b0111 : begin
        
       end
       4'b1000 : begin
        
       end
       4'b1001 : begin
        
       end
       4'b1010 : begin
        
       end
       4'b1011 : begin
        
       end
       4'b1100 : begin
        
       end
       4'b1101 : begin
        
       end
       4'b1110 : begin
        
       end
       4'b1111 : begin
        
       end


        default: s1=1'bz;
    endcase
end










    



endmodule

module connections(input clk,input power,input [7:0]last_add);
wire [7:0]pc_add,data;
wire [3:0]opcode,imm4;
wire [1:0]Rd,Rs;
wire [7:0]imm2;
wire [3:0]G1,G2;
wire [7:0]reg1,reg2,reg3,reg4,reg5,reg6,reg7,reg8,reg9,reg10,reg11,reg12;
wire [1:0]l1,l2,l3; 

wire s1,s2,s3,s4;
wire [1:0] sel1,sel2,sel3;
  reg z,c,s;

  reg [7:0]pc_reg;

always @(posedge clk)begin
    pc_reg <= pc_add
end


instruction_memory im(8'b0,clk,0,pc_reg,1'b1,data);
programme_counter pc(clk,power,last_add,pc_add);
control_unit cu(data,clk,opcode,imm4,Rd,Rs,imm2,s1,s2,s3,s4,sel1,sel2,sel3);
demux2_1_4bit d2(imm4,s1,G1,G2);
data_mem dm(reg1,G2,s1,G1,clk,0,reg2);
mux4_1_2bit m1(Rd,Rs,2'b00,2'b00,sel3,l1);
demux2_1_2bit d1(l1,s3,l2,l3);
mux4_1 m2(reg2,imm2,reg5,reg6,sel1,reg4);
register_bank rb(reg3,l3,l2,s3,reg4,clk);
demux4_1 d3(reg3,sel2,reg1,reg5,reg10,reg11);
mux2_1 m3(reg11,imm2,s4,reg12);
ALU a1(reg12,reg11,opcode,z,c,s,reg6);

endmodule

module mux4_1(input [7:0]i0,i1,i2,i3,
              input [1:0]sel,
              output reg [7:0]out);

   always @(i0 or i1 or i2 or i3 or sel)begin
    case(sel)
        2'b00: out = i0;
        2'b01: out = i1;
        2'b10: out = i2;
        2'b11: out = i3;
    endcase 
   end
endmodule


module mux2_1(input [7:0]i0,i1,
              input sel,
              output reg [7:0]out);

   always @(i0 or i1  or sel)begin
    case(sel)
        1'b0: out = i0;
        1'b1: out = i1;
    endcase 
   end
endmodule


module demux2_1(input [7:0]in,
              input sel,
              output reg [7:0]o0,o1);

   always @(in or sel)begin
    case(sel)
        1'b0: o0 = in;
        1'b1: o1 = in;
    endcase 
   end
endmodule


module demux4_1(input [7:0]in,
              input [1:0]sel,
              output reg [7:0]o0,o1,o2,o3);

   always @(in or sel)begin
    case(sel)
        2'b00: o0 = in;
        2'b01: o1 = in;
        2'b10: o2 = in;
        2'b11: o3 = in;
    endcase 
   end
endmodule

module mux4_1_2bit(input [1:0]i0,i1,i2,i3,
              input [1:0]sel,
              output reg [1:0]out);

   always @(i0 or i1 or i2 or i3 or sel)begin
    case(sel)
        2'b00: out = i0;
        2'b01: out = i1;
        2'b10: out = i2;
        2'b11: out = i3;
    endcase 
   end
endmodule


module demux2_1_4bit(input [3:0]in,
              input sel,
              output reg [3:0]o0,o1);

   always @(in or sel)begin
    case(sel)
        1'b0: o0 = in;
        1'b1: o1 = in;
    endcase 
   end
endmodule


module demux2_1_2bit(input [1:0]in,
              input sel,
              output reg [1:0]o0,o1);

   always @(in or sel)begin
    case(sel)
        1'b0: o0 = in;
        1'b1: o1 = in;
    endcase 
   end
endmodule

