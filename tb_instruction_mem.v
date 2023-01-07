module tb;
  reg [7:0]ip;
  reg [7:0]add;
  reg clk,rw,reset;
  wire [7:0]op;
  
  instruction_memory im(ip,clk,reset,add,rw,op);
  always #5 clk=~clk;
  initial
    begin
      $monitor("memdata = %b ,add = %b, rw=%b",op,add,rw);
      clk=0;
      #5 reset=1'b0;rw=1'b0;add=8'b00000001;ip=8'b11111000;
      #10 rw=1'b0;add=8'b00000010;ip=8'b11111001;
      #10 rw=1'b0;add=8'b00000011;ip=8'b11111010;
      #10 rw=1'b1;add=8'b00000001;ip=8'b00000000;
      #10 rw=1'b1;add=8'b00000010;ip=8'b00000000;
      #10 rw=1'b1;add=8'b00000011;ip=8'b00000000;
      #1 $finish;
    end
endmodule