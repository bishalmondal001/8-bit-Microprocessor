module tb;
  reg [7:0] ip1;
  wire [3:0] opcode;
  wire [1:0] Rd;
  wire [1:0] Rs;
  wire [1:0] imm2;
  wire [3:0] imm4;
  
  instruction_decoder im(ip1,opcode,Rd,Rs,imm2,imm4);
  initial
    begin  $monitor("ip1=%b,opcode=%b,Rd=%b,Rs=%b,imm2=%b,imm4=%b",ip1,opcode,Rd,Rs,imm2,imm4);
      #1 ip1=8'b00001100;
      #2 ip1=8'b11100101;
      #1 $finish;
    end
endmodule