/*
Project        : AES
Standard doc.  : 
Module name    : single_KeyExpansion block
Dependancy     :
Design doc.    : 
References     : 
Description    : single_KeyExpansion block is a sequential block that
                 expands the key for a certain round after two cycles 
                 from entering a valid key.
Owner          : Shehab Bahaa
*/

`timescale 1 ns/1 ps

module single_KeyExpansion #(parameter Rcon=32'h01000000) (
input clk, 
input reset_n,

input         IN_valid,
input [127:0] key,	            // Key

output reg     OUT_valid,
output reg [127:0] RoundKey
);

reg [31:0] RotWord;
wire [31:0] SBOX_out;
reg [31:0] temp1, temp2, temp3, temp4;

always @(key)
   RotWord = {key[23 -:8], key[15 -:8], key[7 -:8], key[31 -:8]};

genvar i;
generate
for (i = 0; i < 4; i = i +1) begin
    SBox SBox_inst(
        .clk(clk), 
        .reset(reset_n), 
        .valid_in(IN_valid), 
        .addr(RotWord[(31-i*8) -:8]), 
        .dout(SBOX_out[(31-i*8) -:8])
        );
end
endgenerate

always @(posedge clk or negedge reset_n)
begin 
   if (!reset_n) begin
      OUT_valid <= 0;
   end else begin
      if (IN_valid) begin 
         temp1 = key[127 -:32] ^ SBOX_out ^ Rcon;
         temp2 = temp1 ^ key[95 -:32];
         temp3 = temp2 ^ key[63 -:32];
         temp4 = temp3 ^ key[31 -:32]; 
         RoundKey <= {temp1, temp2, temp3, temp4};
         OUT_valid <= 1;
      end else OUT_valid <= 0;
   end
   
end

endmodule
//=========================================================
// EOF single_KeyExpansion
//=========================================================