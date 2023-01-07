module tb;
  reg clk,power;
  reg [7:0]last_add;
  
  
  connections cn(clk,power,last_add);
  
  wire [7:0]op;
  reg [1:0]r_add,w_add;
  reg rw;
  reg [7:0]ip;
  
  
  
  register_bank rb0(op,r_add,w_add,rw,ip,clk);
  
  reg [7:0]ip_im;
  reg [7:0]add;
  reg rw_im,reset_im;
  wire [7:0]op_im;
  
  instruction_memory imm(ip_im,clk,reset_im,add,rw_im,op_im);
  
 
  reg [7:0]ip_dm;
  reg [3:0]w_add_dm;
  reg [3:0] r_add_dm;
  reg rw_dm,reset_dm;
  wire [7:0]op_dm;
  
  data_mem dmm(ip_dm,w_add_dm,rw_dm,r_add_dm,clk,reset_dm,op_dm);
  
  always #5 clk =~clk;
  initial
    begin  
      $monitor("time =%3d", $time);
      $dumpfile("dump.vcd");
      $dumpvars(0,tb);
      
      clk = 0;reset_im=1;reset_dm=1;power=0;last_add=0;
      
      #5 reset_im=0;ip_im = 8'b00000001;add=8'b00000000;rw_im=0;
      #10 ip_im = 8'b00010011;add=8'b00000001;rw_im=0;
      
      #5 reset_dm=0;ip_dm = 8'b00111100;w_add_dm=4'b0001;rw_dm=0;
      #11
      
       power = 1'b1;last_add = 8'b00000010;
      
      #20 rw=1'b1;r_add = 2'b00;
      #4$display("op = %b", op);
      
      $finish;
    end
endmodule