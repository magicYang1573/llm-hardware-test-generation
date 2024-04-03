module top (
    input clk,
    input rst,
    input [7:0] input_data,
    output reg [7:0] output_data
);

always @(posedge clk) begin
    if (rst) begin
        output_data <= 8'h00;
    end else begin
        if (input_data == 8'hFF) begin
            output_data <= input_data << 1;
        end else if (input_data > 8'h80) begin
            output_data <= input_data + 8'h0F;
        end else if (input_data < 8'h80) begin
            output_data <= input_data - 8'h10;
        end else begin
            output_data <= input_data;
        end
    end
end


endmodule

