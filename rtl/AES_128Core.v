/*
Project        : AES
Standard doc.  : 
Module name    : AES_128Core block
Dependancy     :
Design doc.    : 
References     : 
Description    : AES_128Core block is a sequential block that
                 performs the full algorithm.
Owner          : Shehab Bahaa
*/

`timescale 1 ns/1 ps

`include "single_KeyExpansion.v"
`include "KeyExpansion.v"
`include "SBox.v"
`include "SubBytes.v"
`include "ShiftRows.v"
`include "MixColumns.v"
`include "AddRoundKey.v"
`include "Round.v"
`include "LastRound.v"

module AES_128Core (
input clk,                      // Clock
input reset_n,                  // asynchronous active-low reset

input         IN_valid,               // enable for valid inputs
input [127:0] IN_state,            // Plaintext
input [127:0] key,	            // Key

output         OUT_valid,       // valid outputs
output [127:0] OUT_state    	// Ciphertext
);

wire AddRoundKey_valid, Round_inst1_valid, Round_inst2_valid, Round_inst3_valid, Round_inst4_valid, Round_inst5_valid,
     Round_inst6_valid, Round_inst7_valid, Round_inst8_valid, Round_inst9_valid;
wire [127:0] AddRoundKey_state, Round_inst1_state, Round_inst2_state, Round_inst3_state, Round_inst4_state, Round_inst5_state,
             Round_inst6_state, Round_inst7_state, Round_inst8_state, Round_inst9_state;
wire [127:0] RoundKey_1, RoundKey_2, RoundKey_3, RoundKey_4, RoundKey_5, 
             RoundKey_6, RoundKey_7, RoundKey_8, RoundKey_9, RoundKey_10;

AddRoundKey     AddRoundKey_inst(
.clk(clk), 
.reset_n(reset_n),
.IN_valid(IN_valid),
.IN_state(IN_state),
.RoundKey(key),
.OUT_valid(AddRoundKey_valid),
.OUT_state(AddRoundKey_state)
);
KeyExpansion    KeyExpansion_inst(
.clk(clk), 
.reset_n(reset_n),
.IN_valid(IN_valid),
.key(key),
.RoundKey_1(RoundKey_1), 
.RoundKey_2(RoundKey_2), 
.RoundKey_3(RoundKey_3), 
.RoundKey_4(RoundKey_4), 
.RoundKey_5(RoundKey_5), 
.RoundKey_6(RoundKey_6), 
.RoundKey_7(RoundKey_7), 
.RoundKey_8(RoundKey_8), 
.RoundKey_9(RoundKey_9), 
.RoundKey_10(RoundKey_10)
);
Round           Round_inst1(
.clk(clk), 
.reset_n(reset_n),
.IN_valid(AddRoundKey_valid),
.IN_state(AddRoundKey_state),
.RoundKey(RoundKey_1),
.OUT_valid(Round_inst1_valid),
.OUT_state(Round_inst1_state)
);
Round           Round_inst2(
.clk(clk), 
.reset_n(reset_n),
.IN_valid(Round_inst1_valid),
.IN_state(Round_inst1_state),
.RoundKey(RoundKey_2),
.OUT_valid(Round_inst2_valid),
.OUT_state(Round_inst2_state)
);
Round           Round_inst3(
.clk(clk), 
.reset_n(reset_n),
.IN_valid(Round_inst2_valid),
.IN_state(Round_inst2_state),
.RoundKey(RoundKey_3),
.OUT_valid(Round_inst3_valid),
.OUT_state(Round_inst3_state)
);
Round           Round_inst4(
.clk(clk), 
.reset_n(reset_n),
.IN_valid(Round_inst3_valid),
.IN_state(Round_inst3_state),
.RoundKey(RoundKey_4),
.OUT_valid(Round_inst4_valid),
.OUT_state(Round_inst4_state)
);
Round           Round_inst5(
.clk(clk), 
.reset_n(reset_n),
.IN_valid(Round_inst4_valid),
.IN_state(Round_inst4_state),
.RoundKey(RoundKey_5),
.OUT_valid(Round_inst5_valid),
.OUT_state(Round_inst5_state)
);
Round           Round_inst6(
.clk(clk), 
.reset_n(reset_n),
.IN_valid(Round_inst5_valid),
.IN_state(Round_inst5_state),
.RoundKey(RoundKey_6),
.OUT_valid(Round_inst6_valid),
.OUT_state(Round_inst6_state)
);
Round           Round_inst7(
.clk(clk), 
.reset_n(reset_n),
.IN_valid(Round_inst6_valid),
.IN_state(Round_inst6_state),
.RoundKey(RoundKey_7),
.OUT_valid(Round_inst7_valid),
.OUT_state(Round_inst7_state)
);
Round           Round_inst8(
.clk(clk), 
.reset_n(reset_n),
.IN_valid(Round_inst7_valid),
.IN_state(Round_inst7_state),
.RoundKey(RoundKey_8),
.OUT_valid(Round_inst8_valid),
.OUT_state(Round_inst8_state)
);
Round           Round_inst9(
.clk(clk), 
.reset_n(reset_n),
.IN_valid(Round_inst8_valid),
.IN_state(Round_inst8_state),
.RoundKey(RoundKey_9),
.OUT_valid(Round_inst9_valid),
.OUT_state(Round_inst9_state)
);
LastRound       LastRound_inst(
.clk(clk), 
.reset_n(reset_n),
.IN_valid(Round_inst9_valid),
.IN_state(Round_inst9_state),
.RoundKey(RoundKey_10),
.OUT_valid(OUT_valid),
.OUT_state(OUT_state)
); 

endmodule
//=========================================================
// EOF AES_128Core
//=========================================================