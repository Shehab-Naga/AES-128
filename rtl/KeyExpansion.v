/*
Project        : AES
Standard doc.  : 
Module name    : KeyExpansion block
Dependancy     :
Design doc.    : 
References     : 
Description    : KeyExpansion block is a sequential block that
                 expands the key with a rate of two cycles for 
                 each round after entering a valid key.
Owner          : Shehab Bahaa
*/

`timescale 1 ns/1 ps

module KeyExpansion (
input clk, 
input reset_n,

input         IN_valid,
input [127:0] key,	            // Key

output [127:0] RoundKey_1, RoundKey_2, RoundKey_3, RoundKey_4, RoundKey_5, 
               RoundKey_6, RoundKey_7, RoundKey_8, RoundKey_9, RoundKey_10
);

wire KeyRound1_valid, KeyRound2_valid, KeyRound3_valid, KeyRound4_valid, 
     KeyRound5_valid, KeyRound6_valid, KeyRound7_valid, KeyRound8_valid, KeyRound9_valid;

single_KeyExpansion #(.Rcon(32'h01000000)) KeyRound1(
.clk(clk), 
.reset_n(reset_n),
.IN_valid(IN_valid),
.key(key),
.OUT_valid(KeyRound1_valid),
.RoundKey(RoundKey_1)
);

single_KeyExpansion #(.Rcon(32'h02000000)) KeyRound2(
.clk(clk), 
.reset_n(reset_n),
.IN_valid(KeyRound1_valid),
.key(RoundKey_1),
.OUT_valid(KeyRound2_valid),
.RoundKey(RoundKey_2)
);

single_KeyExpansion #(.Rcon(32'h04000000)) KeyRound3(
.clk(clk), 
.reset_n(reset_n),
.IN_valid(KeyRound2_valid),
.key(RoundKey_2),
.OUT_valid(KeyRound3_valid),
.RoundKey(RoundKey_3)
);

single_KeyExpansion #(.Rcon(32'h08000000)) KeyRound4(
.clk(clk), 
.reset_n(reset_n),
.IN_valid(KeyRound3_valid),
.key(RoundKey_3),
.OUT_valid(KeyRound4_valid),
.RoundKey(RoundKey_4)
);

single_KeyExpansion #(.Rcon(32'h10000000)) KeyRound5(
.clk(clk), 
.reset_n(reset_n),
.IN_valid(KeyRound4_valid),
.key(RoundKey_4),
.OUT_valid(KeyRound5_valid),
.RoundKey(RoundKey_5)
);

single_KeyExpansion #(.Rcon(32'h20000000)) KeyRound6(
.clk(clk), 
.reset_n(reset_n),
.IN_valid(KeyRound5_valid),
.key(RoundKey_5),
.OUT_valid(KeyRound6_valid),
.RoundKey(RoundKey_6)
);

single_KeyExpansion #(.Rcon(32'h40000000)) KeyRound7(
.clk(clk), 
.reset_n(reset_n),
.IN_valid(KeyRound6_valid),
.key(RoundKey_6),
.OUT_valid(KeyRound7_valid),
.RoundKey(RoundKey_7)
);

single_KeyExpansion #(.Rcon(32'h80000000)) KeyRound8(
.clk(clk), 
.reset_n(reset_n),
.IN_valid(KeyRound7_valid),
.key(RoundKey_7),
.OUT_valid(KeyRound8_valid),
.RoundKey(RoundKey_8)
);

single_KeyExpansion #(.Rcon(32'h1b000000)) KeyRound9(
.clk(clk), 
.reset_n(reset_n),
.IN_valid(KeyRound8_valid),
.key(RoundKey_8),
.OUT_valid(KeyRound9_valid),
.RoundKey(RoundKey_9)
);

single_KeyExpansion #(.Rcon(32'h36000000)) KeyRound10(
.clk(clk), 
.reset_n(reset_n),
.IN_valid(KeyRound9_valid),
.key(RoundKey_9),
.OUT_valid(),
.RoundKey(RoundKey_10)
);

endmodule
//=========================================================
// EOF KeyExpansion
//=========================================================