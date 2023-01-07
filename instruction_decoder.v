module instruction_decoder(input [7:0]ip1,
                           output reg [3:0] opcode,
                           output reg [1:0] Rd,
                           output reg [1:0] Rs,
                           output reg [1:0] imm2,
                           output reg [3:0] imm4);
  always @(ip1) begin                                                      
    opcode = ip1[7:4];
    case(ip1[7:4])
      4'b0000 : begin imm4=ip1[3:0];imm2=2'b00;Rd=2'b00;Rs=2'b00; end
      4'b0001 : begin imm4=ip1[3:0];imm2=2'b00;Rd=2'b00;Rs=2'b00; end
      4'b0010 : begin imm4=4'b0000;imm2=ip1[1:0];Rd=ip1[3:2];Rs=2'b00;end
      4'b0011 : begin imm4=4'b0000;imm2=2'b00;Rd=ip1[3:2];Rs=ip1[1:0];end
      4'b0100 : begin imm4=4'b0000;imm2=2'b00;Rd=ip1[3:2];Rs=ip1[1:0];end
      4'b0101 : begin imm4=4'b0000;imm2=2'b00;Rd=ip1[3:2];Rs=ip1[1:0];end
      4'b0110 : begin imm4=4'b0000;imm2=2'b00;Rd=ip1[3:2];Rs=ip1[1:0];end
      4'b0111 : begin imm4=4'b0000;imm2=2'b00;Rd=ip1[3:2];Rs=ip1[1:0];end
      4'b1000 : begin imm4=4'b0000;imm2=2'b00;Rd=ip1[3:2];Rs=ip1[1:0];end
      4'b1001 : begin imm4=4'b0000;imm2=ip1[1:0];Rd=ip1[3:2];Rs=2'b00;end
      4'b1010 : begin imm4=4'b0000;imm2=2'b00;Rd=ip1[3:2];Rs=ip1[1:0];end
      4'b1011 : begin imm4=4'b0000;imm2=ip1[1:0];Rd=ip1[3:2];Rs=2'b00;end
      4'b1100 : begin imm4=4'b0000;imm2=ip1[1:0];Rd=ip1[3:2];Rs=2'b00;end
      4'b1101 : begin imm4=4'b0000;imm2=ip1[1:0];Rd=ip1[3:2];Rs=2'b00;end
      4'b1110 : begin imm4=4'b0000;imm2=ip1[1:0];Rd=ip1[3:2];Rs=2'b00;end
      4'b1111 : begin imm4=4'b0000;imm2=ip1[1:0];Rd=ip1[3:2];Rs=2'b00;end
      default : begin imm4=4'bz; imm2=2'bz;Rd=2'bz;Rs=2'bz;end
    endcase
  end
endmodule