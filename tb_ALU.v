module tb;
  reg [7:0]operand_1,operand_2;
  reg [3:0]opcode;
  
  wire z_flag,cy_flag,sign_flag;
  wire [7:0]alu_out;
  
  ALU A1(operand_1,operand_2,opcode,z_flag,cy_flag,sign_flag,alu_out);
  
  initial
    begin
      $monitor("alu_out = %b , z_flag = %b , cy_flag = %b , sign_flag = %b", alu_out, z_flag, cy_flag, sign_flag);
      #5 operand_1 = 8'b00010101; operand_2 = 8'b10001011; opcode = 4'b0101;
      #5 $finish;
    end
endmodule