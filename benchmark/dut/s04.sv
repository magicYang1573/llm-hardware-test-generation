module top (
    input clk,
    input rst,
    input a,
    input b,
    input c,
    input d,
    output reg result
);


always @(posedge clk) begin
    if (rst) begin
        result <= 0;
    end else begin
        case ({a, b, c, d})
            4'b0000: result <= a & b;
            4'b0001: result <= a | b;
            4'b0010: result <= a ^ b;
            4'b0011: result <= ~(a & b);
            4'b0100: result <= ~(a & b);
            4'b0101: result <= ~(a | b);
            4'b0110: result <= ~(a ^ b);
            4'b0111: result <= ~(a ^ b);
            4'b1000: result <= a & b;
            4'b1001: result <= a | b;
            4'b1010: result <= a ^ b;
            4'b1011: result <= ~(a & b);
            4'b1100: result <= ~(a & b);
            4'b1101: result <= ~(a | b);
            4'b1110: result <= ~(a ^ b);
            4'b1111: result <= ~(a ^ b);
        endcase
    end
end


endmodule
