module programme_counter(input clk,
                         input power,
                         input [7:0] last_add, 
                         output reg [7:0] add);
  reg [7:0]a;
  
  always @(negedge clk)begin
    if(power == 0) begin
      add = 0;
      a =0;
    end
    else begin
      if(a==last_add)begin
        add=0;
      end
      else begin
        a<=a+1;
        add <= a;
      end  
    end
  end
endmodule