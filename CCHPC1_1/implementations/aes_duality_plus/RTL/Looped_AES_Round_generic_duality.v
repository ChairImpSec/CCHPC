module Looped_AES_Round_generic_duality #(
    parameter security_order   = 1,
    parameter FORWARD_R        = 0,
    parameter wAOI22_linear    = 1,
    parameter wAOI22_nonlinear = 0,
    parameter ALIGN_OUT        = 0
)(
    clk, rst, r_SR, r_duality0, r_duality1, plaintext, key, ciphertext, done_layer0, prch0_o, prch1_o
);
    localparam integer d = security_order+1;

    localparam integer SBOX_COUNT_ROUND = 16;
    localparam integer SBOX_COUNT_KEY   = 4;
    localparam integer SBOX_COUNT       = SBOX_COUNT_ROUND + SBOX_COUNT_KEY;

    localparam integer nonlinear_count_DRtDR = 15;
    localparam integer nonlinear_count_DRtSR = 18;

    localparam integer RAND_COUNT        = (d*(d-1))/2;
    localparam integer RAND_COUNT_CONSEC = ((d-1)*(d-2))/2;

    localparam integer RAND_WIDTH_SR_SBOX = nonlinear_count_DRtDR*(d-1) + nonlinear_count_DRtSR*RAND_COUNT;
    localparam integer RAND_WIDTH_DR_SBOX = (RAND_COUNT_CONSEC > 0) ? nonlinear_count_DRtDR*2*RAND_COUNT_CONSEC : 2;

    localparam integer RAND_WIDTH_SR = SBOX_COUNT*RAND_WIDTH_SR_SBOX;
    localparam integer RAND_WIDTH_DR = SBOX_COUNT*RAND_WIDTH_DR_SBOX;

    input clk;
    input rst;
    input [RAND_WIDTH_SR-1:0] r_SR;
    input [RAND_WIDTH_DR-1:0] r_duality0;
    input [RAND_WIDTH_DR-1:0] r_duality1;
    input [128*d-1:0] plaintext;
    input [128*d-1:0] key;

    output [128*d-1:0] ciphertext;
    output done_layer0;
    output [d-2:0] prch0_o;
    output [d-2:0] prch1_o;


    // -------------------------------------------------------------------------
    // Control
    // -------------------------------------------------------------------------

    wire [d-2:0] prch0;
    wire [d-2:0] prch1;
    wire [d-1:0] sel;
    wire [d-1:0] MCsel;
    wire [7:0] Rcon;

    AES_controller_CCHPC1_1_generic_duality #(.security_order(security_order)) Controller_inst (.clk(clk), .rst(rst), .prch0(prch0), .prch1(prch1), .sel(sel), .MCsel(MCsel), .Rcon(Rcon), .done_layer0(done_layer0));

    assign prch0_o = prch0;
    assign prch1_o = prch1;


    // -------------------------------------------------------------------------
    // Round function signals
    // -------------------------------------------------------------------------

    wire [128*d-1:0] roundOutput;
    wire [128*d-1:0] roundInput;
    wire [128*d-1:0] roundKey;
    wire [128*d-1:0] keyXORed;
    wire [128*d-1:0] bytesSubstituted;
    wire [128*d-1:0] rowsShifted;
    wire [128*d-1:0] columnsMixed;
    wire [128*d-1:0] ciphertext_raw;

    assign ciphertext_raw = keyXORed;


    // -------------------------------------------------------------------------
    // Round input selection
    // -------------------------------------------------------------------------

    genvar i, j;
    generate
        for (i = 0; i < 128; i=i+1) begin : gen_input_mux_
            for (j = 0; j < d; j=j+1) begin : gen_input_mux_share_

                assign roundInput[d*i+j] = sel[j] ? plaintext[d*i+j] : roundOutput[d*i+j];

            end
        end
    endgenerate


    // -------------------------------------------------------------------------
    // AddRoundKey
    // -------------------------------------------------------------------------

    generate
        for (i = 0; i < 128; i=i+1) begin : gen_key_xor_

            linear_CCHPC1_1_generic_SRtSR #(.security_order(security_order), .CONF(1'b0)) keyXOR_inst (.a(roundInput[d*i +: d]), .b(roundKey[d*i +: d]), .z(keyXORed[d*i +: d]));

        end
    endgenerate


    // -------------------------------------------------------------------------
    // SubBytes
    // -------------------------------------------------------------------------

    generate
        for (i = 0; i < SBOX_COUNT_ROUND; i=i+1) begin : gen_sbox_

            wire [8*d-1:0] unused_z_keyschedule;

            Sbox_BP_impr_generic_duality_reg #(.security_order(security_order), .FORWARD_R(FORWARD_R), .wAOI22_linear(wAOI22_linear), .wAOI22_nonlinear(wAOI22_nonlinear), .MoveInputREG(1'b1), .isKeySchedule(1'b0)) SBox_inst (.clk(clk), .prch0(prch0), .prch1(prch1), .r_SR(r_SR[i*RAND_WIDTH_SR_SBOX +: RAND_WIDTH_SR_SBOX]), .r_duality0(r_duality0[i*RAND_WIDTH_DR_SBOX +: RAND_WIDTH_DR_SBOX]), .r_duality1(r_duality1[i*RAND_WIDTH_DR_SBOX +: RAND_WIDTH_DR_SBOX]), .a(keyXORed[i*8*d +: 8*d]), .z(bytesSubstituted[i*8*d +: 8*d]), .z_keyschedule(unused_z_keyschedule));

        end
    endgenerate


    // -------------------------------------------------------------------------
    // ShiftRows
    // -------------------------------------------------------------------------

    assign rowsShifted[128*d-1:120*d] = bytesSubstituted[128*d-1:120*d]; //  0 ->  0
    assign rowsShifted[120*d-1:112*d] = bytesSubstituted[ 88*d-1: 80*d]; //  1 ->  5
    assign rowsShifted[112*d-1:104*d] = bytesSubstituted[ 48*d-1: 40*d]; //  2 -> 10
    assign rowsShifted[104*d-1: 96*d] = bytesSubstituted[  8*d-1:  0*d]; //  3 -> 15
    assign rowsShifted[ 96*d-1: 88*d] = bytesSubstituted[ 96*d-1: 88*d]; //  4 ->  4
    assign rowsShifted[ 88*d-1: 80*d] = bytesSubstituted[ 56*d-1: 48*d]; //  5 ->  9
    assign rowsShifted[ 80*d-1: 72*d] = bytesSubstituted[ 16*d-1:  8*d]; //  6 -> 14
    assign rowsShifted[ 72*d-1: 64*d] = bytesSubstituted[104*d-1: 96*d]; //  7 ->  3
    assign rowsShifted[ 64*d-1: 56*d] = bytesSubstituted[ 64*d-1: 56*d]; //  8 ->  8
    assign rowsShifted[ 56*d-1: 48*d] = bytesSubstituted[ 24*d-1: 16*d]; //  9 -> 13
    assign rowsShifted[ 48*d-1: 40*d] = bytesSubstituted[112*d-1:104*d]; // 10 ->  2
    assign rowsShifted[ 40*d-1: 32*d] = bytesSubstituted[ 72*d-1: 64*d]; // 11 ->  7
    assign rowsShifted[ 32*d-1: 24*d] = bytesSubstituted[ 32*d-1: 24*d]; // 12 -> 12
    assign rowsShifted[ 24*d-1: 16*d] = bytesSubstituted[120*d-1:112*d]; // 13 ->  1
    assign rowsShifted[ 16*d-1:  8*d] = bytesSubstituted[ 80*d-1: 72*d]; // 14 ->  6
    assign rowsShifted[  8*d-1:  0*d] = bytesSubstituted[ 40*d-1: 32*d]; // 15 -> 11


    // -------------------------------------------------------------------------
    // MixColumns
    // -------------------------------------------------------------------------

    generate
        for (i = 0; i < 4; i=i+1) begin : gen_mix_column_

            AES_mixOneColumn_generic #(.security_order(security_order)) MixOneColumn_inst (.a(rowsShifted[i*32*d +: 32*d]), .z(columnsMixed[i*32*d +: 32*d]));

        end
    endgenerate


    // -------------------------------------------------------------------------
    // Final-round MixColumns selection
    // -------------------------------------------------------------------------

    generate
        for (i = 0; i < 128; i=i+1) begin : gen_mixcolumns_mux_
            for (j = 0; j < d; j=j+1) begin : gen_mixcolumns_mux_share_

                assign roundOutput[d*i+j] = MCsel[j] ? rowsShifted[d*i+j] : columnsMixed[d*i+j];

            end
        end
    endgenerate


    // -------------------------------------------------------------------------
    // Key schedule
    // -------------------------------------------------------------------------

    AES_keySchedule_generic_duality #(.security_order(security_order), .FORWARD_R(FORWARD_R), .wAOI22_linear(wAOI22_linear), .wAOI22_nonlinear(wAOI22_nonlinear)) KeySchedule_inst (.clk(clk), .sel(sel), .prch0(prch0), .prch1(prch1), .r_SR(r_SR[SBOX_COUNT_ROUND*RAND_WIDTH_SR_SBOX +: SBOX_COUNT_KEY*RAND_WIDTH_SR_SBOX]), .r_duality0(r_duality0[SBOX_COUNT_ROUND*RAND_WIDTH_DR_SBOX +: SBOX_COUNT_KEY*RAND_WIDTH_DR_SBOX]), .r_duality1(r_duality1[SBOX_COUNT_ROUND*RAND_WIDTH_DR_SBOX +: SBOX_COUNT_KEY*RAND_WIDTH_DR_SBOX]), .Rcon(Rcon), .key(key), .roundKey(roundKey));


    // -------------------------------------------------------------------------
    // Optional primary-output alignment
    // -------------------------------------------------------------------------

    generate
        if (ALIGN_OUT == 1) begin : gen_output_alignment_

            for (i = 0; i < 128; i=i+1) begin : gen_output_bit_

                localparam integer DELAY_SHARE0 = d-2;
                wire [DELAY_SHARE0:0] ciphertext_pipe_share0;

                REG_pipeline_vec #(.depth(DELAY_SHARE0)) reg_pipeline_ciphertext_share0_inst (.clk(clk), .a(ciphertext_raw[i*d]), .z(ciphertext_pipe_share0));
                assign ciphertext[i*d] = ciphertext_pipe_share0[DELAY_SHARE0];

                for (j = 1; j < d; j=j+1) begin : gen_output_share_

                    localparam integer DELAY = d-1-j;
                    wire [DELAY:0] ciphertext_pipe;

                    REG_pipeline_vec #(.depth(DELAY)) reg_pipeline_ciphertext_inst (.clk(clk), .a(ciphertext_raw[i*d+j]), .z(ciphertext_pipe));
                    assign ciphertext[i*d+j] = ciphertext_pipe[DELAY];

                end
            end

        end else begin : gen_no_output_alignment_

            assign ciphertext = ciphertext_raw;

        end
    endgenerate

endmodule

