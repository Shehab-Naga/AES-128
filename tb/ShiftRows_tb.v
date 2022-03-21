`timescale 1 ns/1 ps

module ShiftRows_tb;

reg [127:0] IN_state;

wire [127:0] OUT_state;

ShiftRows DUT(
    .IN_state(IN_state),

    .OUT_state(OUT_state)
);


initial begin
    IN_state = 128'h87_EC_4A_8C_F2_6E_C3_D8_4D_4C_46_95_97_90_E7_A6;
    $display("OUT_state: %h", OUT_state);
$finish;
end

endmodule


