/*
Project        : AES
Standard doc.  : 
Module name    : SubBytes block
Dependancy     :
Design doc.    : 
References     : 
Description    : SubBytes is a sequantial block that uses the
                 Sbox blok to substitute the input bytes 
Owner          : Shehab Bahaa
*/

`timescale 1 ns/1 ps

module SubBytes (
input clk, 
input reset_n,

input IN_valid,
input [127:0] IN_state,

output reg     OUT_valid,
output [127:0] OUT_state
);

genvar i;
generate
for (i = 0; i < 16; i = i +1) begin
    SBox SBox_inst(
        .clk(clk), 
        .reset(reset_n), 
        .valid_in(IN_valid), 
        .addr(IN_state[(127-i*8) -:8]), 
        .dout(OUT_state[(127-i*8) -:8])
        );
end
endgenerate

always @(posedge clk or negedge reset_n)
if (!reset_n) begin
    OUT_valid <= 0;
end else begin
    if (IN_valid)   OUT_valid <= 1;
    else            OUT_valid <= 0;
end

endmodule
