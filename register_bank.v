module register_bank(output reg [7:0]op,
                    input [1:0]r_add,
                    input [1:0]w_add,
                    input rw,
                    input [7:0]ip,
                    input clk);

reg [7:0]registers[3:0];
always @(negedge clk)begin
    if(!rw)begin
        register[w_add]=ip;
    end
    else begin
        op = register[r_add];
    end
end
endmodule