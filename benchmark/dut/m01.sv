module top(
    input clk,
    input rst,
    input inp1,
    input inp2,
    output reg outp
);

// State encoding
parameter S0 = 2'b00, S1 = 2'b01, S2 = 2'b10, S3 = 2'b11;

// Current and next state declaration
reg [1:0] current_state, next_state;

initial begin
    current_state = S0;
end

// State transition and output logic
always @(*) begin
    case (current_state)
        S0: begin
            outp = 0;
            if (inp1) next_state = S1;
            else if (inp2) next_state = S2;
            else next_state = S0;
        end
        S1: begin
            outp = 1;
            if (inp1) next_state = S3;
            else if (inp2) next_state = S0;
            else next_state = S1;
        end
        S2: begin
            outp = 0;
            if (inp1) next_state = S0;
            else if (inp2) next_state = S3;
            else next_state = S2;
        end
        S3: begin
            outp = 1;
            if (inp1) next_state = S2;
            else if (inp2) next_state = S1;
            else next_state = S3;
        end
    endcase
end

// State update logic
always @(posedge clk or posedge rst) begin
    if (rst) current_state <= S0;
    else current_state <= next_state;
end

endmodule

