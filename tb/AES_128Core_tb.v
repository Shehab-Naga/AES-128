`timescale 1 ns/1 ps

module AES_128Core_tb;

reg clk;
reg reset_n;

reg         IN_valid;
reg [127:0] IN_state;
reg [127:0] key;

wire         OUT_valid;
wire [127:0] OUT_state;

AES_128Core DUT(
    .clk(clk), 
    .reset_n(reset_n),
    .IN_valid(IN_valid),
    .IN_state(IN_state),
    .key(key),
    .OUT_valid(OUT_valid),
    .OUT_state(OUT_state)
);

// Clock period 
localparam PERIOD = 3.33;
// Clock 
always #(PERIOD/2) clk = ~clk;

initial begin
// $display ("time \t");
// $monitor ()
clk = 0;
reset_n = 0;
#(5.2*PERIOD)   reset_n = 1;
#(2.2*PERIOD)   IN_valid = 1;
                IN_state = 128'h32_43_F6_A8_88_5A_30_8D_31_31_98_A2_E0_37_07_34;
                key = 128'h2b_7e_15_16_28_ae_d2_a6_ab_f7_15_88_09_cf_4f_3c;
//                IN_state = 128'h9798c4640bad75c7c3227db910174e72;
//                key = 128'h00000000000000000000000000000000;

#(19.5*PERIOD) $display("%b \t%h", OUT_valid, OUT_state);
#(1*PERIOD) $display("%b \t%h", OUT_valid, OUT_state);
$finish;
end

endmodule
//=========================================================
// EOF AES_128Core_tb
//=========================================================