module top(
    input wire clk, reset, pedestrian_button, car_sensor,
    output reg [2:0] lights
);

    localparam RED = 3'b001, YELLOW = 3'b010, GREEN = 3'b100;
    localparam WAIT = 2'b00, GO = 2'b01, WARN = 2'b10, STOP = 2'b11;

    reg [1:0] state, next_state;
    integer count;

    initial begin
        state = WAIT;
        count = 0;
    end

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            state <= WAIT;
            count <= 0;
        end else begin
            state <= next_state;
            if (count == 10) begin
                count <= 0;
            end else begin
                count <= count + 1;
            end
        end
    end

    always @* begin
        case (state)
            WAIT: begin
                if (car_sensor) begin
                    lights = RED;
                    next_state = GO;
                end else begin
                    lights = YELLOW;
                    next_state = WARN;
                end
            end
            GO: begin
                if (count < 6) begin
                    lights = GREEN;
                    next_state = GO;
                end else begin
                    lights = YELLOW;
                    next_state = WARN;
                end
            end
            WARN: begin
                if (count < 2) begin
                    lights = YELLOW;
                    next_state = WARN;
                end else if (pedestrian_button) begin
                    lights = RED;
                    next_state = STOP;
                end else begin
                    lights = RED;
                    next_state = GO;
                end
            end
            STOP: begin
                if (count < 4) begin
                    lights = RED;
                    next_state = STOP;
                end else begin
                    lights = GREEN;
                    next_state = GO;
                end
            end
        endcase
    end

endmodule
