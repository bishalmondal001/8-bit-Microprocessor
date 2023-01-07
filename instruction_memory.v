module instruction_memory(input [7:0]ip,
                          input clk,
                          input reset,
                          input [7:0] add,
                          input rw,
                          output reg [7:0]op);
  reg [7:0]mem[255:0];
  always @(posedge clk)begin
    if(reset & 1)begin
      mem[0]= 0;
      end
      else begin
        if(!rw)begin
          mem[add]=ip;
      	end
        else begin
          op=mem[add];
      	
        end
      end
  end
  
endmodule