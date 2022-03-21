# AES-128
Overview
This project is an RTL-based implementation of AES with a 128-bits key. It uses
ten rounds for 128-bit keys as shown in figure (1). Each round comprises a series
of operations as follows:
  ● Byte substitution
  ● Rows shifting
  ● Matrix multiplication
  ● Adding with a key specific for each round
An important required specification was to achieve a latency of 21 clock cycles,
i.e., the core provides a valid ciphertext after 21 clock cycles from asserting valid
state and key. To achieve this specification, the latency of each block is as follows:
  ● The latency of the pre-round transformation is one clock cycle.
  ● The latency of each round is two clock cycles. Moreover, inside each round
  block:
      ○ SubBytes block is sequential with one clock cycle latency.
      ○ ShiftRows block is combinational.
      ○ MixColumns is combinational
      ○ AddRoundKey is sequential with one clock cycle latency.
In parallel with these blocks, The keyExpansion block is sequential and produces
the round key with a rate of one round key per two cycles.
