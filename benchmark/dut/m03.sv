module top(
  input  LINE1,
  input LINE2,
  input  clk, 
  input rst,
  output reg OUTP, 
  output reg OVERFLW
);

  reg [2:0] stato;

  parameter a=0;
  parameter b=1;
  parameter c=2;
  parameter e=3;
  parameter f=4;
  parameter g=5;
  parameter wf0=6;
  parameter wf1=7;

  initial begin
    stato = a;
    OUTP = 0;
    OVERFLW = 0;
  end

  always @ (posedge clk) begin
    if(rst) begin
      stato = a;
      OUTP = 0;
      OVERFLW = 0;
    end
    else
      case (stato)
        a: begin
          if (LINE1 & LINE2)
            stato = f;
          else
            stato = b;
          OUTP = LINE1 ^ LINE2;
          OVERFLW = 0;
        end
        e: begin
          if (LINE1 & LINE2)
            stato = f;
          else
            stato = b;
          OUTP = LINE1 ^ LINE2;
          OVERFLW = 1;
        end
        b: begin
          if (LINE1 & LINE2)
            stato = g;
          else 
            stato = c;
          OUTP = LINE1 ^ LINE2;
          OVERFLW = 0;
        end
        f: begin
          if (LINE1 | LINE2)
            stato = g; 
          else
            stato = c;
          OUTP = ~(LINE1 ^ LINE2);
          OVERFLW = 0;
        end
        c: begin
          if (LINE1 & LINE2)
            stato = wf1;
          else
            stato = wf0;
          OUTP = LINE1 ^ LINE2;
          OVERFLW = 0;
        end
        g: begin
          if (LINE1 | LINE2)
            stato = wf1;
          else
            stato = wf0;
          OUTP = ~(LINE1 ^ LINE2);
          OVERFLW = 0;
        end
        wf0: begin
          if (LINE1 & LINE2)
            stato = e;
          else
            stato = a; 
          OUTP = LINE1 ^ LINE2;
          OVERFLW = 0;
        end
        wf1: begin
          if (LINE1 | LINE2)
            stato = e;
          else             
            stato = a;
          OUTP = ~(LINE1 ^ LINE2);
          OVERFLW = 0;
        end
      endcase
  end


endmodule 
