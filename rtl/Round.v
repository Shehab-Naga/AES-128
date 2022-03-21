/*
Project        : AES
Standard doc.  : 
Module name    : Round block
Dependancy     :
Design doc.    : 
References     : 
Description    : Round block is a sequential block that reperesents 
                 a signle round of the algorithm
Owner          : Shehab Bahaa
*/

`timescale 1 ns/1 ps

module Round (
input clk, 
input reset_n,

input         IN_valid,
input [127:0] IN_state,
input [127:0] RoundKey,

output         OUT_valid,
output [127:0] OUT_state
);

wire SubBytes2AddRoundKey_valid;
wire [127:0] SubBytes2ShiftRows_state, ShiftRows2MixColumns_state, MixColumns2AddRoundKey_state;


SubBytes SubBytes_inst(
.clk(clk), 
.reset_n(reset_n),
.IN_valid(IN_valid),
.IN_state(IN_state),
.OUT_valid(SubBytes2AddRoundKey_valid),
.OUT_state(SubBytes2ShiftRows_state)
);

ShiftRows ShiftRows_inst(
.IN_state(SubBytes2ShiftRows_state),
.OUT_state(ShiftRows2MixColumns_state)
);

MixColumns MixColumns_inst(
.IN_state(ShiftRows2MixColumns_state),
.OUT_state(MixColumns2AddRoundKey_state)
);

AddRoundKey AddRoundKey_inst(
.clk(clk), 
.reset_n(reset_n),
.IN_valid(SubBytes2AddRoundKey_valid),
.IN_state(MixColumns2AddRoundKey_state),
.RoundKey(RoundKey),
.OUT_valid(OUT_valid),
.OUT_state(OUT_state)
);

endmodule
//=========================================================
// EOF Round
//=========================================================