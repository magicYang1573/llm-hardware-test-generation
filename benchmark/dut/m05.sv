module top(
    input clk,
    input rst,
    input enable,
    input up_down,
    output reg [3:0] count,
    output reg overflow,
    output reg underflow
);

initial begin
    count = 4'b0;
    overflow = 1'b0;
    underflow = 1'b0;
end

always @(posedge clk or posedge rst) begin
    if (rst) begin
        count <= 4'b0;
        overflow <= 1'b0;
        underflow <= 1'b0;
    end else if (enable) begin
        if (up_down) begin
            if (count == 4'b1111) begin
                overflow <= 1'b1;
                underflow <= 1'b0;
            end else begin
                count <= count + 1;
                overflow <= 1'b0;
                underflow <= 1'b0;
            end
        end else begin
            if (count == 4'b0000) begin
                underflow <= 1'b1;
                overflow <= 1'b0;
            end else begin
                count <= count - 1;
                underflow <= 1'b0;
                overflow <= 1'b0;
            end
        end
    end
end

endmodule

