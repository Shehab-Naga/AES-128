
`timescale 1 ns/1 ps

module single_KeyExpansion_tb;

reg clk;
reg reset_n;

reg         IN_valid;
reg [127:0] key;	            // Key

wire         OUT_valid;
wire [127:0] RoundKey;

single_KeyExpansion DUT(
.clk(clk),
.reset_n(reset_n),
.IN_valid(IN_valid),
.key(key),
.OUT_valid(OUT_valid),
.RoundKey(RoundKey)
);

// Clock period 
localparam PERIOD = 3.33;
// Clock 
always #(PERIOD/2) clk = ~clk;

initial begin
clk = 0;
reset_n = 0;
#(5.2*PERIOD)   reset_n = 1;
#(2.2*PERIOD)   IN_valid = 1;
                key = 128'h2b_7e_15_16_28_ae_d2_a6_ab_f7_15_88_09_cf_4f_3c;
#(1.5*PERIOD) $display("OUT_valid: %b \tRoundKey: %h", OUT_valid, RoundKey);
#(100*PERIOD)
$finish;
end
endmodule
//=========================================================
// EOF single_KeyExpansion_tb
//=========================================================