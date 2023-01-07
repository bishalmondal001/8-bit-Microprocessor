module ALU(input [7:0] operand_1,
            input [7:0] operand_2,
            input [3:0] opcode, 
            output z_flag,
            output cy_flag,
            output sign_flag,
            output reg [7:0] alu_out);
  
  reg z_flag_w = 1'bz;
  reg cy_flag_w = 1'bz;
  reg sign_flag_w = 1'bz;
  reg [8:0] result;
  
  always @(operand_1 or operand_2 or opcode) begin
        
        case(opcode[3:1])
        3'b100 : begin 
          result[7:0] = operand_1 | operand_2;
                 if(result[7:0] == 8'b00000000)begin
                    z_flag_w = 1'b1;
                end
            end
        3'b101 :begin 
          result[7:0] = operand_1 ^ operand_2;
          if(result[7:0] == 8'b00000000)begin
                    z_flag_w = 1'b1;
                end
            end
          default : result[7:0] = operand_1;
    endcase
    
    case (opcode[2:0])
            3'b100 :begin
              result = (operand_1 + operand_2);
              cy_flag_w =result[8] ;
            end
            3'b101 :begin
              result[7:0]  = (operand_1 - operand_2);
                 if (operand_1 > operand_2)begin
                    sign_flag_w = 1'b0;
                    z_flag_w = 1'b0;
                    cy_flag_w = 1'b0;
                 end
                 else if(operand_1<operand_2)begin
                   result[7:0] = ~result[7:0];
                   result[7:0] = result[7:0]+1;
                    sign_flag_w = 1'b1;
                    z_flag_w = 1'b0;
                   cy_flag_w = 1'b1;
                 end
                 else begin
                    z_flag_w = 1'b1;
                 end                 
                 
            end
            3'b111 : begin
              result[7:0]  = operand_1;
                if (operand_1 > operand_2)begin
                    cy_flag_w = 1'b0;
                    z_flag_w = 1'b0;
                 end
              else if(operand_2>operand_1)begin
                    cy_flag_w = 1'b1;
                    z_flag_w = 1'b0;
                 end
                 else begin
                    z_flag_w = 1'b1;
                 end  
            end
            3'b110 :begin 
              result[7:0] = operand_1 & operand_2;
              if(result[7:0] == 8'b00000000)begin
                    z_flag_w = 1'b1;
                end
            end
            default : result[7:0] = 8'b01001010;
        endcase
    end
  assign alu_out = result[7:0];
  assign cy_flag = cy_flag_w;
  assign z_flag = z_flag_w;
  assign sign_flag = sign_flag_w;
endmodule


