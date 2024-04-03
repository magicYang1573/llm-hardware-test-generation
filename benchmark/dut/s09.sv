module top (
    input clk, 
    input [3:0] opcode,
    input [7:0] a, b,
    output reg [7:0] y,
    output reg zero,
    output reg overflow
);

always @(*) begin
    case (opcode)
        4'b0000: y = a + b; // ADD
        4'b0001: y = a - b; // SUB
        4'b0010: y = a * b; // MUL
        4'b0011: y = a / b; // DIV
        4'b0100: y = a & b; // AND
        4'b0101: y = a | b; // OR
        4'b0110: y = a ^ b; // XOR
        4'b0111: y = ~a;    // NOT
        4'b1000: y = a << b; // Shift left
        4'b1001: y = a >> b; // Shift right
        default: y = 8'b0000_0000; // default case
    endcase

    if (y == 8'b0000_0000)
        zero = 1'b1;
    else
        zero = 1'b0;

    if ((opcode == 4'b0000 && a[7] == b[7] && a[7] != y[7]) || 
        (opcode == 4'b0001 && a[7] != b[7] && a[7] != y[7]))
        overflow = 1'b1;
    else
        overflow = 1'b0;
end

endmodule

