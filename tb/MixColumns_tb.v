`timescale 1 ns/1 ps

module MixColumns_tb;

reg [127:0] IN_state;

wire [127:0] OUT_state;

MixColumns DUT(
    .IN_state(IN_state),

    .OUT_state(OUT_state)
);


initial begin
    IN_state = 128'h87_6E_46_A6_F2_4C_E7_8C_4D_90_4A_D8_97_EC_C3_95;
    $display("OUT_state: %h", OUT_state);
$finish;
end

endmodule
