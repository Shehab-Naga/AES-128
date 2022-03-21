/*
Project        : AES
Standard doc.  : 
Module name    : AddRoundKey block
Dependancy     :
Design doc.    : 
References     : 
Description    : AddRoundKey block is a sequential block that 
                 XOR the 128 bits of the matrix with the 128 bits 
                 of the round key.
Owner          : Shehab Bahaa
*/

`timescale 1 ns/1 ps

module AddRoundKey (
input clk, 
input reset_n,

input              IN_valid,
input      [127:0] IN_state,
input      [127:0] RoundKey,

output reg         OUT_valid,
output reg [127:0] OUT_state
);

always @(posedge clk or negedge reset_n)
if (!reset_n) begin 
    OUT_valid <= 0;
    OUT_state <= 'b0;
end else begin

    if (IN_valid) begin 
        OUT_valid <= 1;
        OUT_state <= IN_state ^ RoundKey;
    end else begin
        OUT_valid <= 0;
        OUT_state <= 'b0;
    end 
end
endmodule
//=========================================================
// EOF AddRoundKey
//=========================================================