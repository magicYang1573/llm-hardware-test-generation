module top(
    input clk,
    input reset,
    input input1,
    input input2,
    output reg [6:0] state
);

localparam 
    S0 = 7'b0000000, S1 = 7'b0000001, S2 = 7'b0000010, S3 = 7'b0000011,
    S4 = 7'b0000100, S5 = 7'b0000101, S6 = 7'b0000110, S7 = 7'b0000111,
    S8 = 7'b0001000, S9 = 7'b0001001, S10 = 7'b0001010, S11 = 7'b0001011,
    S12 = 7'b0001100, S13 = 7'b0001101, S14 = 7'b0001110, S15 = 7'b0001111,
    S16 = 7'b0010000, S17 = 7'b0010001, S18 = 7'b0010010, S19 = 7'b0010011,
    S20 = 7'b0010100, S21 = 7'b0010101, S22 = 7'b0010110, S23 = 7'b0010111,
    S24 = 7'b0011000, S25 = 7'b0011001, S26 = 7'b0011010, S27 = 7'b0011011,
    S28 = 7'b0011100, S29 = 7'b0011101, S30 = 7'b0011110, S31 = 7'b0011111,
    S32 = 7'b0100000, S33 = 7'b0100001, S34 = 7'b0100010, S35 = 7'b0100011,
    S36 = 7'b0100100, S37 = 7'b0100101, S38 = 7'b0100110, S39 = 7'b0100111,
    S40 = 7'b0101000, S41 = 7'b0101001, S42 = 7'b0101010, S43 = 7'b0101011,
    S44 = 7'b0101100, S45 = 7'b0101101, S46 = 7'b0101110, S47 = 7'b0101111,
    S48 = 7'b0110000, S49 = 7'b0110001, S50 = 7'b0110010, S51 = 7'b0110011,
    S52 = 7'b0110100, S53 = 7'b0110101, S54 = 7'b0110110, S55 = 7'b0110111,
    S56 = 7'b0111000, S57 = 7'b0111001, S58 = 7'b0111010, S59 = 7'b0111011,
    S60 = 7'b0111100, S61 = 7'b0111101, S62 = 7'b0111110, S63 = 7'b0111111,
    S64 = 7'b1000000, S65 = 7'b1000001, S66 = 7'b1000010, S67 = 7'b1000011,
    S68 = 7'b1000100, S69 = 7'b1000101, S70 = 7'b1000110, S71 = 7'b1000111,
    S72 = 7'b1001000, S73 = 7'b1001001, S74 = 7'b1001010, S75 = 7'b1001011,
    S76 = 7'b1001100, S77 = 7'b1001101, S78 = 7'b1001110, S79 = 7'b1001111,
    S80 = 7'b1010000, S81 = 7'b1010001, S82 = 7'b1010010, S83 = 7'b1010011,
    S84 = 7'b1010100, S85 = 7'b1010101, S86 = 7'b1010110, S87 = 7'b1010111,
    S88 = 7'b1011000, S89 = 7'b1011001, S90 = 7'b1011010, S91 = 7'b1011011,
    S92 = 7'b1011100, S93 = 7'b1011101, S94 = 7'b1011110, S95 = 7'b1011111,
    S96 = 7'b1100000, S97 = 7'b1100001, S98 = 7'b1100010, S99 = 7'b1100011,
    S100 = 7'b1100100, S101 = 7'b1100101, S102 = 7'b1100110, S103 = 7'b1100111,
    S104 = 7'b1101000, S105 = 7'b1101001, S106 = 7'b1101010, S107 = 7'b1101011,
    S108 = 7'b1101100, S109 = 7'b1101101, S110 = 7'b1101110, S111 = 7'b1101111,
    S112 = 7'b1110000, S113 = 7'b1110001, S114 = 7'b1110010, S115 = 7'b1110011,
    S116 = 7'b1110100, S117 = 7'b1110101, S118 = 7'b1110110, S119 = 7'b1110111,
    S120 = 7'b1111000, S121 = 7'b1111001, S122 = 7'b1111010, S123 = 7'b1111011,
    S124 = 7'b1111100, S125 = 7'b1111101, S126 = 7'b1111110, S127 = 7'b1111111;

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
                    state <= S64;
			S32:
                if(input1 & input2) 
                    state <= S65;
                else 
                    state <= S66;
            S33:
                if(!input1 & input2) 
                    state <= S67;
                else 
                    state <= S68;
            S34:
                if(input1 & !input2) 
                    state <= S69;
                else 
                    state <= S70;
            S35:
                if(!input1 & !input2) 
                    state <= S71;
                else 
                    state <= S72;
            S36:
                if(input1 | input2) 
                    state <= S73;
                else 
                    state <= S74;
            S37:
                if(!input1 | input2) 
                    state <= S75;
                else 
                    state <= S76;
            S38:
                if(input1 | !input2) 
                    state <= S77;
                else 
                    state <= S78;
            S39:
                if(!input1 | !input2) 
                    state <= S79;
                else 
                    state <= S80;
            S40:
                if(input1 & input2) 
                    state <= S81;
                else 
                    state <= S82;
            S41:
                if(!input1 & input2) 
                    state <= S83;
                else 
                    state <= S84;
            S42:
                if(input1 & !input2) 
                    state <= S85;
                else 
                    state <= S86;
            S43:
                if(!input1 & !input2) 
                    state <= S87;
                else 
                    state <= S88;
            S44:
                if(input1 | input2) 
                    state <= S89;
                else 
                    state <= S90;
            S45:
                if(!input1 | input2) 
                    state <= S91;
                else 
                    state <= S92;
            S46:
                if(input1 | !input2) 
                    state <= S93;
                else 
                    state <= S94;
            S47:
                if(!input1 | !input2) 
                    state <= S95;
                else 
                    state <= S96;
            S48:
                if(input1 & input2) 
                    state <= S97;
                else 
                    state <= S98;
            S49:
                if(!input1 & input2) 
                    state <= S99;
                else 
                    state <= S100;
            S50:
                if(input1 & !input2) 
                    state <= S101;
                else 
                    state <= S102;
            S51:
                if(!input1 & !input2) 
                    state <= S103;
                else 
                    state <= S104;
            S52:
                if(input1 | input2) 
                    state <= S105;
                else 
                    state <= S106;
            S53:
                if(!input1 | input2) 
                    state <= S107;
                else 
                    state <= S108;
            S54:
                if(input1 | !input2) 
                    state <= S109;
                else 
                    state <= S110;
            S55:
                if(!input1 | !input2) 
                    state <= S111;
                else 
                    state <= S112;
            S56:
                if(input1 & input2) 
                    state <= S113;
                else 
                    state <= S114;
            S57:
                if(!input1 & input2) 
                    state <= S115;
                else 
                    state <= S116;
            S58:
                if(input1 & !input2) 
                    state <= S117;
                else 
                    state <= S118;
            S59:
                if(!input1 & !input2) 
                    state <= S119;
                else 
                    state <= S120;
            S60:
                if(input1 | input2) 
                    state <= S121;
                else 
                    state <= S122;
            S61:
                if(!input1 | input2) 
                    state <= S123;
                else 
                    state <= S124;
            S62:
                if(input1 | !input2) 
                    state <= S125;
                else 
                    state <= S126;
            S63:
                if(!input1 | !input2) 
                    state <= S127;
                else 
                    state <= S0;
            S64:
                if(input1 & input2) 
                    state <= S1;
                else 
                    state <= S2;
            S65:
                if(!input1 & input2) 
                    state <= S3;
                else 
                    state <= S4;
            S66:
                if(input1 & !input2) 
                    state <= S5;
                else 
                    state <= S6;
            S67:
                if(!input1 & !input2) 
                    state <= S7;
                else 
                    state <= S8;
            S68:
                if(input1 | input2) 
                    state <= S9;
                else 
                    state <= S10;
            S69:
                if(!input1 | input2) 
                    state <= S11;
                else 
                    state <= S12;
            S70:
                if(input1 | !input2) 
                    state <= S13;
                else 
                    state <= S14;
            S71:
                if(!input1 | !input2) 
                    state <= S15;
                else 
                    state <= S16;
            S72:
                if(input1 & input2) 
                    state <= S17;
                else 
                    state <= S18;
            S73:
                if(!input1 & input2) 
                    state <= S19;
                else 
                    state <= S20;
            S74:
                if(input1 & !input2) 
                    state <= S21;
                else 
                    state <= S22;
            S75:
                if(!input1 & !input2) 
                    state <= S23;
                else 
                    state <= S24;
            S76:
                if(input1 | input2) 
                    state <= S25;
                else 
                    state <= S26;
            S77:
                if(!input1 | input2) 
                    state <= S27;
                else 
                    state <= S28;
            S78:
                if(input1 | !input2) 
                    state <= S29;
                else 
                    state <= S30;
            S79:
                if(!input1 | !input2) 
                    state <= S31;
                else 
                    state <= S32;
            S80:
                if(input1 & input2) 
                    state <= S33;
                else 
                    state <= S34;
            S81:
                if(!input1 & input2) 
                    state <= S35;
                else 
                    state <= S36;
            S82:
                if(input1 & !input2) 
                    state <= S37;
                else 
                    state <= S38;
            S83:
                if(!input1 & !input2) 
                    state <= S39;
                else 
                    state <= S40;
            S84:
                if(input1 | input2) 
                    state <= S41;
                else 
                    state <= S42;
            S85:
                if(!input1 | input2) 
                    state <= S43;
                else 
                    state <= S44;
            S86:
                if(input1 | !input2) 
                    state <= S45;
                else 
                    state <= S46;
            S87:
                if(!input1 | !input2) 
                    state <= S47;
                else 
                    state <= S48;
            S88:
                if(input1 & input2) 
                    state <= S49;
                else 
                    state <= S50;
            S89:
                if(!input1 & input2) 
                    state <= S51;
                else 
                    state <= S52;
            S90:
                if(input1 & !input2) 
                    state <= S53;
                else 
                    state <= S54;
            S91:
                if(!input1 & !input2) 
                    state <= S55;
                else 
                    state <= S56;
            S92:
                if(input1 | input2) 
                    state <= S57;
                else 
                    state <= S58;
            S93:
                if(!input1 | input2) 
                    state <= S59;
                else 
                    state <= S60;
            S94:
                if(input1 | !input2) 
                    state <= S61;
                else 
                    state <= S62;
            S95:
                if(!input1 | !input2) 
                    state <= S63;
                else 
                    state <= S64;
            S96:
                if(input1 & input2) 
                    state <= S65;
                else 
                    state <= S66;
            S97:
                if(!input1 & input2) 
                    state <= S67;
                else 
                    state <= S68;
            S98:
                if(input1 & !input2) 
                    state <= S69;
                else 
                    state <= S70;
            S99:
                if(!input1 & !input2) 
                    state <= S71;
                else 
                    state <= S72;
            S100:
                if(input1 | input2) 
                    state <= S73;
                else 
                    state <= S74;
            S101:
                if(!input1 | input2) 
                    state <= S75;
                else 
                    state <= S76;
            S102:
                if(input1 | !input2) 
                    state <= S77;
                else 
                    state <= S78;
            S103:
                if(!input1 | !input2) 
                    state <= S79;
                else 
                    state <= S80;
            S104:
                if(input1 & input2) 
                    state <= S81;
                else 
                    state <= S82;
            S105:
                if(!input1 & input2) 
                    state <= S83;
                else 
                    state <= S84;
            S106:
                if(input1 & !input2) 
                    state <= S85;
                else 
                    state <= S86;
            S107:
                if(!input1 & !input2) 
                    state <= S87;
                else 
                    state <= S88;
            S108:
                if(input1 | input2) 
                    state <= S89;
                else 
                    state <= S90;
            S109:
                if(!input1 | input2) 
                    state <= S91;
                else 
                    state <= S92;
            S110:
                if(input1 | !input2) 
                    state <= S93;
                else 
                    state <= S94;
            S111:
                if(!input1 | !input2) 
                    state <= S95;
                else 
                    state <= S96;
            S112:
                if(input1 & input2) 
                    state <= S97;
                else 
                    state <= S98;
            S113:
                if(!input1 & input2) 
                    state <= S99;
                else 
                    state <= S100;
            S114:
                if(input1 & !input2) 
                    state <= S101;
                else 
                    state <= S102;
            S115:
                if(!input1 & !input2) 
                    state <= S103;
                else 
                    state <= S104;
            S116:
                if(input1 | input2) 
                    state <= S105;
                else 
                    state <= S106;
            S117:
                if(!input1 | input2) 
                    state <= S107;
                else 
                    state <= S108;
            S118:
                if(input1 | !input2) 
                    state <= S109;
                else 
                    state <= S110;
            S119:
                if(!input1 | !input2) 
                    state <= S111;
                else 
                    state <= S112;
            S120:
                if(input1 & input2) 
                    state <= S113;
                else 
                    state <= S114;
            S121:
                if(!input1 & input2) 
                    state <= S115;
                else 
                    state <= S116;
            S122:
                if(input1 & !input2) 
                    state <= S117;
                else 
                    state <= S118;
            S123:
                if(!input1 & !input2) 
                    state <= S119;
                else 
                    state <= S120;
            S124:
                if(input1 | input2) 
                    state <= S121;
                else 
                    state <= S122;
            S125:
                if(!input1 | input2) 
                    state <= S123;
                else 
                    state <= S124;
            S126:
                if(input1 | !input2) 
                    state <= S125;
                else 
                    state <= S126;
            S127:
                if(!input1 | !input2) 
                    state <= S127;
                else 
                    state <= S0;
            default:
                state <= S0; 
        endcase
    end
end

endmodule
