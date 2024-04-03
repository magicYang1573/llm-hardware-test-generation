module top (
    input clk,
    input rst,
    input a,
    input b,
    input c,
    input d,
    output reg out_result
);


always @(posedge clk) begin
    if (rst) begin
        out_result <= 0;
    end else begin
        if (a && b && c && d) 
            out_result <= 1;
        else if (a && b && c && !d) 
            out_result <= 0;
        else if (a && b && !c && d) 
            out_result <= 1;
        else if (a && !b && c && d) 
            out_result <= 1;
        else if (!a && b && c && d) 
            out_result <= 1;
        else if (a && b && !c && !d) 
            out_result <= 0;
        else if (a && !b && c && !d) 
            out_result <= 1;
        else if (!a && b && c && !d) 
            out_result <= 0;
        else if (a && !b && !c && d) 
            out_result <= 0;
        else if (!a && b && !c && d) 
            out_result <= 1;
        else if (!a && !b && c && d) 
            out_result <= 0;
        else if (a && !b && !c && !d) 
            out_result <= 1;
        else if (!a && !b && c && !d) 
            out_result <= 1;
        else if (!a && b && !c && !d) 
            out_result <= 0;
        else if (!a && !b && !c && d) 
            out_result <= 1;
        else if (!a && !b && !c && !d) 
            out_result <= 1;
        
    end
end


endmodule

