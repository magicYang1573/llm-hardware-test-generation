module top(
    input clk,
    input reset,
    input input1,
    input input2,
    output reg [5:0] state
);

localparam S0 = 6'b000000, S1 = 6'b000001, S2 = 6'b000010, S3 = 6'b000011,
S4 = 6'b000100, S5 = 6'b000101, S6 = 6'b000110, S7 = 6'b000111,
S8 = 6'b001000, S9 = 6'b001001, S10 = 6'b001010, S11 = 6'b001011,
S12 = 6'b001100, S13 = 6'b001101, S14 = 6'b001110, S15 = 6'b001111,
S16 = 6'b010000, S17 = 6'b010001, S18 = 6'b010010, S19 = 6'b010011,
S20 = 6'b010100, S21 = 6'b010101, S22 = 6'b010110, S23 = 6'b010111,
S24 = 6'b011000, S25 = 6'b011001, S26 = 6'b011010, S27 = 6'b011011,
S28 = 6'b011100, S29 = 6'b011101, S30 = 6'b011110, S31 = 6'b011111,
S32 = 6'b100000, S33 = 6'b100001, S34 = 6'b100010, S35 = 6'b100011,
S36 = 6'b100100, S37 = 6'b100101, S38 = 6'b100110, S39 = 6'b100111,
S40 = 6'b101000, S41 = 6'b101001, S42 = 6'b101010, S43 = 6'b101011,
S44 = 6'b101100, S45 = 6'b101101, S46 = 6'b101110, S47 = 6'b101111,
S48 = 6'b110000, S49 = 6'b110001, S50 = 6'b110010, S51 = 6'b110011,
S52 = 6'b110100, S53 = 6'b110101, S54 = 6'b110110, S55 = 6'b110111,
S56 = 6'b111000, S57 = 6'b111001, S58 = 6'b111010, S59 = 6'b111011,
S60 = 6'b111100, S61 = 6'b111101, S62 = 6'b111110, S63 = 6'b111111;

