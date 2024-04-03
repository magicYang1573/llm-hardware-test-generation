
module top(
    input clk,
    input reset,
    input input1,
    input input2,
    output reg [3:0] state
);

localparam S0 = 4'b0000, S1 = 4'b0001, S2 = 4'b0010, S3 = 4'b0011,
           S4 = 4'b0100, S5 = 4'b0101, S6 = 4'b0110, S7 = 4'b0111,
           S8 = 4'b1000, S9 = 4'b1001, S10 = 4'b1010, S11 = 4'b1011,
           S12 = 4'b1100, S13 = 4'b1101, S14 = 4'b1110, S15 = 4'b1111;

always @(posedge clk or posedge reset) begin
    if (reset) begin
        state <= S0;  
    end else begin
        case (state)
            S0:  
                if(input1 & input2) begin
                    state <= S1;
                end else begin
                    state <= S2;
                end
            S1:  
                if(!input1 & input2) begin
                    state <= S3;
                end else begin
                    state <= S4;
                end
            S2:  
                if(input1 & !input2) begin
                    state <= S5;
                end else begin
                    state <= S6;
                end
            S3:  
                if(!input1 & !input2) begin
                    state <= S7;
                end else begin
                    state <= S8;
                end
            S4:  
                if(input1 | input2) begin
                    state <= S9;
                end else begin
                    state <= S10;
                end
            S5:  
                if(!input1 | input2) begin
                    state <= S11;
                end else begin
                    state <= S12;
                end
            S6:  
                if(input1 | !input2) begin
                    state <= S13;
                end else begin
                    state <= S14;
                end
            S7:  
                if(!input1 | !input2) begin
                    state <= S15;
                end else begin
                    state <= S0;
                end
            S8:  
                if(input1 & input2) begin
                    state <= S1;
                end else begin
                    state <= S2;
                end
            S9:  
                if(!input1 & input2) begin
                    state <= S3;
                end else begin
                    state <= S4;
                end
            S10: 
                if(input1 & !input2) begin
                    state <= S5;
                end else begin
                    state <= S6;
                end
            S11: 
                if(!input1 & !input2) begin
                    state <= S7;
                end else begin
                    state <= S8;
                end
            S12: 
                if(input1 | input2) begin
                    state <= S9;
                end else begin
                    state <= S10;
                end
            S13: 
                if(!input1 | input2) begin
                    state <= S11;
                end else begin
                    state <= S12;
                end
            S14: 
                if(input1 | !input2) begin
                    state <= S13;
                end else begin
                    state <= S14;
                end
            S15: 
                if(!input1 | !input2) begin
                    state <= S15;
                end else begin
                    state <= S0;
                end
        endcase
    end
end

endmodule
