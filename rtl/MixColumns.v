/*
Project        : AES
Standard doc.  : 
Module name    : MixColumns block
Dependancy     :
Design doc.    : 
References     : 
Description    : MixColumns block is a combinational block that 
                 transforms each column of four bytes using a 
                 special mathematical function.
Owner          : Shehab Bahaa
*/

`timescale 1 ns/1 ps

module MixColumns (
    input [127:0] IN_state,
    output reg [127:0] OUT_state
);

function [7:0] MultiplyByTwo;
	input [7:0] x;
	begin 
			/* multiplication by 2 is shifting on bit to the left, and if the original 8 bits had a 1 @ MSB, xor the result with 0001 1011*/
			if(x[7] == 1) MultiplyByTwo = ((x << 1) ^ 8'h1b);
			else MultiplyByTwo = x << 1; 
	end 	
endfunction

function [7:0] MultiplyByThree;
	input [7:0] x;
	begin 
			/* multiplication by 3 ,= 01 ^ 10 = (NUM * 01) XOR (NUM * 10) = (NUM) XOR (NUM Muliplication by 2) */
			MultiplyByThree = MultiplyByTwo(x) ^ x;
	end 
endfunction

integer i, j;

reg [7:0] S[0:3][0:3] ;
reg [7:0] S_new[0:3][0:3] ;
// | S00 | S01 | S02 | S03 |
// | S10 | S11 | S12 | S13 |
// | S20 | S21 | S22 | S23 |
// | S30 | S31 | S32 | S33 |


always @ (IN_state)
begin
    for (i = 0; i < 4; i = i+1) begin
        for (j = 0; j < 4; j = j+1) begin
            S[i][j] = IN_state[(8*(3-i)+32*(3-j)+7) -: 8];
        end
    end
    for (j = 0; j < 4; j = j+1) begin
        S_new[0][j] =MultiplyByTwo(S[0][j]) ^ MultiplyByThree(S[1][j]) ^ S[2][j] ^ S[3][j];
        S_new[1][j] =S[0][j] ^ MultiplyByTwo(S[1][j]) ^ MultiplyByThree(S[2][j]) ^ S[3][j];
        S_new[2][j] =S[0][j] ^ S[1][j] ^ MultiplyByTwo(S[2][j]) ^ MultiplyByThree(S[3][j]);
        S_new[3][j] =MultiplyByThree(S[0][j]) ^ S[1][j] ^ S[2][j] ^ MultiplyByTwo(S[3][j]);
    end

    OUT_state = {S_new[0][0], S_new[1][0], S_new[2][0], S_new[3][0], 
                 S_new[0][1], S_new[1][1], S_new[2][1], S_new[3][1], 
                 S_new[0][2], S_new[1][2], S_new[2][2], S_new[3][2], 
                 S_new[0][3], S_new[1][3], S_new[2][3], S_new[3][3]};

end 

endmodule



// 128'h87_6E_46_A6_F2_4C_E7_8C_4D_90_4A_D8_97_EC_C3_95
