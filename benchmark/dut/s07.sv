module top(
    input clk,
    input rst,
    input [3:0] a,
    input [3:0] b,
    output reg [3:0] out
);

always @(posedge clk) begin
    if (rst) begin
        out <= 4'b0000;
    end else begin
        if((a & b) == 4'b1001)
            out <= 4'b0001;
        else if((a | b) == 4'b0101)
            out <= 4'b0011;
        else if((a ^ b) == 4'b1010)
            out <= 4'b0111;
        else if((~a & b) == 4'b1110)
            out <= 4'b1111;
    end
end

endmodule

