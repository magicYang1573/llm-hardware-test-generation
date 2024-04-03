
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
        if (a && b && c) 
            result <= 1;
        else if (a && b && !c) 
            result <= 0;
        else if (a && !b && c) 
            result <= 1;
        else if (!a && b && c) 
            result <= 0;
        else if (a && !b && !c) 
            result <= 1;
        else if (!a && !b && c) 
            result <= 0;
        else if (!a && b && !c) 
            result <= 1;
        else if (!a && !b && !c)
            result <= 0;

    end
end

endmodule

