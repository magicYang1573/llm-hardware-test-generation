module top(
    input clk,
    input rst,
    input [3:0] a,
    input [3:0] b,
    output reg [3:0] out
);

wire t1;
wire t2;
wire t3;
wire t4;

assign t1 = a & b ==4'b1010 ? 1'b1 : 1'b0;
assign t2 = a & b ==4'b1001 ? 1'b1 : 1'b0;
assign t3 = a & b ==4'b1101 ? 1'b1 : 1'b0;
assign t4 = a & b ==4'b1011 ? 1'b1 : 1'b0;

always @(posedge clk or posedge rst) begin
    if (rst) begin
        out <= 4'b0000;
    end else begin
        if(t1==1'b1) 
            out <= 4'b0001;
        else if(t2==1'b1) 
            out <= 4'b0011;
        else if(t3==1'b1)
            out <= 4'b0111;
        else if(t4==1'b1)
            out <= 4'b1111;
    end
end

endmodule

