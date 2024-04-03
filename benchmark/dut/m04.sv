module top(
    input clk,
    input rst,
    input enable,
    output reg [3:0] count,
    output reg overflow
);

initial begin
    count = 4'b0;
    overflow = 1'b0;
end

always @(posedge clk or posedge rst) begin
    if (rst) begin
        count <= 4'b0;
        overflow <= 1'b0;
    end else if (enable) begin
        if (count == 4'b1111) begin
            overflow <= 1'b1;
        end else begin
            count <= count + 1;
            overflow <= 1'b0;
        end 
    end
end

endmodule

