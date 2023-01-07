module tb;
  reg [7:0]ip;
  reg [7:0]w_add;
  reg [7:0] r_add;
  reg clk,rw,reset;
  wire [7:0]op;
  
data_mem im(ip,w_add,rw,r_add,clk,reset,op);
  always #5 clk=~clk;
  initial
    begin
      $monitor("memdata = %b ,add = %b, rw=%b",op,r_add,rw);
      clk=1;
      #5 reset=1'b0;rw=1'b0;w_add=8'b00000001;ip=8'b11111000;
      #10 rw=1'b0;w_add=8'b00000010;ip=8'b11111001;
      #10 rw=1'b0;w_add=8'b00000011;ip=8'b11111010;
      #10 rw=1'b1;r_add=8'b00000001;ip=8'b00000000;
      #10 rw=1'b1;r_add=8'b00000010;ip=8'b00000000;
      #10 rw=1'b1;r_add=8'b00000011;ip=8'b00000000;
      #1 $finish;
    end
endmodule