always @(posedge clk or posedge reset) begin
    if (reset) begin
        state <= S0; 
    end else begin
        case (state)
            S0:
                if(input1 & input2) 
                    state <= S1;
                else 
                    state <= S2;
            S1:
                if(!input1 & input2) 
                    state <= S3;
                else 
                    state <= S4;
            S2:
                if(input1 & !input2) 
                    state <= S5;
                else 
                    state <= S6;
            S3:
                if(!input1 & !input2) 
                    state <= S7;
                else 
                    state <= S8;
            S4:
                if(input1 | input2) 
                    state <= S9;
                else 
                    state <= S10;
            S5:
                if(!input1 | input2) 
                    state <= S11;
                else 
                    state <= S12;
            S6:
                if(input1 | !input2) 
                    state <= S13;
                else 
                    state <= S14;
            S7:
                if(!input1 | !input2) 
                    state <= S15;
                else 
                    state <= S16;
            S8:
                if(input1 & input2) 
                    state <= S17;
                else 
                    state <= S18;
            S9:
                if(!input1 & input2) 
                    state <= S19;
                else 
                    state <= S20;
            S10:
                if(input1 & !input2) 
                    state <= S21;
                else 
                    state <= S22;
            S11:
                if(!input1 & !input2) 
                    state <= S23;
                else 
                    state <= S24;
            S12:
                if(input1 | input2) 
                    state <= S25;
                else 
                    state <= S26;
            S13:
                if(!input1 | input2) 
                    state <= S27;
                else 
                    state <= S28;
            S14:
                if(input1 | !input2) 
                    state <= S29;
                else 
                    state <= S30;
            S15:
                if(!input1 | !input2) 
                    state <= S31;
                else 
                    state <= S32;
            S16:
                if(input1 & input2) 
                    state <= S33;
                else 
                    state <= S34;
            S17:
                if(!input1 & input2) 
                    state <= S35;
                else 
                    state <= S36;
            S18:
                if(input1 & !input2) 
                    state <= S37;
                else 
                    state <= S38;
            S19:
                if(!input1 & !input2) 
                    state <= S39;
                else 
                    state <= S40;
            S20:
                if(input1 | input2) 
                    state <= S41;
                else 
                    state <= S42;
            S21:
                if(!input1 | input2) 
                    state <= S43;
                else 
                    state <= S44;
            S22:
                if(input1 | !input2) 
                    state <= S45;
                else 
                    state <= S46;
            S23:
                if(!input1 | !input2) 
                    state <= S47;
                else 
                    state <= S48;
            S24:
                if(input1 & input2) 
                    state <= S49;
                else 
                    state <= S50;
            S25:
                if(!input1 & input2) 
                    state <= S51;
                else 
                    state <= S52;
            S26:
                if(input1 & !input2) 
                    state <= S53;
                else 
                    state <= S54;
            S27:
                if(!input1 & !input2) 
                    state <= S55;
                else 
                    state <= S56;
            S28:
                if(input1 | input2) 
                    state <= S57;
                else 
                    state <= S58;
            S29:
                if(!input1 | input2) 
                    state <= S59;
                else 
                    state <= S60;
            S30:
                if(input1 | !input2) 
                    state <= S61;
                else 
                    state <= S62;
            S31:
                if(!input1 | !input2) 
                    state <= S63;
                else 
                    state <= S0;
			S32:
                if(input1 & input2) 
                    state <= S1;
                else 
                    state <= S2;
            S33:
                if(!input1 & input2) 
                    state <= S3;
                else 
                    state <= S4;
            S34:
                if(input1 & !input2) 
                    state <= S5;
                else 
                    state <= S6;
            S35:
                if(!input1 & !input2) 
                    state <= S7;
                else 
                    state <= S8;
            S36:
                if(input1 | input2) 
                    state <= S9;
                else 
                    state <= S10;
            S37:
                if(!input1 | input2) 
                    state <= S11;
                else 
                    state <= S12;
            S38:
                if(input1 | !input2) 
                    state <= S13;
                else 
                    state <= S14;
            S39:
                if(!input1 | !input2) 
                    state <= S15;
                else 
                    state <= S16;
            S40:
                if(input1 & input2) 
                    state <= S17;
                else 
                    state <= S18;
            S41:
                if(!input1 & input2) 
                    state <= S19;
                else 
                    state <= S20;
            S42:
                if(input1 & !input2) 
                    state <= S21;
                else 
                    state <= S22;
            S43:
                if(!input1 & !input2) 
                    state <= S23;
                else 
                    state <= S24;
            S44:
                if(input1 | input2) 
                    state <= S25;
                else 
                    state <= S26;
            S45:
                if(!input1 | input2) 
                    state <= S27;
                else 
                    state <= S28;
            S46:
                if(input1 | !input2) 
                    state <= S29;
                else 
                    state <= S30;
            S47:
                if(!input1 | !input2) 
                    state <= S31;
                else 
                    state <= S32;
            S48:
                if(input1 & input2) 
                    state <= S33;
                else 
                    state <= S34;
            S49:
                if(!input1 & input2) 
                    state <= S35;
                else 
                    state <= S36;
            S50:
                if(input1 & !input2) 
                    state <= S37;
                else 
                    state <= S38;
            S51:
                if(!input1 & !input2) 
                    state <= S39;
                else 
                    state <= S40;
            S52:
                if(input1 | input2) 
                    state <= S41;
                else 
                    state <= S42;
            S53:
                if(!input1 | input2) 
                    state <= S43;
                else 
                    state <= S44;
            S54:
                if(input1 | !input2) 
                    state <= S45;
                else 
                    state <= S46;
            S55:
                if(!input1 | !input2) 
                    state <= S47;
                else 
                    state <= S48;
            S56:
                if(input1 & input2) 
                    state <= S49;
                else 
                    state <= S50;
            S57:
                if(!input1 & input2) 
                    state <= S51;
                else 
                    state <= S52;
            S58:
                if(input1 & !input2) 
                    state <= S53;
                else 
                    state <= S54;
            S59:
                if(!input1 & !input2) 
                    state <= S55;
                else 
                    state <= S56;
            S60:
                if(input1 | input2) 
                    state <= S57;
                else 
                    state <= S58;
            S61:
                if(!input1 | input2) 
                    state <= S59;
                else 
                    state <= S60;
            S62:
                if(input1 | !input2) 
                    state <= S61;
                else 
                    state <= S62;
            S63:
                if(!input1 | !input2) 
                    state <= S63;
                else 
                    state <= S0;
            default:
				state <= S0; 
        endcase
    end
end

endmodule
