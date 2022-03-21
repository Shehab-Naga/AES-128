`timescale 1 ns/1 ps

module AddRoundKey_tb;

reg clk;
reg reset_n;

reg         IN_valid;
reg [127:0] IN_state;
reg [127:0] RoundKey;

wire         OUT_valid;
wire [127:0] OUT_state;

AddRoundKey DUT(
    .clk(clk), 
    .reset_n(reset_n),
    .IN_valid(IN_valid),
    .IN_state(IN_state),
    .RoundKey(RoundKey),
    .OUT_valid(OUT_valid),
    .OUT_state(OUT_state)
);

// Clock period 
localparam PERIOD = 3.33;
// Clock 
always #(PERIOD/2) clk = ~clk;

initial begin
clk = 0;
reset_n = 0;
#(5.2*PERIOD) reset_n = 1;
#(2.2*PERIOD)   IN_valid = 1;
                IN_state = 128'h32_43_f6_a8_88_5a_30_8d_31_31_98_a2_e0_37_07_34;
                RoundKey = 128'h2b_7e_15_16_28_ae_d2_a6_ab_f7_15_88_09_cf_4f_3c;
#(0.5*PERIOD) $display("OUT_valid: %b \tOUT_state: %h", OUT_valid, OUT_state);
$finish;
end

endmodule
//=========================================================
// EOF AddRoundKey_tb
//=========================================================