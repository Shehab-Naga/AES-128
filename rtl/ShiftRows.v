/*
Project        : AES
Standard doc.  : 
Module name    : ShiftRows block
Dependancy     :
Design doc.    : 
References     : 
Description    : ShiftRows is a combinational block that shifts each
                 of the four rows of the matrix to the left.
Owner          : Shehab Bahaa
*/

`timescale 1 ns/1 ps

module ShiftRows (
    input [127:0] IN_state,
    output [127:0] OUT_state
);

wire [7:0] S[0:3][0:3] ;
// | S00 | S01 | S02 | S03 |
// | S10 | S11 | S12 | S13 |
// | S20 | S21 | S22 | S23 |
// | S30 | S31 | S32 | S33 |
genvar i, j;
generate
for (i = 0; i < 4; i = i+1) begin
    for (j = 0; j < 4; j = j+1) begin
        assign S[i][j] = IN_state[8*(3-i)+32*(3-j)+7:8*(3-i)+32*(3-j)];
    end
end
endgenerate

assign OUT_state = {S[0][0], S[1][1], S[2][2], S[3][3], 
                    S[0][1], S[1][2], S[2][3], S[3][0], 
                    S[0][2], S[1][3], S[2][0], S[3][1], 
                    S[0][3], S[1][0], S[2][1], S[3][2]};

endmodule