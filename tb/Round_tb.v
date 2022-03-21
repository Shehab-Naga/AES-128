`timescale 1 ns/1 ps

module Round_tb;

reg clk;
reg reset_n;

reg         IN_valid;
reg [127:0] IN_state;
reg [127:0] RoundKey;

wire         OUT_valid;
wire [127:0] OUT_state;

Round DUT(
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
                IN_state = 128'h19_3D_E3_BE_A0_F4_E2_2B_9A_C6_8D_2A_E9_F8_48_08;
                RoundKey = 128'hA0_FA_FE_17_88_54_2C_B1_23_A3_39_39_2A_6C_76_05;
#(0.5*PERIOD) $display("OUT_valid: %b \tOUT_state: %h", OUT_valid, OUT_state);
#(1*PERIOD) $display("OUT_valid: %b \tOUT_state: %h", OUT_valid, OUT_state);
$finish;
end

endmodule
//=========================================================
// EOF Round_tb
//=========================================================