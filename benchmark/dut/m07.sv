module top (
    input clk,
    input reset,
    input [7:0] data_in,
    output reg [7:0] data_out
);

reg [7:0] temp_data;
reg [2:0] state;
reg [3:0] counter;

parameter STATE_IDLE = 3'b000;
parameter STATE_PROCESSING = 3'b001;
parameter STATE_OUTPUT = 3'b010;

initial begin
    data_out = 8'h00;
    temp_data = 8'h00;
    state = STATE_IDLE;
    counter = 4'b0000;
end

always @(posedge clk or posedge reset) begin
    if (reset) begin
        data_out <= 8'h00;
        temp_data <= 8'h00;
        state <= STATE_IDLE;
        counter <= 4'b0000;
    end else begin
        case (state)
            STATE_IDLE: begin
                if (data_in == 8'hFF) begin
                    state <= STATE_OUTPUT;
                end else begin
                    state <= STATE_PROCESSING;
                end
            end
            STATE_PROCESSING: begin
                if (data_in > 8'h80) begin
                    temp_data <= data_in - 8'h80;
                end else begin
                    temp_data <= data_in + 8'h10;
                end
                state <= STATE_OUTPUT;
            end
            STATE_OUTPUT: begin
                if (temp_data[7]) begin
                    data_out <= temp_data ^ 8'hFF;
                end else begin
                    data_out <= temp_data + 8'h01;
                end
                state <= STATE_IDLE;
            end
            default: state <= STATE_IDLE;
        endcase

        if (counter < 8) begin
            counter <= counter + 1;
        end else begin
            counter <= 4'b0000;
        end

        if (counter == 4) begin
            data_out <= data_out + 8'h01;
        end else begin
            data_out <= data_out - 8'h01;
        end
    end
end

endmodule


