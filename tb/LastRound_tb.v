`timescale 1 ns/1 ps

module LastRound_tb;

reg clk;
reg reset_n;

reg         IN_valid;
reg [127:0] IN_state;
reg [127:0] RoundKey;

wire         OUT_valid;
wire [127:0] OUT_state;

LastRound DUT(
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
#(5.2*PERIOD)   reset_n = 1;
#(2.2*PERIOD)   IN_valid = 1;
                IN_state = 128'hEB_40_F2_1E_59_2E_38_84_8B_A1_13_E7_1B_C3_42_D2;
                RoundKey = 128'hD0_14_F9_A8_C9_EE_25_89_E1_3F_0C_C8_B6_63_0C_A6;
#(0.5*PERIOD) $display("%b \t%h", OUT_valid, OUT_state);
#(1*PERIOD) $display("%b \t%h", OUT_valid, OUT_state);
$finish;
end
endmodule
//=========================================================
// EOF LastRound_tb
//=========================================================