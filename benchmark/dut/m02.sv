module top(
    input  clk,
    input rst,
    input  LINEA,
    output reg U
);

    reg [2:0] stato;

    parameter A=0;
    parameter B=1;
    parameter C=2;
    parameter D=3;
    parameter E=4;
    parameter F=5;
    parameter G=6;

    initial begin
      stato = A;
	    U = 0;
    end

    always @ (posedge clk) begin
      if(rst) begin
        stato = A;
        U = 0;
      end
      else 
        case (stato)
          A: begin
            stato = B;
            U = 0;
          end
          B: begin
            if (LINEA == 0)
              stato = C;
            else
              stato = F;
            U = 0;
          end
          C: begin
            if (LINEA == 0)
              stato = D;
            else
              stato = G;
            U = 0;
          end
          D: begin
            stato = E; 
            U = 0;
          end
          E: begin
              stato = B;
              U = 1;
          end
          F: begin
            stato = G;
            U = 0;
          end
          G: begin
              if (LINEA == 0)
                stato = E;
              else
                stato = A;
              U = 0;
          end
        endcase
    end

endmodule // b02
