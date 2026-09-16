module AES_keySchedule_generic_duality #(
    parameter security_order   = 1,
    parameter FORWARD_R        = 0,
    parameter wAOI22_linear    = 0,
    parameter wAOI22_nonlinear = 1
)(
    clk, sel, prch0, prch1, r_SR, r_duality0, r_duality1, Rcon, key, roundKey
);
    localparam integer d = security_order+1;

    localparam integer SBOX_COUNT = 4;
    localparam integer nonlinear_count_DRtDR = 15;
    localparam integer nonlinear_count_DRtSR = 18;

    localparam integer RAND_COUNT        = (d*(d-1))/2;
    localparam integer RAND_COUNT_CONSEC = ((d-1)*(d-2))/2;

    localparam integer RAND_WIDTH_SR_SBOX = nonlinear_count_DRtDR*(d-1) + nonlinear_count_DRtSR*RAND_COUNT;
    localparam integer RAND_WIDTH_DR_SBOX = (RAND_COUNT_CONSEC > 0) ? nonlinear_count_DRtDR*2*RAND_COUNT_CONSEC : 2;

    localparam integer RAND_WIDTH_SR = SBOX_COUNT*RAND_WIDTH_SR_SBOX;
    localparam integer RAND_WIDTH_DR = SBOX_COUNT*RAND_WIDTH_DR_SBOX;

    input clk;
    input [d-1:0] sel;
    input [d-2:0] prch0;
    input [d-2:0] prch1;
    input [RAND_WIDTH_SR-1:0] r_SR;
    input [RAND_WIDTH_DR-1:0] r_duality0;
    input [RAND_WIDTH_DR-1:0] r_duality1;
    input [7:0] Rcon;
    input [128*d-1:0] key;

    output [128*d-1:0] roundKey;


    // -------------------------------------------------------------------------
    // Signals
    // -------------------------------------------------------------------------

    wire [128*d-1:0] keyRoundInput;
    wire [128*d-1:0] keyRoundInput_reg;
    wire [128*d-1:0] keyRoundOutput;
    wire [128*d-1:0] keyRoundOutput_reg;
    wire [ 32*d-1:0] keyBytesSubstituted;
    wire [ 32*d-1:0] keyRconXORed;

    assign roundKey = keyRoundInput;


    // -------------------------------------------------------------------------
    // Key-schedule input selection
    // -------------------------------------------------------------------------

    genvar i, j;
    generate
        for (i = 0; i < 128; i=i+1) begin : gen_input_mux_
            for (j = 0; j < d; j=j+1) begin : gen_input_mux_share_

                assign keyRoundInput[d*i+j] = sel[j] ? key[d*i+j] : keyRoundOutput_reg[d*i+j];

            end
        end
    endgenerate


    // -------------------------------------------------------------------------
    // State register and SubBytes
    // -------------------------------------------------------------------------

    generate
        for (i = 0; i < SBOX_COUNT; i=i+1) begin : gen_sbox_

            Sbox_BP_impr_generic_duality_reg #(.security_order(security_order), .FORWARD_R(FORWARD_R), .wAOI22_linear(wAOI22_linear), .wAOI22_nonlinear(wAOI22_nonlinear), .MoveInputREG(1'b0), .isKeySchedule(1'b1)) SBox_inst (.clk(clk), .prch0(prch0), .prch1(prch1), .r_SR(r_SR[i*RAND_WIDTH_SR_SBOX +: RAND_WIDTH_SR_SBOX]), .r_duality0(r_duality0[i*RAND_WIDTH_DR_SBOX +: RAND_WIDTH_DR_SBOX]), .r_duality1(r_duality1[i*RAND_WIDTH_DR_SBOX +: RAND_WIDTH_DR_SBOX]), .a(keyRoundInput[i*8*d +: 8*d]), .z(keyBytesSubstituted[i*8*d +: 8*d]), .z_keyschedule(keyRoundInput_reg[i*8*d +: 8*d]));

        end

        for (i = 32; i < 128; i=i+1) begin : gen_state_reg_

            assign keyRoundInput_reg[i*d] = keyRoundInput[i*d];
            REG #(.WIDTH(d-1)) REG_inst (.clk(clk), .d(keyRoundInput[i*d+1 +: d-1]), .q(keyRoundInput_reg[i*d+1 +: d-1]));

        end
    endgenerate


    // -------------------------------------------------------------------------
    // Round constant and RotWord
    // -------------------------------------------------------------------------

    // Rcon is unshared and is therefore XORed into share 0 only.
    assign keyRconXORed[d*24-1:d*16] = keyBytesSubstituted[d*16-1:d*8];
    assign keyRconXORed[d*16-1:d*8]  = keyBytesSubstituted[d*8-1:0];
    assign keyRconXORed[d*8-1:0]     = keyBytesSubstituted[d*32-1:d*24];

    generate
        for (i = 0; i < 8; i=i+1) begin : gen_rcon_xor_

            XOR2 XOR_Rcon_inst (.a(keyBytesSubstituted[d*(i+16)]), .b(Rcon[i]), .z(keyRconXORed[d*(i+24)]));
            assign keyRconXORed[d*(i+24)+1 +: d-1] = keyBytesSubstituted[d*(i+16)+1 +: d-1];

        end
    endgenerate


    // -------------------------------------------------------------------------
    // Word XORs
    // -------------------------------------------------------------------------

    generate
        for (i = 0; i < 32; i=i+1) begin : gen_word_xor_

            linear_CCHPC1_1_generic_SRtSR #(.security_order(security_order), .CONF(1'b0)) XOR_inst0 (.a(keyRoundInput_reg[d*(i+96) +: d]), .b(keyRconXORed[d*i +: d]), .z(keyRoundOutput[d*(i+96) +: d]));
            linear_CCHPC1_1_generic_SRtSR #(.security_order(security_order), .CONF(1'b0)) XOR_inst1 (.a(keyRoundInput_reg[d*(i+64) +: d]), .b(keyRoundOutput[d*(i+96) +: d]), .z(keyRoundOutput[d*(i+64) +: d]));
            linear_CCHPC1_1_generic_SRtSR #(.security_order(security_order), .CONF(1'b0)) XOR_inst2 (.a(keyRoundInput_reg[d*(i+32) +: d]), .b(keyRoundOutput[d*(i+64) +: d]), .z(keyRoundOutput[d*(i+32) +: d]));
            linear_CCHPC1_1_generic_SRtSR #(.security_order(security_order), .CONF(1'b0)) XOR_inst3 (.a(keyRoundInput_reg[d*i +: d]), .b(keyRoundOutput[d*(i+32) +: d]), .z(keyRoundOutput[d*i +: d]));

        end
    endgenerate


    // -------------------------------------------------------------------------
    // Layer-0 round-state register
    // -------------------------------------------------------------------------

    generate
        for (i = 0; i < 128; i=i+1) begin : gen_state_reg_layer0_

            REG #(.WIDTH(1)) REG_inst (.clk(clk), .d(keyRoundOutput[i*d]), .q(keyRoundOutput_reg[i*d]));
            assign keyRoundOutput_reg[i*d+1 +: d-1] = keyRoundOutput[i*d+1 +: d-1];

        end
    endgenerate

endmodule

