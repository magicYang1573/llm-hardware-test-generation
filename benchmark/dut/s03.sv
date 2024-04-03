module top (
    input clk,
    input rst,
    input a,
    input b,
    input c,
    output reg result
);


always @(posedge clk) begin
    if (rst) begin
        result <= 0;
    end else begin
        case ({a, b, c})
            3'b000: result <= a & b;
            3'b001: result <= a | b;
            3'b010: result <= a ^ b;
            3'b011: result <= ~(a & b);
            3'b100: result <= ~(a & b);
            3'b101: result <= ~(a | b);
            3'b110: result <= ~(a ^ b);
            3'b111: result <= ~(a ^ b);
        endcase
    end
end



endmodule

