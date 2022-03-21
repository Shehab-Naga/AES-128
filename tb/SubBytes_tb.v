`timescale 1 ns/1 ps

module SubBytes_tb;

reg clk;
reg reset_n;

reg IN_valid;
reg [127:0] IN_state;

wire          OUT_valid;
wire [127:0] OUT_state;

SubBytes DUT(
    .clk(clk), 
    .reset_n(reset_n),
    .IN_valid(IN_valid),
    .IN_state(IN_state),
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
                IN_state = 128'hEA_83_5C_F0_04_45_33_2D_65_5D_98_AD_85_96_B0_C5;
#(0.5*PERIOD) $display("OUT_valid: %b \tOUT_state: %h", OUT_valid, OUT_state);
$finish;
end

endmodule

