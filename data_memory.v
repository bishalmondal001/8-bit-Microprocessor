module data_mem(input [7:0] ip,
                input [3:0] w_add,
                input rw,
                input [3:0] r_add,
                input clk,
                input reset,
                output reg [7:0] op);
reg [7:0] mem [15:0];
always @(negedge clk) begin
    if(reset==1)begin
        mem[0]=0;
    end
    else begin
        if(!rw)begin
            mem[w_add]=ip;
        end  
        else begin
            op=mem[r_add];
        end
    end

end
    
endmodule
