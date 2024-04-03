module top(
    input clk,
    input rst,
    input [3:0] data_in,
    input shift,
    input load,
    input direction,
    input mode,
    input [3:0] mask,
    output reg [3:0] data_out,
    output reg overflow
);

reg [4:0] temp;

always @(posedge clk or posedge rst) begin
    if (rst) begin
        data_out <= 4'b0;
        overflow <= 1'b0;
    end else if (load) begin
        data_out <= data_in;
        overflow <= 1'b0;
    end else if (shift) begin
        if (direction) begin
            overflow <= data_out[3];
            data_out <= {data_out[2:0], 1'b0};
        end else begin
            overflow <= data_out[0];
            data_out <= {1'b0, data_out[3:1]};
        end
    end else if (mode) begin
        case(data_in)
            4'b0000: temp = data_out & mask;
            4'b0001: temp = data_out | mask;
            4'b0010: temp = data_out ^ mask;
            4'b0011: temp = ~data_out;
            4'b0100: temp = data_out + mask;
            4'b0101: temp = data_out - mask;
            4'b0110: temp = data_out << mask[1:0];
            4'b0111: temp = data_out >> mask[1:0];
            default: temp = data_out;
        endcase
        data_out <= temp[3:0];
        overflow <= temp[4];
    end
end

endmodule
