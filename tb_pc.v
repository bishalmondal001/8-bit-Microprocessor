module tb;
  reg clk;
  reg power;
  reg [7:0]last_add;
  
  wire [7:0] add;
  
  
  programme_counter pc(clk, power, last_add, add);
  always #5 clk =~clk;
  initial
    begin  $monitor(" add = %b ", add);
      clk = 0;last_add = 8'b00001111; power =1'b0;
      #5 power = 1'b1;
      #200 power = 1'b0;
      #5 last_add = 8'b00011111;
      #5 power = 1'b1;
      #400 $finish;
    end
endmodule