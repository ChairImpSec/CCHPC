// BP_impr AES S-box implemented with generic-order CCHPC1.1 gadgets in duality.
// The register placement follows the original optimized BP_impr S-box architecture.
module Sbox_BP_impr_generic_duality_reg #(
    parameter security_order   = 1,
    parameter FORWARD_R        = 0,
    parameter wAOI22_linear    = 1,
    parameter wAOI22_nonlinear = 0,
    parameter MoveInputREG     = 1,
    parameter isKeySchedule = 0
)(
    clk, prch0, prch1, r_SR, r_duality0, r_duality1, a, z, z_keyschedule
);
    parameter integer d = security_order+1;

    localparam integer nonlinear_count_DRtDR = 15;
    localparam integer nonlinear_count_DRtSR = 18;

    localparam integer RAND_COUNT             = (d*(d-1))/2;
    localparam integer RAND_COUNT_CONSEC      = ((d-1)*(d-2))/2;
    localparam integer RAND_COUNT_CONSEC_SAFE = (RAND_COUNT_CONSEC > 0) ? RAND_COUNT_CONSEC : 1;

    localparam integer RAND_SR_DRtDR_WIDTH  = nonlinear_count_DRtDR*(d-1);
    localparam integer RAND_WIDTH_SR        = RAND_SR_DRtDR_WIDTH + nonlinear_count_DRtSR*RAND_COUNT;
    localparam integer RAND_DR_GADGET_WIDTH = 2*RAND_COUNT_CONSEC_SAFE;
    localparam integer RAND_DR_STRIDE       = (RAND_COUNT_CONSEC > 0) ? RAND_DR_GADGET_WIDTH : 0;
    localparam integer RAND_WIDTH_DR        = (RAND_COUNT_CONSEC > 0) ? nonlinear_count_DRtDR*RAND_DR_GADGET_WIDTH : 2;


    input clk;
    input [d-2:0] prch0;
    input [d-2:0] prch1;

    // Randomness layout:
    // - r_SR first contains 15 non-overlapping (d-1)-bit slices for the DRtDR
    //   gadgets, followed by 18 non-overlapping RAND_COUNT-bit DRtSR slices.
    // - r_duality0/1 contain one non-overlapping consecutive-randomness slice
    //   per DRtDR gadget. At first security order RAND_DR_STRIDE is zero, so
    //   all DRtDR gadgets receive the same 2-bit dummy input.
    input [RAND_WIDTH_SR-1:0] r_SR;
    input [RAND_WIDTH_DR-1:0] r_duality0;
    input [RAND_WIDTH_DR-1:0] r_duality1;

    input  [8*d-1:0] a;
    output [8*d-1:0] z;
    output [8*d-1:0] z_keyschedule;


    // -------------------------------------------------------------------------
    // -- Intermediates
    // -------------------------------------------------------------------------

    wire [d-1:0] sboxOutput     [7:0]; // single-rail
    wire [d-1:0] sboxOutput_reg [7:0]; // single-rail

    wire				 			sboxInput_reg  [7:0]; // single-rail layer0
    wire [2*(d-1):1] 	sboxInput0_reg [7:0]; // dual-rail duality instance 0
    wire [2*(d-1):1] 	sboxInput1_reg [7:0]; // dual-rail duality instance 1

    wire             t  [27:1]; // single-rail layer0
    wire [2*(d-1):1] t0 [27:1]; // dual-rail duality instance 0
    wire [2*(d-1):1] t1 [27:1]; // dual-rail duality instance 1

    wire [d-1:0] t5_SR2DR; // single-rail logic preceding non-linear parts

    wire             m  [23:1]; // single-rail layer0
    wire [2*(d-1):1] m0 [23:1]; // dual-rail duality instance 0
    wire [2*(d-1):1] m1 [23:1]; // dual-rail duality instance 1

    wire             m_post  [45:37]; // single-rail layer0
    wire [2*(d-1):1] m_post0 [45:37]; // dual-rail duality instance 0
    wire [2*(d-1):1] m_post1 [45:37]; // dual-rail duality instance 1

    wire [d-1:0] m_merged [63:46]; // single-rail output of DRtSR gadgets
    wire [d-1:0] l [29:0];         // single-rail


    // -------------------------------------------------------------------------
    // -- Round State Register
    // -------------------------------------------------------------------------

    genvar i, j;
    generate
        for (i = 0; i < 8; i=i+1) begin : loop_round_state_reg

            // IO Mapping
            assign z[d*(i+1)-1:d*i] = sboxOutput_reg[i];
            assign sboxOutput_reg[i][d-1:1] = sboxOutput[i][d-1:1];

            // Round State Register
            if ((MoveInputREG == 1) && (isKeySchedule != 1)) begin : gen_round_state_reg_sbox_inputs // exclude linear gadgets that can be implemented in single-rail before the round register

                assign z_keyschedule[d*(i+1)-1:d*i] = {d{1'b0}};

                if (i != 3) begin : gen_round_state_reg_sbox_inputs_opt

                    wire [2*(d-1):1] sboxInput0_ctrl;
                    wire [2*(d-1):1] sboxInput1_ctrl;

                    for (j = 0; j < (d-1); j=j+1) begin : gen_round_state_reg_sbox_inputs_opt_layer

                        wire input_inv;

                        INV not_inst (.a(a[i*d+j+1]), .z(input_inv));

                        NOR2 ctrl_t0_t_inst0 (.a(input_inv),    .b(prch0[j]), .z(sboxInput0_ctrl[2*j+1]));
                        NOR2 ctrl_t0_f_inst0 (.a(a[i*d+j+1]), .b(prch0[j]), .z(sboxInput0_ctrl[2*j+2]));
                        NOR2 ctrl_t1_t_inst0 (.a(input_inv),    .b(prch1[j]), .z(sboxInput1_ctrl[2*j+1]));
                        NOR2 ctrl_t1_f_inst0 (.a(a[i*d+j+1]), .b(prch1[j]), .z(sboxInput1_ctrl[2*j+2]));

                    end

                    assign sboxInput_reg[i] = a[i*d];

                    REG #(.WIDTH(2*(d-1))) reg_consecutive_0_inst (.clk(clk), .d(sboxInput0_ctrl), .q(sboxInput0_reg[i]));
                    REG #(.WIDTH(2*(d-1))) reg_consecutive_1_inst (.clk(clk), .d(sboxInput1_ctrl), .q(sboxInput1_reg[i]));

                    REG #(.WIDTH(1)) reg_layer0_inst (.clk(clk), .d(sboxOutput[i][0]), .q(sboxOutput_reg[i][0])); // share 0 state register after non-linear part to decrease total latency by 1

                end else begin: gen_round_state_reg_intermediate_inputs

                    wire [2*(d-1):1] t5_0_ctrl;
                    wire [2*(d-1):1] t5_1_ctrl;

                    for (j = 0; j < (d-1); j=j+1) begin : gen_round_state_reg_intermediate_inputs_layer

                        wire t5_inv;

                        INV not_inst (.a(t5_SR2DR[j+1]), .z(t5_inv));

                        NOR2 ctrl_t0_t_inst0 (.a(t5_inv),       .b(prch0[j]), .z(t5_0_ctrl[2*j+1]));
                        NOR2 ctrl_t0_f_inst0 (.a(t5_SR2DR[j+1]), .b(prch0[j]), .z(t5_0_ctrl[2*j+2]));
                        NOR2 ctrl_t1_t_inst0 (.a(t5_inv),       .b(prch1[j]), .z(t5_1_ctrl[2*j+1]));
                        NOR2 ctrl_t1_f_inst0 (.a(t5_SR2DR[j+1]), .b(prch1[j]), .z(t5_1_ctrl[2*j+2]));

                    end

                    assign t[5] = t5_SR2DR[0];

                    REG #(.WIDTH(2*(d-1))) reg_consecutive_0_inst (.clk(clk), .d(t5_0_ctrl), .q(t0[5]));
                    REG #(.WIDTH(2*(d-1))) reg_consecutive_1_inst (.clk(clk), .d(t5_1_ctrl), .q(t1[5]));

                    REG #(.WIDTH(1)) reg_layer0_inst (.clk(clk), .d(sboxOutput[i][0]), .q(sboxOutput_reg[i][0])); // share 0 state register after non-linear part to decrease total latency by 1

                    // Input bit 3 is replaced by the registered T5 path above
                    wire unused_sboxInput3;
                    assign sboxInput_reg[i]  = 1'b0;
                    assign sboxInput0_reg[i] = {2*(d-1){1'b0}};
                    assign sboxInput1_reg[i] = {2*(d-1){1'b0}};
                    assign unused_sboxInput3 = ^{sboxInput_reg[i], sboxInput0_reg[i], sboxInput1_reg[i]};

                end

            end else begin : gen_round_state_reg_sbox_inputs_full // complete round register

                wire [2*(d-1):1] sboxInput0_ctrl;
                wire [2*(d-1):1] sboxInput1_ctrl;

                for (j = 0; j < (d-1); j=j+1) begin : gen_round_state_reg_sbox_inputs_opt_layer

                    wire input_inv;

                    INV not_inst (.a(a[i*d+j+1]), .z(input_inv));

                    NOR2 ctrl_t0_t_inst0 (.a(input_inv),    .b(prch0[j]), .z(sboxInput0_ctrl[2*j+1]));
                    NOR2 ctrl_t0_f_inst0 (.a(a[i*d+j+1]), .b(prch0[j]), .z(sboxInput0_ctrl[2*j+2]));
                    NOR2 ctrl_t1_t_inst0 (.a(input_inv),    .b(prch1[j]), .z(sboxInput1_ctrl[2*j+1]));
                    NOR2 ctrl_t1_f_inst0 (.a(a[i*d+j+1]), .b(prch1[j]), .z(sboxInput1_ctrl[2*j+2]));

                end

                assign sboxInput_reg[i] = a[i*d];

                REG #(.WIDTH(2*(d-1))) reg_consecutive_0_inst (.clk(clk), .d(sboxInput0_ctrl), .q(sboxInput0_reg[i]));
                REG #(.WIDTH(2*(d-1))) reg_consecutive_1_inst (.clk(clk), .d(sboxInput1_ctrl), .q(sboxInput1_reg[i]));

                // REG output without substitution
                if (isKeySchedule == 1) begin : wiring_z_keyschedule // register output required for processing in key schedule

                    assign z_keyschedule[d*i] = sboxInput_reg[i];

                    for (j = 0; j < (d-1); j=j+1) begin : wiring_z_keyschedule_layer

                        NOR2 merge_m_inst (.a(sboxInput0_reg[i][2*j+2]), .b(sboxInput1_reg[i][2*j+2]), .z(z_keyschedule[d*i+j+1])); // XOR2 -> NOR2, take inverted rail

                    end

                    assign sboxOutput_reg[i][0] = sboxOutput[i][0];

                end else begin : wiring_layer0_reg_not_keyschedule // if sbox is not instantiated in the keyschedule, move layer0 state register to the sbox output

                    assign z_keyschedule[d*(i+1)-1:d*i] = {d{1'b0}};

                    REG #(.WIDTH(1)) reg_layer0_inst (.clk(clk), .d(sboxOutput[i][0]), .q(sboxOutput_reg[i][0])); // share 0 state register after non-linear part to decrease total latency by 1

                end

            end
        end
    endgenerate


    // -------------------------------------------------------------------------
    // First Stage: Linear Map
    // -------------------------------------------------------------------------

    linear_CCHPC1_1_generic_DRtDR_duality #(.security_order(security_order), .CONF(1'b0), .wAOI22(wAOI22_linear)) XOR_T01 (.a_layer0(sboxInput_reg[7]), .b_layer0(sboxInput_reg[4]), .a_duality0(sboxInput0_reg[7]), .a_duality1(sboxInput1_reg[7]), .b_duality0(sboxInput0_reg[4]), .b_duality1(sboxInput1_reg[4]), .z_layer0(t[1]), .z_duality0(t0[1]), .z_duality1(t1[1]));
    linear_CCHPC1_1_generic_DRtDR_duality #(.security_order(security_order), .CONF(1'b0), .wAOI22(wAOI22_linear)) XOR_T02 (.a_layer0(sboxInput_reg[7]), .b_layer0(sboxInput_reg[2]), .a_duality0(sboxInput0_reg[7]), .a_duality1(sboxInput1_reg[7]), .b_duality0(sboxInput0_reg[2]), .b_duality1(sboxInput1_reg[2]), .z_layer0(t[2]), .z_duality0(t0[2]), .z_duality1(t1[2]));
    linear_CCHPC1_1_generic_DRtDR_duality #(.security_order(security_order), .CONF(1'b0), .wAOI22(wAOI22_linear)) XOR_T03 (.a_layer0(sboxInput_reg[7]), .b_layer0(sboxInput_reg[1]), .a_duality0(sboxInput0_reg[7]), .a_duality1(sboxInput1_reg[7]), .b_duality0(sboxInput0_reg[1]), .b_duality1(sboxInput1_reg[1]), .z_layer0(t[3]), .z_duality0(t0[3]), .z_duality1(t1[3]));
    linear_CCHPC1_1_generic_DRtDR_duality #(.security_order(security_order), .CONF(1'b0), .wAOI22(wAOI22_linear)) XOR_T04 (.a_layer0(sboxInput_reg[4]), .b_layer0(sboxInput_reg[2]), .a_duality0(sboxInput0_reg[4]), .a_duality1(sboxInput1_reg[4]), .b_duality0(sboxInput0_reg[2]), .b_duality1(sboxInput1_reg[2]), .z_layer0(t[4]), .z_duality0(t0[4]), .z_duality1(t1[4]));
    generate
        if ((MoveInputREG == 1) && (isKeySchedule != 1)) begin : linear_gadgets_succeed_round_reg

            linear_CCHPC1_1_generic_SRtSR #(.security_order(security_order), .CONF(1'b0)) XOR_T05 (.a(a[d*4-1:d*3]), .b(a[d*2-1:d*1]), .z(t5_SR2DR)); // implemented in single-rail logic as only the output is connected to non-linear gadgets

        end else begin : linear_gadgets_preceed_round_reg

            wire unused_t5_SR2DR;
            assign t5_SR2DR = {d{1'b0}};
            assign unused_t5_SR2DR = ^t5_SR2DR;

            linear_CCHPC1_1_generic_DRtDR_duality #(.security_order(security_order), .CONF(1'b0), .wAOI22(wAOI22_linear)) XOR_T05 (.a_layer0(sboxInput_reg[3]), .b_layer0(sboxInput_reg[1]), .a_duality0(sboxInput0_reg[3]), .a_duality1(sboxInput1_reg[3]), .b_duality0(sboxInput0_reg[1]), .b_duality1(sboxInput1_reg[1]), .z_layer0(t[5]), .z_duality0(t0[5]), .z_duality1(t1[5]));
        end
    endgenerate

    linear_CCHPC1_1_generic_DRtDR_duality #(.security_order(security_order), .CONF(1'b0), .wAOI22(wAOI22_linear)) XOR_T06 (.a_layer0(t[1]), .b_layer0(t[5]), .a_duality0(t0[1]), .a_duality1(t1[1]), .b_duality0(t0[5]), .b_duality1(t1[5]), .z_layer0(t[6]), .z_duality0(t0[6]), .z_duality1(t1[6]));
    linear_CCHPC1_1_generic_DRtDR_duality #(.security_order(security_order), .CONF(1'b0), .wAOI22(wAOI22_linear)) XOR_T07 (.a_layer0(sboxInput_reg[6]), .b_layer0(sboxInput_reg[5]), .a_duality0(sboxInput0_reg[6]), .a_duality1(sboxInput1_reg[6]), .b_duality0(sboxInput0_reg[5]), .b_duality1(sboxInput1_reg[5]), .z_layer0(t[7]), .z_duality0(t0[7]), .z_duality1(t1[7]));
    linear_CCHPC1_1_generic_DRtDR_duality #(.security_order(security_order), .CONF(1'b0), .wAOI22(wAOI22_linear)) XOR_T08 (.a_layer0(sboxInput_reg[0]), .b_layer0(t[6]), .a_duality0(sboxInput0_reg[0]), .a_duality1(sboxInput1_reg[0]), .b_duality0(t0[6]), .b_duality1(t1[6]), .z_layer0(t[8]), .z_duality0(t0[8]), .z_duality1(t1[8]));
    linear_CCHPC1_1_generic_DRtDR_duality #(.security_order(security_order), .CONF(1'b0), .wAOI22(wAOI22_linear)) XOR_T09 (.a_layer0(sboxInput_reg[0]), .b_layer0(t[7]), .a_duality0(sboxInput0_reg[0]), .a_duality1(sboxInput1_reg[0]), .b_duality0(t0[7]), .b_duality1(t1[7]), .z_layer0(t[9]), .z_duality0(t0[9]), .z_duality1(t1[9]));
    linear_CCHPC1_1_generic_DRtDR_duality #(.security_order(security_order), .CONF(1'b0), .wAOI22(wAOI22_linear)) XOR_T10 (.a_layer0(t[6]), .b_layer0(t[7]), .a_duality0(t0[6]), .a_duality1(t1[6]), .b_duality0(t0[7]), .b_duality1(t1[7]), .z_layer0(t[10]), .z_duality0(t0[10]), .z_duality1(t1[10]));
    linear_CCHPC1_1_generic_DRtDR_duality #(.security_order(security_order), .CONF(1'b0), .wAOI22(wAOI22_linear)) XOR_T11 (.a_layer0(sboxInput_reg[6]), .b_layer0(sboxInput_reg[2]), .a_duality0(sboxInput0_reg[6]), .a_duality1(sboxInput1_reg[6]), .b_duality0(sboxInput0_reg[2]), .b_duality1(sboxInput1_reg[2]), .z_layer0(t[11]), .z_duality0(t0[11]), .z_duality1(t1[11]));
    linear_CCHPC1_1_generic_DRtDR_duality #(.security_order(security_order), .CONF(1'b0), .wAOI22(wAOI22_linear)) XOR_T12 (.a_layer0(sboxInput_reg[5]), .b_layer0(sboxInput_reg[2]), .a_duality0(sboxInput0_reg[5]), .a_duality1(sboxInput1_reg[5]), .b_duality0(sboxInput0_reg[2]), .b_duality1(sboxInput1_reg[2]), .z_layer0(t[12]), .z_duality0(t0[12]), .z_duality1(t1[12]));
    linear_CCHPC1_1_generic_DRtDR_duality #(.security_order(security_order), .CONF(1'b0), .wAOI22(wAOI22_linear)) XOR_T13 (.a_layer0(t[3]), .b_layer0(t[4]), .a_duality0(t0[3]), .a_duality1(t1[3]), .b_duality0(t0[4]), .b_duality1(t1[4]), .z_layer0(t[13]), .z_duality0(t0[13]), .z_duality1(t1[13]));
    linear_CCHPC1_1_generic_DRtDR_duality #(.security_order(security_order), .CONF(1'b0), .wAOI22(wAOI22_linear)) XOR_T14 (.a_layer0(t[6]), .b_layer0(t[11]), .a_duality0(t0[6]), .a_duality1(t1[6]), .b_duality0(t0[11]), .b_duality1(t1[11]), .z_layer0(t[14]), .z_duality0(t0[14]), .z_duality1(t1[14]));
    linear_CCHPC1_1_generic_DRtDR_duality #(.security_order(security_order), .CONF(1'b0), .wAOI22(wAOI22_linear)) XOR_T15 (.a_layer0(t[5]), .b_layer0(t[11]), .a_duality0(t0[5]), .a_duality1(t1[5]), .b_duality0(t0[11]), .b_duality1(t1[11]), .z_layer0(t[15]), .z_duality0(t0[15]), .z_duality1(t1[15]));
    linear_CCHPC1_1_generic_DRtDR_duality #(.security_order(security_order), .CONF(1'b0), .wAOI22(wAOI22_linear)) XOR_T16 (.a_layer0(t[5]), .b_layer0(t[12]), .a_duality0(t0[5]), .a_duality1(t1[5]), .b_duality0(t0[12]), .b_duality1(t1[12]), .z_layer0(t[16]), .z_duality0(t0[16]), .z_duality1(t1[16]));
    linear_CCHPC1_1_generic_DRtDR_duality #(.security_order(security_order), .CONF(1'b0), .wAOI22(wAOI22_linear)) XOR_T17 (.a_layer0(t[9]), .b_layer0(t[16]), .a_duality0(t0[9]), .a_duality1(t1[9]), .b_duality0(t0[16]), .b_duality1(t1[16]), .z_layer0(t[17]), .z_duality0(t0[17]), .z_duality1(t1[17]));
    linear_CCHPC1_1_generic_DRtDR_duality #(.security_order(security_order), .CONF(1'b0), .wAOI22(wAOI22_linear)) XOR_T18 (.a_layer0(sboxInput_reg[4]), .b_layer0(sboxInput_reg[0]), .a_duality0(sboxInput0_reg[4]), .a_duality1(sboxInput1_reg[4]), .b_duality0(sboxInput0_reg[0]), .b_duality1(sboxInput1_reg[0]), .z_layer0(t[18]), .z_duality0(t0[18]), .z_duality1(t1[18]));
    linear_CCHPC1_1_generic_DRtDR_duality #(.security_order(security_order), .CONF(1'b0), .wAOI22(wAOI22_linear)) XOR_T19 (.a_layer0(t[7]), .b_layer0(t[18]), .a_duality0(t0[7]), .a_duality1(t1[7]), .b_duality0(t0[18]), .b_duality1(t1[18]), .z_layer0(t[19]), .z_duality0(t0[19]), .z_duality1(t1[19]));
    linear_CCHPC1_1_generic_DRtDR_duality #(.security_order(security_order), .CONF(1'b0), .wAOI22(wAOI22_linear)) XOR_T20 (.a_layer0(t[1]), .b_layer0(t[19]), .a_duality0(t0[1]), .a_duality1(t1[1]), .b_duality0(t0[19]), .b_duality1(t1[19]), .z_layer0(t[20]), .z_duality0(t0[20]), .z_duality1(t1[20]));
    linear_CCHPC1_1_generic_DRtDR_duality #(.security_order(security_order), .CONF(1'b0), .wAOI22(wAOI22_linear)) XOR_T21 (.a_layer0(sboxInput_reg[1]), .b_layer0(sboxInput_reg[0]), .a_duality0(sboxInput0_reg[1]), .a_duality1(sboxInput1_reg[1]), .b_duality0(sboxInput0_reg[0]), .b_duality1(sboxInput1_reg[0]), .z_layer0(t[21]), .z_duality0(t0[21]), .z_duality1(t1[21]));
    linear_CCHPC1_1_generic_DRtDR_duality #(.security_order(security_order), .CONF(1'b0), .wAOI22(wAOI22_linear)) XOR_T22 (.a_layer0(t[7]), .b_layer0(t[21]), .a_duality0(t0[7]), .a_duality1(t1[7]), .b_duality0(t0[21]), .b_duality1(t1[21]), .z_layer0(t[22]), .z_duality0(t0[22]), .z_duality1(t1[22]));
    linear_CCHPC1_1_generic_DRtDR_duality #(.security_order(security_order), .CONF(1'b0), .wAOI22(wAOI22_linear)) XOR_T23 (.a_layer0(t[2]), .b_layer0(t[22]), .a_duality0(t0[2]), .a_duality1(t1[2]), .b_duality0(t0[22]), .b_duality1(t1[22]), .z_layer0(t[23]), .z_duality0(t0[23]), .z_duality1(t1[23]));
    linear_CCHPC1_1_generic_DRtDR_duality #(.security_order(security_order), .CONF(1'b0), .wAOI22(wAOI22_linear)) XOR_T24 (.a_layer0(t[2]), .b_layer0(t[10]), .a_duality0(t0[2]), .a_duality1(t1[2]), .b_duality0(t0[10]), .b_duality1(t1[10]), .z_layer0(t[24]), .z_duality0(t0[24]), .z_duality1(t1[24]));
    linear_CCHPC1_1_generic_DRtDR_duality #(.security_order(security_order), .CONF(1'b0), .wAOI22(wAOI22_linear)) XOR_T25 (.a_layer0(t[20]), .b_layer0(t[17]), .a_duality0(t0[20]), .a_duality1(t1[20]), .b_duality0(t0[17]), .b_duality1(t1[17]), .z_layer0(t[25]), .z_duality0(t0[25]), .z_duality1(t1[25]));
    linear_CCHPC1_1_generic_DRtDR_duality #(.security_order(security_order), .CONF(1'b0), .wAOI22(wAOI22_linear)) XOR_T26 (.a_layer0(t[3]), .b_layer0(t[16]), .a_duality0(t0[3]), .a_duality1(t1[3]), .b_duality0(t0[16]), .b_duality1(t1[16]), .z_layer0(t[26]), .z_duality0(t0[26]), .z_duality1(t1[26]));
    linear_CCHPC1_1_generic_DRtDR_duality #(.security_order(security_order), .CONF(1'b0), .wAOI22(wAOI22_linear)) XOR_T27 (.a_layer0(t[1]), .b_layer0(t[12]), .a_duality0(t0[1]), .a_duality1(t1[1]), .b_duality0(t0[12]), .b_duality1(t1[12]), .z_layer0(t[27]), .z_duality0(t0[27]), .z_duality1(t1[27]));

    // Middle Stage (Non-linear)

    nonlinear_CCHPC1_1_generic_DRtDR_duality #(.security_order(security_order), .CONF(2'b00), .FORWARD_R(FORWARD_R), .wAOI22(wAOI22_nonlinear)) AND_M1 (.clk(clk), .prch0(prch0), .prch1(prch1), .a_layer0(t[13]), .a_duality0(t0[13]), .a_duality1(t1[13]), .b_layer0(t[6]), .b_duality0(t0[6]), .b_duality1(t1[6]), .r_SR(r_SR[0*(d-1) +: (d-1)]), .r_duality0(r_duality0[0*RAND_DR_STRIDE +: RAND_DR_GADGET_WIDTH]), .r_duality1(r_duality1[0*RAND_DR_STRIDE +: RAND_DR_GADGET_WIDTH]), .z_layer0(m[1]), .z_duality0(m0[1]), .z_duality1(m1[1]));
    nonlinear_CCHPC1_1_generic_DRtDR_duality #(.security_order(security_order), .CONF(2'b00), .FORWARD_R(FORWARD_R), .wAOI22(wAOI22_nonlinear)) AND_M2 (.clk(clk), .prch0(prch0), .prch1(prch1), .a_layer0(t[23]), .a_duality0(t0[23]), .a_duality1(t1[23]), .b_layer0(t[8]), .b_duality0(t0[8]), .b_duality1(t1[8]), .r_SR(r_SR[1*(d-1) +: (d-1)]), .r_duality0(r_duality0[1*RAND_DR_STRIDE +: RAND_DR_GADGET_WIDTH]), .r_duality1(r_duality1[1*RAND_DR_STRIDE +: RAND_DR_GADGET_WIDTH]), .z_layer0(m[2]), .z_duality0(m0[2]), .z_duality1(m1[2]));
    linear_CCHPC1_1_generic_DRtDR_duality #(.security_order(security_order), .CONF(1'b0), .wAOI22(wAOI22_linear)) XOR_M3 (.a_layer0(t[14]), .b_layer0(m[1]), .a_duality0(t0[14]), .a_duality1(t1[14]), .b_duality0(m0[1]), .b_duality1(m1[1]), .z_layer0(m[3]), .z_duality0(m0[3]), .z_duality1(m1[3]));
    nonlinear_CCHPC1_1_generic_DRtDR_duality #(.security_order(security_order), .CONF(2'b00), .FORWARD_R(FORWARD_R), .wAOI22(wAOI22_nonlinear)) AND_M4 (.clk(clk), .prch0(prch0), .prch1(prch1), .a_layer0(t[19]), .a_duality0(t0[19]), .a_duality1(t1[19]), .b_layer0(sboxInput_reg[0]), .b_duality0(sboxInput0_reg[0]), .b_duality1(sboxInput1_reg[0]), .r_SR(r_SR[2*(d-1) +: (d-1)]), .r_duality0(r_duality0[2*RAND_DR_STRIDE +: RAND_DR_GADGET_WIDTH]), .r_duality1(r_duality1[2*RAND_DR_STRIDE +: RAND_DR_GADGET_WIDTH]), .z_layer0(m[4]), .z_duality0(m0[4]), .z_duality1(m1[4]));
    linear_CCHPC1_1_generic_DRtDR_duality #(.security_order(security_order), .CONF(1'b0), .wAOI22(wAOI22_linear)) XOR_M5 (.a_layer0(m[4]), .b_layer0(m[1]), .a_duality0(m0[4]), .a_duality1(m1[4]), .b_duality0(m0[1]), .b_duality1(m1[1]), .z_layer0(m[5]), .z_duality0(m0[5]), .z_duality1(m1[5]));
    nonlinear_CCHPC1_1_generic_DRtDR_duality #(.security_order(security_order), .CONF(2'b00), .FORWARD_R(FORWARD_R), .wAOI22(wAOI22_nonlinear)) AND_M6 (.clk(clk), .prch0(prch0), .prch1(prch1), .a_layer0(t[3]), .a_duality0(t0[3]), .a_duality1(t1[3]), .b_layer0(t[16]), .b_duality0(t0[16]), .b_duality1(t1[16]), .r_SR(r_SR[3*(d-1) +: (d-1)]), .r_duality0(r_duality0[3*RAND_DR_STRIDE +: RAND_DR_GADGET_WIDTH]), .r_duality1(r_duality1[3*RAND_DR_STRIDE +: RAND_DR_GADGET_WIDTH]), .z_layer0(m[6]), .z_duality0(m0[6]), .z_duality1(m1[6]));
    nonlinear_CCHPC1_1_generic_DRtDR_duality #(.security_order(security_order), .CONF(2'b00), .FORWARD_R(FORWARD_R), .wAOI22(wAOI22_nonlinear)) AND_M7 (.clk(clk), .prch0(prch0), .prch1(prch1), .a_layer0(t[22]), .a_duality0(t0[22]), .a_duality1(t1[22]), .b_layer0(t[9]), .b_duality0(t0[9]), .b_duality1(t1[9]), .r_SR(r_SR[4*(d-1) +: (d-1)]), .r_duality0(r_duality0[4*RAND_DR_STRIDE +: RAND_DR_GADGET_WIDTH]), .r_duality1(r_duality1[4*RAND_DR_STRIDE +: RAND_DR_GADGET_WIDTH]), .z_layer0(m[7]), .z_duality0(m0[7]), .z_duality1(m1[7]));
    linear_CCHPC1_1_generic_DRtDR_duality #(.security_order(security_order), .CONF(1'b0), .wAOI22(wAOI22_linear)) XOR_M8 (.a_layer0(t[26]), .b_layer0(m[6]), .a_duality0(t0[26]), .a_duality1(t1[26]), .b_duality0(m0[6]), .b_duality1(m1[6]), .z_layer0(m[8]), .z_duality0(m0[8]), .z_duality1(m1[8]));
    nonlinear_CCHPC1_1_generic_DRtDR_duality #(.security_order(security_order), .CONF(2'b00), .FORWARD_R(FORWARD_R), .wAOI22(wAOI22_nonlinear)) AND_M9 (.clk(clk), .prch0(prch0), .prch1(prch1), .a_layer0(t[20]), .a_duality0(t0[20]), .a_duality1(t1[20]), .b_layer0(t[17]), .b_duality0(t0[17]), .b_duality1(t1[17]), .r_SR(r_SR[5*(d-1) +: (d-1)]), .r_duality0(r_duality0[5*RAND_DR_STRIDE +: RAND_DR_GADGET_WIDTH]), .r_duality1(r_duality1[5*RAND_DR_STRIDE +: RAND_DR_GADGET_WIDTH]), .z_layer0(m[9]), .z_duality0(m0[9]), .z_duality1(m1[9]));
    linear_CCHPC1_1_generic_DRtDR_duality #(.security_order(security_order), .CONF(1'b0), .wAOI22(wAOI22_linear)) XOR_M10 (.a_layer0(m[9]), .b_layer0(m[6]), .a_duality0(m0[9]), .a_duality1(m1[9]), .b_duality0(m0[6]), .b_duality1(m1[6]), .z_layer0(m[10]), .z_duality0(m0[10]), .z_duality1(m1[10]));
    nonlinear_CCHPC1_1_generic_DRtDR_duality #(.security_order(security_order), .CONF(2'b00), .FORWARD_R(FORWARD_R), .wAOI22(wAOI22_nonlinear)) AND_M11 (.clk(clk), .prch0(prch0), .prch1(prch1), .a_layer0(t[1]), .a_duality0(t0[1]), .a_duality1(t1[1]), .b_layer0(t[15]), .b_duality0(t0[15]), .b_duality1(t1[15]), .r_SR(r_SR[6*(d-1) +: (d-1)]), .r_duality0(r_duality0[6*RAND_DR_STRIDE +: RAND_DR_GADGET_WIDTH]), .r_duality1(r_duality1[6*RAND_DR_STRIDE +: RAND_DR_GADGET_WIDTH]), .z_layer0(m[11]), .z_duality0(m0[11]), .z_duality1(m1[11]));
    nonlinear_CCHPC1_1_generic_DRtDR_duality #(.security_order(security_order), .CONF(2'b00), .FORWARD_R(FORWARD_R), .wAOI22(wAOI22_nonlinear)) AND_M12 (.clk(clk), .prch0(prch0), .prch1(prch1), .a_layer0(t[4]), .a_duality0(t0[4]), .a_duality1(t1[4]), .b_layer0(t[27]), .b_duality0(t0[27]), .b_duality1(t1[27]), .r_SR(r_SR[7*(d-1) +: (d-1)]), .r_duality0(r_duality0[7*RAND_DR_STRIDE +: RAND_DR_GADGET_WIDTH]), .r_duality1(r_duality1[7*RAND_DR_STRIDE +: RAND_DR_GADGET_WIDTH]), .z_layer0(m[12]), .z_duality0(m0[12]), .z_duality1(m1[12]));
    linear_CCHPC1_1_generic_DRtDR_duality #(.security_order(security_order), .CONF(1'b0), .wAOI22(wAOI22_linear)) XOR_M13 (.a_layer0(m[12]), .b_layer0(m[11]), .a_duality0(m0[12]), .a_duality1(m1[12]), .b_duality0(m0[11]), .b_duality1(m1[11]), .z_layer0(m[13]), .z_duality0(m0[13]), .z_duality1(m1[13]));
    nonlinear_CCHPC1_1_generic_DRtDR_duality #(.security_order(security_order), .CONF(2'b00), .FORWARD_R(FORWARD_R), .wAOI22(wAOI22_nonlinear)) AND_M14 (.clk(clk), .prch0(prch0), .prch1(prch1), .a_layer0(t[2]), .a_duality0(t0[2]), .a_duality1(t1[2]), .b_layer0(t[10]), .b_duality0(t0[10]), .b_duality1(t1[10]), .r_SR(r_SR[8*(d-1) +: (d-1)]), .r_duality0(r_duality0[8*RAND_DR_STRIDE +: RAND_DR_GADGET_WIDTH]), .r_duality1(r_duality1[8*RAND_DR_STRIDE +: RAND_DR_GADGET_WIDTH]), .z_layer0(m[14]), .z_duality0(m0[14]), .z_duality1(m1[14]));
    linear_CCHPC1_1_generic_DRtDR_duality #(.security_order(security_order), .CONF(1'b0), .wAOI22(wAOI22_linear)) XOR_M15 (.a_layer0(m[14]), .b_layer0(m[11]), .a_duality0(m0[14]), .a_duality1(m1[14]), .b_duality0(m0[11]), .b_duality1(m1[11]), .z_layer0(m[15]), .z_duality0(m0[15]), .z_duality1(m1[15]));
    linear_CCHPC1_1_generic_DRtDR_duality #(.security_order(security_order), .CONF(1'b0), .wAOI22(wAOI22_linear)) XOR_M16 (.a_layer0(m[3]), .b_layer0(m[2]), .a_duality0(m0[3]), .a_duality1(m1[3]), .b_duality0(m0[2]), .b_duality1(m1[2]), .z_layer0(m[16]), .z_duality0(m0[16]), .z_duality1(m1[16]));
    linear_CCHPC1_1_generic_DRtDR_duality #(.security_order(security_order), .CONF(1'b0), .wAOI22(wAOI22_linear)) XOR_M17 (.a_layer0(m[5]), .b_layer0(t[24]), .a_duality0(m0[5]), .a_duality1(m1[5]), .b_duality0(t0[24]), .b_duality1(t1[24]), .z_layer0(m[17]), .z_duality0(m0[17]), .z_duality1(m1[17]));
    linear_CCHPC1_1_generic_DRtDR_duality #(.security_order(security_order), .CONF(1'b0), .wAOI22(wAOI22_linear)) XOR_M18 (.a_layer0(m[8]), .b_layer0(m[7]), .a_duality0(m0[8]), .a_duality1(m1[8]), .b_duality0(m0[7]), .b_duality1(m1[7]), .z_layer0(m[18]), .z_duality0(m0[18]), .z_duality1(m1[18]));
    linear_CCHPC1_1_generic_DRtDR_duality #(.security_order(security_order), .CONF(1'b0), .wAOI22(wAOI22_linear)) XOR_M19 (.a_layer0(m[10]), .b_layer0(m[15]), .a_duality0(m0[10]), .a_duality1(m1[10]), .b_duality0(m0[15]), .b_duality1(m1[15]), .z_layer0(m[19]), .z_duality0(m0[19]), .z_duality1(m1[19]));
    linear_CCHPC1_1_generic_DRtDR_duality #(.security_order(security_order), .CONF(1'b0), .wAOI22(wAOI22_linear)) XOR_M20 (.a_layer0(m[16]), .b_layer0(m[13]), .a_duality0(m0[16]), .a_duality1(m1[16]), .b_duality0(m0[13]), .b_duality1(m1[13]), .z_layer0(m[20]), .z_duality0(m0[20]), .z_duality1(m1[20]));
    linear_CCHPC1_1_generic_DRtDR_duality #(.security_order(security_order), .CONF(1'b0), .wAOI22(wAOI22_linear)) XOR_M21 (.a_layer0(m[17]), .b_layer0(m[15]), .a_duality0(m0[17]), .a_duality1(m1[17]), .b_duality0(m0[15]), .b_duality1(m1[15]), .z_layer0(m[21]), .z_duality0(m0[21]), .z_duality1(m1[21]));
    linear_CCHPC1_1_generic_DRtDR_duality #(.security_order(security_order), .CONF(1'b0), .wAOI22(wAOI22_linear)) XOR_M22 (.a_layer0(m[18]), .b_layer0(m[13]), .a_duality0(m0[18]), .a_duality1(m1[18]), .b_duality0(m0[13]), .b_duality1(m1[13]), .z_layer0(m[22]), .z_duality0(m0[22]), .z_duality1(m1[22]));
    linear_CCHPC1_1_generic_DRtDR_duality #(.security_order(security_order), .CONF(1'b0), .wAOI22(wAOI22_linear)) XOR_M23 (.a_layer0(m[19]), .b_layer0(t[25]), .a_duality0(m0[19]), .a_duality1(m1[19]), .b_duality0(t0[25]), .b_duality1(t1[25]), .z_layer0(m[23]), .z_duality0(m0[23]), .z_duality1(m1[23]));

    // -- [HB25] F_{2^4} inverter --------------------------------------------------------------------------------------------
    // -- Vedad Hadžić and Roderick Bloem, Efficient and Composable Masked AES S-BoxDesigns Using Optimized Inverters --------

    wire             inv_g  [3:0];
    wire [2*(d-1):1] inv_g0 [3:0];
    wire [2*(d-1):1] inv_g1 [3:0];

    wire             inv_a  [1:0];
    wire [2*(d-1):1] inv_a0 [1:0];
    wire [2*(d-1):1] inv_a1 [1:0];

    wire             inv_b  [1:0];
    wire [2*(d-1):1] inv_b0 [1:0];
    wire [2*(d-1):1] inv_b1 [1:0];

    wire             inv_c  [1:0];
    wire [2*(d-1):1] inv_c0 [1:0];
    wire [2*(d-1):1] inv_c1 [1:0];

    wire             inv_d  [1:0];
    wire [2*(d-1):1] inv_d0 [1:0];
    wire [2*(d-1):1] inv_d1 [1:0];

    wire             inv_e  [1:0];
    wire [2*(d-1):1] inv_e0 [1:0];
    wire [2*(d-1):1] inv_e1 [1:0];

    wire             inv_f  [1:0];
    wire [2*(d-1):1] inv_f0 [1:0];
    wire [2*(d-1):1] inv_f1 [1:0];

    wire             inv_l  [3:0];
    wire [2*(d-1):1] inv_l0 [3:0];
    wire [2*(d-1):1] inv_l1 [3:0];

    // input mapping
    assign inv_g[3]  = m[20];
    assign inv_g0[3] = m0[20];
    assign inv_g1[3] = m1[20];

    assign inv_g[2]  = m[21];
    assign inv_g0[2] = m0[21];
    assign inv_g1[2] = m1[21];

    assign inv_g[1]  = m[22];
    assign inv_g0[1] = m0[22];
    assign inv_g1[1] = m1[22];

    assign inv_g[0]  = m[23];
    assign inv_g0[0] = m0[23];
    assign inv_g1[0] = m1[23];

    // combinational logic

    // a0 = g1 + g0
    linear_CCHPC1_1_generic_DRtDR_duality #(.security_order(security_order), .CONF(1'b0), .wAOI22(wAOI22_linear)) XOR_A0 (.a_layer0(inv_g[1]), .b_layer0(inv_g[0]), .a_duality0(inv_g0[1]), .a_duality1(inv_g1[1]), .b_duality0(inv_g0[0]), .b_duality1(inv_g1[0]), .z_layer0(inv_a[0]), .z_duality0(inv_a0[0]), .z_duality1(inv_a1[0]));
    // a1 = g3 + g2
    linear_CCHPC1_1_generic_DRtDR_duality #(.security_order(security_order), .CONF(1'b0), .wAOI22(wAOI22_linear)) XOR_A1 (.a_layer0(inv_g[3]), .b_layer0(inv_g[2]), .a_duality0(inv_g0[3]), .a_duality1(inv_g1[3]), .b_duality0(inv_g0[2]), .b_duality1(inv_g1[2]), .z_layer0(inv_a[1]), .z_duality0(inv_a0[1]), .z_duality1(inv_a1[1]));
    // b0 = g2 x g0
    nonlinear_CCHPC1_1_generic_DRtDR_duality #(.security_order(security_order), .CONF(2'b00), .FORWARD_R(FORWARD_R), .wAOI22(wAOI22_nonlinear)) AND_B0 (.clk(clk), .prch0(prch0), .prch1(prch1), .a_layer0(inv_g[2]), .a_duality0(inv_g0[2]), .a_duality1(inv_g1[2]), .b_layer0(inv_g[0]), .b_duality0(inv_g0[0]), .b_duality1(inv_g1[0]), .r_SR(r_SR[9*(d-1) +: (d-1)]), .r_duality0(r_duality0[9*RAND_DR_STRIDE +: RAND_DR_GADGET_WIDTH]), .r_duality1(r_duality1[9*RAND_DR_STRIDE +: RAND_DR_GADGET_WIDTH]), .z_layer0(inv_b[0]), .z_duality0(inv_b0[0]), .z_duality1(inv_b1[0]));
    // b1 = g3 x g1
    nonlinear_CCHPC1_1_generic_DRtDR_duality #(.security_order(security_order), .CONF(2'b00), .FORWARD_R(FORWARD_R), .wAOI22(wAOI22_nonlinear)) AND_B1 (.clk(clk), .prch0(prch0), .prch1(prch1), .a_layer0(inv_g[3]), .a_duality0(inv_g0[3]), .a_duality1(inv_g1[3]), .b_layer0(inv_g[1]), .b_duality0(inv_g0[1]), .b_duality1(inv_g1[1]), .r_SR(r_SR[10*(d-1) +: (d-1)]), .r_duality0(r_duality0[10*RAND_DR_STRIDE +: RAND_DR_GADGET_WIDTH]), .r_duality1(r_duality1[10*RAND_DR_STRIDE +: RAND_DR_GADGET_WIDTH]), .z_layer0(inv_b[1]), .z_duality0(inv_b0[1]), .z_duality1(inv_b1[1]));
    // c0 = a0 + b0
    linear_CCHPC1_1_generic_DRtDR_duality #(.security_order(security_order), .CONF(1'b0), .wAOI22(wAOI22_linear)) XOR_C0 (.a_layer0(inv_a[0]), .b_layer0(inv_b[0]), .a_duality0(inv_a0[0]), .a_duality1(inv_a1[0]), .b_duality0(inv_b0[0]), .b_duality1(inv_b1[0]), .z_layer0(inv_c[0]), .z_duality0(inv_c0[0]), .z_duality1(inv_c1[0]));
    // c1 = a1 + b0
    linear_CCHPC1_1_generic_DRtDR_duality #(.security_order(security_order), .CONF(1'b0), .wAOI22(wAOI22_linear)) XOR_C1 (.a_layer0(inv_a[1]), .b_layer0(inv_b[0]), .a_duality0(inv_a0[1]), .a_duality1(inv_a1[1]), .b_duality0(inv_b0[0]), .b_duality1(inv_b1[0]), .z_layer0(inv_c[1]), .z_duality0(inv_c0[1]), .z_duality1(inv_c1[1]));
    // d0 = g0 + b1
    linear_CCHPC1_1_generic_DRtDR_duality #(.security_order(security_order), .CONF(1'b0), .wAOI22(wAOI22_linear)) XOR_D0 (.a_layer0(inv_g[0]), .b_layer0(inv_b[1]), .a_duality0(inv_g0[0]), .a_duality1(inv_g1[0]), .b_duality0(inv_b0[1]), .b_duality1(inv_b1[1]), .z_layer0(inv_d[0]), .z_duality0(inv_d0[0]), .z_duality1(inv_d1[0]));
    // d1 = g2 + b1
    linear_CCHPC1_1_generic_DRtDR_duality #(.security_order(security_order), .CONF(1'b0), .wAOI22(wAOI22_linear)) XOR_D1 (.a_layer0(inv_g[2]), .b_layer0(inv_b[1]), .a_duality0(inv_g0[2]), .a_duality1(inv_g1[2]), .b_duality0(inv_b0[1]), .b_duality1(inv_b1[1]), .z_layer0(inv_d[1]), .z_duality0(inv_d0[1]), .z_duality1(inv_d1[1]));
    // e0 = g3 x c0
    nonlinear_CCHPC1_1_generic_DRtDR_duality #(.security_order(security_order), .CONF(2'b00), .FORWARD_R(FORWARD_R), .wAOI22(wAOI22_nonlinear)) AND_E0 (.clk(clk), .prch0(prch0), .prch1(prch1), .a_layer0(inv_g[3]), .a_duality0(inv_g0[3]), .a_duality1(inv_g1[3]), .b_layer0(inv_c[0]), .b_duality0(inv_c0[0]), .b_duality1(inv_c1[0]), .r_SR(r_SR[11*(d-1) +: (d-1)]), .r_duality0(r_duality0[11*RAND_DR_STRIDE +: RAND_DR_GADGET_WIDTH]), .r_duality1(r_duality1[11*RAND_DR_STRIDE +: RAND_DR_GADGET_WIDTH]), .z_layer0(inv_e[0]), .z_duality0(inv_e0[0]), .z_duality1(inv_e1[0]));
    // e1 = g1 x c1
    nonlinear_CCHPC1_1_generic_DRtDR_duality #(.security_order(security_order), .CONF(2'b00), .FORWARD_R(FORWARD_R), .wAOI22(wAOI22_nonlinear)) AND_E1 (.clk(clk), .prch0(prch0), .prch1(prch1), .a_layer0(inv_g[1]), .a_duality0(inv_g0[1]), .a_duality1(inv_g1[1]), .b_layer0(inv_c[1]), .b_duality0(inv_c0[1]), .b_duality1(inv_c1[1]), .r_SR(r_SR[12*(d-1) +: (d-1)]), .r_duality0(r_duality0[12*RAND_DR_STRIDE +: RAND_DR_GADGET_WIDTH]), .r_duality1(r_duality1[12*RAND_DR_STRIDE +: RAND_DR_GADGET_WIDTH]), .z_layer0(inv_e[1]), .z_duality0(inv_e0[1]), .z_duality1(inv_e1[1]));
    // f0 = a1 x d0
    nonlinear_CCHPC1_1_generic_DRtDR_duality #(.security_order(security_order), .CONF(2'b00), .FORWARD_R(FORWARD_R), .wAOI22(wAOI22_nonlinear)) AND_F0 (.clk(clk), .prch0(prch0), .prch1(prch1), .a_layer0(inv_a[1]), .a_duality0(inv_a0[1]), .a_duality1(inv_a1[1]), .b_layer0(inv_d[0]), .b_duality0(inv_d0[0]), .b_duality1(inv_d1[0]), .r_SR(r_SR[13*(d-1) +: (d-1)]), .r_duality0(r_duality0[13*RAND_DR_STRIDE +: RAND_DR_GADGET_WIDTH]), .r_duality1(r_duality1[13*RAND_DR_STRIDE +: RAND_DR_GADGET_WIDTH]), .z_layer0(inv_f[0]), .z_duality0(inv_f0[0]), .z_duality1(inv_f1[0]));
    // f1 = a0 x d1
    nonlinear_CCHPC1_1_generic_DRtDR_duality #(.security_order(security_order), .CONF(2'b00), .FORWARD_R(FORWARD_R), .wAOI22(wAOI22_nonlinear)) AND_F1 (.clk(clk), .prch0(prch0), .prch1(prch1), .a_layer0(inv_a[0]), .a_duality0(inv_a0[0]), .a_duality1(inv_a1[0]), .b_layer0(inv_d[1]), .b_duality0(inv_d0[1]), .b_duality1(inv_d1[1]), .r_SR(r_SR[14*(d-1) +: (d-1)]), .r_duality0(r_duality0[14*RAND_DR_STRIDE +: RAND_DR_GADGET_WIDTH]), .r_duality1(r_duality1[14*RAND_DR_STRIDE +: RAND_DR_GADGET_WIDTH]), .z_layer0(inv_f[1]), .z_duality0(inv_f0[1]), .z_duality1(inv_f1[1]));
    // l3 = a0 + e1
    linear_CCHPC1_1_generic_DRtDR_duality #(.security_order(security_order), .CONF(1'b0), .wAOI22(wAOI22_linear)) XOR_L3 (.a_layer0(inv_a[0]), .b_layer0(inv_e[1]), .a_duality0(inv_a0[0]), .a_duality1(inv_a1[0]), .b_duality0(inv_e0[1]), .b_duality1(inv_e1[1]), .z_layer0(inv_l[3]), .z_duality0(inv_l0[3]), .z_duality1(inv_l1[3]));
    // l2 = g0 + f1
    linear_CCHPC1_1_generic_DRtDR_duality #(.security_order(security_order), .CONF(1'b0), .wAOI22(wAOI22_linear)) XOR_L2 (.a_layer0(inv_g[0]), .b_layer0(inv_f[1]), .a_duality0(inv_g0[0]), .a_duality1(inv_g1[0]), .b_duality0(inv_f0[1]), .b_duality1(inv_f1[1]), .z_layer0(inv_l[2]), .z_duality0(inv_l0[2]), .z_duality1(inv_l1[2]));
    // l1 = a1 + e0
    linear_CCHPC1_1_generic_DRtDR_duality #(.security_order(security_order), .CONF(1'b0), .wAOI22(wAOI22_linear)) XOR_L1 (.a_layer0(inv_a[1]), .b_layer0(inv_e[0]), .a_duality0(inv_a0[1]), .a_duality1(inv_a1[1]), .b_duality0(inv_e0[0]), .b_duality1(inv_e1[0]), .z_layer0(inv_l[1]), .z_duality0(inv_l0[1]), .z_duality1(inv_l1[1]));
    // l0 = g2 + f0
    linear_CCHPC1_1_generic_DRtDR_duality #(.security_order(security_order), .CONF(1'b0), .wAOI22(wAOI22_linear)) XOR_L0 (.a_layer0(inv_g[2]), .b_layer0(inv_f[0]), .a_duality0(inv_g0[2]), .a_duality1(inv_g1[2]), .b_duality0(inv_f0[0]), .b_duality1(inv_f1[0]), .z_layer0(inv_l[0]), .z_duality0(inv_l0[0]), .z_duality1(inv_l1[0]));
    // output mapping
    assign m_post[37]  = inv_l[0];
    assign m_post0[37] = inv_l0[0];
    assign m_post1[37] = inv_l1[0];

    assign m_post[38]  = inv_l[1];
    assign m_post0[38] = inv_l0[1];
    assign m_post1[38] = inv_l1[1];

    assign m_post[39]  = inv_l[2];
    assign m_post0[39] = inv_l0[2];
    assign m_post1[39] = inv_l1[2];

    assign m_post[40]  = inv_l[3];
    assign m_post0[40] = inv_l0[3];
    assign m_post1[40] = inv_l1[3];

    // --------------------------------------------------------------------------------------------------------------

    linear_CCHPC1_1_generic_DRtDR_duality #(.security_order(security_order), .CONF(1'b0), .wAOI22(wAOI22_linear)) XOR_M41 (.a_layer0(m_post[38]), .b_layer0(m_post[40]), .a_duality0(m_post0[38]), .a_duality1(m_post1[38]), .b_duality0(m_post0[40]), .b_duality1(m_post1[40]), .z_layer0(m_post[41]), .z_duality0(m_post0[41]), .z_duality1(m_post1[41]));
    linear_CCHPC1_1_generic_DRtDR_duality #(.security_order(security_order), .CONF(1'b0), .wAOI22(wAOI22_linear)) XOR_M42 (.a_layer0(m_post[37]), .b_layer0(m_post[39]), .a_duality0(m_post0[37]), .a_duality1(m_post1[37]), .b_duality0(m_post0[39]), .b_duality1(m_post1[39]), .z_layer0(m_post[42]), .z_duality0(m_post0[42]), .z_duality1(m_post1[42]));
    linear_CCHPC1_1_generic_DRtDR_duality #(.security_order(security_order), .CONF(1'b0), .wAOI22(wAOI22_linear)) XOR_M43 (.a_layer0(m_post[37]), .b_layer0(m_post[38]), .a_duality0(m_post0[37]), .a_duality1(m_post1[37]), .b_duality0(m_post0[38]), .b_duality1(m_post1[38]), .z_layer0(m_post[43]), .z_duality0(m_post0[43]), .z_duality1(m_post1[43]));
    linear_CCHPC1_1_generic_DRtDR_duality #(.security_order(security_order), .CONF(1'b0), .wAOI22(wAOI22_linear)) XOR_M44 (.a_layer0(m_post[39]), .b_layer0(m_post[40]), .a_duality0(m_post0[39]), .a_duality1(m_post1[39]), .b_duality0(m_post0[40]), .b_duality1(m_post1[40]), .z_layer0(m_post[44]), .z_duality0(m_post0[44]), .z_duality1(m_post1[44]));
    linear_CCHPC1_1_generic_DRtDR_duality #(.security_order(security_order), .CONF(1'b0), .wAOI22(wAOI22_linear)) XOR_M45 (.a_layer0(m_post[42]), .b_layer0(m_post[41]), .a_duality0(m_post0[42]), .a_duality1(m_post1[42]), .b_duality0(m_post0[41]), .b_duality1(m_post1[41]), .z_layer0(m_post[45]), .z_duality0(m_post0[45]), .z_duality1(m_post1[45]));
    nonlinear_CCHPC1_1_generic_DRtSR_duality #(.security_order(security_order), .CONF(2'b00), .FORWARD_R(FORWARD_R), .wAOI22(wAOI22_nonlinear)) AND_M46 (.clk(clk), .prch0(prch0), .prch1(prch1), .a_layer0(m_post[44]), .a_duality0(m_post0[44]), .a_duality1(m_post1[44]), .b_layer0(t[6]), .b_duality0(t0[6]), .b_duality1(t1[6]), .r_SR(r_SR[RAND_SR_DRtDR_WIDTH+0*RAND_COUNT +: RAND_COUNT]), .z_SR(m_merged[46]));
    nonlinear_CCHPC1_1_generic_DRtSR_duality #(.security_order(security_order), .CONF(2'b00), .FORWARD_R(FORWARD_R), .wAOI22(wAOI22_nonlinear)) AND_M47 (.clk(clk), .prch0(prch0), .prch1(prch1), .a_layer0(m_post[40]), .a_duality0(m_post0[40]), .a_duality1(m_post1[40]), .b_layer0(t[8]), .b_duality0(t0[8]), .b_duality1(t1[8]), .r_SR(r_SR[RAND_SR_DRtDR_WIDTH+1*RAND_COUNT +: RAND_COUNT]), .z_SR(m_merged[47]));
    nonlinear_CCHPC1_1_generic_DRtSR_duality #(.security_order(security_order), .CONF(2'b00), .FORWARD_R(FORWARD_R), .wAOI22(wAOI22_nonlinear)) AND_M48 (.clk(clk), .prch0(prch0), .prch1(prch1), .a_layer0(m_post[39]), .a_duality0(m_post0[39]), .a_duality1(m_post1[39]), .b_layer0(sboxInput_reg[0]), .b_duality0(sboxInput0_reg[0]), .b_duality1(sboxInput1_reg[0]), .r_SR(r_SR[RAND_SR_DRtDR_WIDTH+2*RAND_COUNT +: RAND_COUNT]), .z_SR(m_merged[48]));
    nonlinear_CCHPC1_1_generic_DRtSR_duality #(.security_order(security_order), .CONF(2'b00), .FORWARD_R(FORWARD_R), .wAOI22(wAOI22_nonlinear)) AND_M49 (.clk(clk), .prch0(prch0), .prch1(prch1), .a_layer0(m_post[43]), .a_duality0(m_post0[43]), .a_duality1(m_post1[43]), .b_layer0(t[16]), .b_duality0(t0[16]), .b_duality1(t1[16]), .r_SR(r_SR[RAND_SR_DRtDR_WIDTH+3*RAND_COUNT +: RAND_COUNT]), .z_SR(m_merged[49]));
    nonlinear_CCHPC1_1_generic_DRtSR_duality #(.security_order(security_order), .CONF(2'b00), .FORWARD_R(FORWARD_R), .wAOI22(wAOI22_nonlinear)) AND_M50 (.clk(clk), .prch0(prch0), .prch1(prch1), .a_layer0(m_post[38]), .a_duality0(m_post0[38]), .a_duality1(m_post1[38]), .b_layer0(t[9]), .b_duality0(t0[9]), .b_duality1(t1[9]), .r_SR(r_SR[RAND_SR_DRtDR_WIDTH+4*RAND_COUNT +: RAND_COUNT]), .z_SR(m_merged[50]));
    nonlinear_CCHPC1_1_generic_DRtSR_duality #(.security_order(security_order), .CONF(2'b00), .FORWARD_R(FORWARD_R), .wAOI22(wAOI22_nonlinear)) AND_M51 (.clk(clk), .prch0(prch0), .prch1(prch1), .a_layer0(m_post[37]), .a_duality0(m_post0[37]), .a_duality1(m_post1[37]), .b_layer0(t[17]), .b_duality0(t0[17]), .b_duality1(t1[17]), .r_SR(r_SR[RAND_SR_DRtDR_WIDTH+5*RAND_COUNT +: RAND_COUNT]), .z_SR(m_merged[51]));
    nonlinear_CCHPC1_1_generic_DRtSR_duality #(.security_order(security_order), .CONF(2'b00), .FORWARD_R(FORWARD_R), .wAOI22(wAOI22_nonlinear)) AND_M52 (.clk(clk), .prch0(prch0), .prch1(prch1), .a_layer0(m_post[42]), .a_duality0(m_post0[42]), .a_duality1(m_post1[42]), .b_layer0(t[15]), .b_duality0(t0[15]), .b_duality1(t1[15]), .r_SR(r_SR[RAND_SR_DRtDR_WIDTH+6*RAND_COUNT +: RAND_COUNT]), .z_SR(m_merged[52]));
    nonlinear_CCHPC1_1_generic_DRtSR_duality #(.security_order(security_order), .CONF(2'b00), .FORWARD_R(FORWARD_R), .wAOI22(wAOI22_nonlinear)) AND_M53 (.clk(clk), .prch0(prch0), .prch1(prch1), .a_layer0(m_post[45]), .a_duality0(m_post0[45]), .a_duality1(m_post1[45]), .b_layer0(t[27]), .b_duality0(t0[27]), .b_duality1(t1[27]), .r_SR(r_SR[RAND_SR_DRtDR_WIDTH+7*RAND_COUNT +: RAND_COUNT]), .z_SR(m_merged[53]));
    nonlinear_CCHPC1_1_generic_DRtSR_duality #(.security_order(security_order), .CONF(2'b00), .FORWARD_R(FORWARD_R), .wAOI22(wAOI22_nonlinear)) AND_M54 (.clk(clk), .prch0(prch0), .prch1(prch1), .a_layer0(m_post[41]), .a_duality0(m_post0[41]), .a_duality1(m_post1[41]), .b_layer0(t[10]), .b_duality0(t0[10]), .b_duality1(t1[10]), .r_SR(r_SR[RAND_SR_DRtDR_WIDTH+8*RAND_COUNT +: RAND_COUNT]), .z_SR(m_merged[54]));
    nonlinear_CCHPC1_1_generic_DRtSR_duality #(.security_order(security_order), .CONF(2'b00), .FORWARD_R(FORWARD_R), .wAOI22(wAOI22_nonlinear)) AND_M55 (.clk(clk), .prch0(prch0), .prch1(prch1), .a_layer0(m_post[44]), .a_duality0(m_post0[44]), .a_duality1(m_post1[44]), .b_layer0(t[13]), .b_duality0(t0[13]), .b_duality1(t1[13]), .r_SR(r_SR[RAND_SR_DRtDR_WIDTH+9*RAND_COUNT +: RAND_COUNT]), .z_SR(m_merged[55]));
    nonlinear_CCHPC1_1_generic_DRtSR_duality #(.security_order(security_order), .CONF(2'b00), .FORWARD_R(FORWARD_R), .wAOI22(wAOI22_nonlinear)) AND_M56 (.clk(clk), .prch0(prch0), .prch1(prch1), .a_layer0(m_post[40]), .a_duality0(m_post0[40]), .a_duality1(m_post1[40]), .b_layer0(t[23]), .b_duality0(t0[23]), .b_duality1(t1[23]), .r_SR(r_SR[RAND_SR_DRtDR_WIDTH+10*RAND_COUNT +: RAND_COUNT]), .z_SR(m_merged[56]));
    nonlinear_CCHPC1_1_generic_DRtSR_duality #(.security_order(security_order), .CONF(2'b00), .FORWARD_R(FORWARD_R), .wAOI22(wAOI22_nonlinear)) AND_M57 (.clk(clk), .prch0(prch0), .prch1(prch1), .a_layer0(m_post[39]), .a_duality0(m_post0[39]), .a_duality1(m_post1[39]), .b_layer0(t[19]), .b_duality0(t0[19]), .b_duality1(t1[19]), .r_SR(r_SR[RAND_SR_DRtDR_WIDTH+11*RAND_COUNT +: RAND_COUNT]), .z_SR(m_merged[57]));
    nonlinear_CCHPC1_1_generic_DRtSR_duality #(.security_order(security_order), .CONF(2'b00), .FORWARD_R(FORWARD_R), .wAOI22(wAOI22_nonlinear)) AND_M58 (.clk(clk), .prch0(prch0), .prch1(prch1), .a_layer0(m_post[43]), .a_duality0(m_post0[43]), .a_duality1(m_post1[43]), .b_layer0(t[3]), .b_duality0(t0[3]), .b_duality1(t1[3]), .r_SR(r_SR[RAND_SR_DRtDR_WIDTH+12*RAND_COUNT +: RAND_COUNT]), .z_SR(m_merged[58]));
    nonlinear_CCHPC1_1_generic_DRtSR_duality #(.security_order(security_order), .CONF(2'b00), .FORWARD_R(FORWARD_R), .wAOI22(wAOI22_nonlinear)) AND_M59 (.clk(clk), .prch0(prch0), .prch1(prch1), .a_layer0(m_post[38]), .a_duality0(m_post0[38]), .a_duality1(m_post1[38]), .b_layer0(t[22]), .b_duality0(t0[22]), .b_duality1(t1[22]), .r_SR(r_SR[RAND_SR_DRtDR_WIDTH+13*RAND_COUNT +: RAND_COUNT]), .z_SR(m_merged[59]));
    nonlinear_CCHPC1_1_generic_DRtSR_duality #(.security_order(security_order), .CONF(2'b00), .FORWARD_R(FORWARD_R), .wAOI22(wAOI22_nonlinear)) AND_M60 (.clk(clk), .prch0(prch0), .prch1(prch1), .a_layer0(m_post[37]), .a_duality0(m_post0[37]), .a_duality1(m_post1[37]), .b_layer0(t[20]), .b_duality0(t0[20]), .b_duality1(t1[20]), .r_SR(r_SR[RAND_SR_DRtDR_WIDTH+14*RAND_COUNT +: RAND_COUNT]), .z_SR(m_merged[60]));
    nonlinear_CCHPC1_1_generic_DRtSR_duality #(.security_order(security_order), .CONF(2'b00), .FORWARD_R(FORWARD_R), .wAOI22(wAOI22_nonlinear)) AND_M61 (.clk(clk), .prch0(prch0), .prch1(prch1), .a_layer0(m_post[42]), .a_duality0(m_post0[42]), .a_duality1(m_post1[42]), .b_layer0(t[1]), .b_duality0(t0[1]), .b_duality1(t1[1]), .r_SR(r_SR[RAND_SR_DRtDR_WIDTH+15*RAND_COUNT +: RAND_COUNT]), .z_SR(m_merged[61]));
    nonlinear_CCHPC1_1_generic_DRtSR_duality #(.security_order(security_order), .CONF(2'b00), .FORWARD_R(FORWARD_R), .wAOI22(wAOI22_nonlinear)) AND_M62 (.clk(clk), .prch0(prch0), .prch1(prch1), .a_layer0(m_post[45]), .a_duality0(m_post0[45]), .a_duality1(m_post1[45]), .b_layer0(t[4]), .b_duality0(t0[4]), .b_duality1(t1[4]), .r_SR(r_SR[RAND_SR_DRtDR_WIDTH+16*RAND_COUNT +: RAND_COUNT]), .z_SR(m_merged[62]));
    nonlinear_CCHPC1_1_generic_DRtSR_duality #(.security_order(security_order), .CONF(2'b00), .FORWARD_R(FORWARD_R), .wAOI22(wAOI22_nonlinear)) AND_M63 (.clk(clk), .prch0(prch0), .prch1(prch1), .a_layer0(m_post[41]), .a_duality0(m_post0[41]), .a_duality1(m_post1[41]), .b_layer0(t[2]), .b_duality0(t0[2]), .b_duality1(t1[2]), .r_SR(r_SR[RAND_SR_DRtDR_WIDTH+17*RAND_COUNT +: RAND_COUNT]), .z_SR(m_merged[63]));

    // Last Stage: Linear Map

    linear_CCHPC1_1_generic_SRtSR #(.security_order(security_order), .CONF(1'b0)) XOR_L00 (.a(m_merged[61]), .b(m_merged[62]), .z(l[0]));
    linear_CCHPC1_1_generic_SRtSR #(.security_order(security_order), .CONF(1'b0)) XOR_L01 (.a(m_merged[50]), .b(m_merged[56]), .z(l[1]));
    linear_CCHPC1_1_generic_SRtSR #(.security_order(security_order), .CONF(1'b0)) XOR_L02 (.a(m_merged[46]), .b(m_merged[48]), .z(l[2]));
    linear_CCHPC1_1_generic_SRtSR #(.security_order(security_order), .CONF(1'b0)) XOR_L03 (.a(m_merged[47]), .b(m_merged[55]), .z(l[3]));
    linear_CCHPC1_1_generic_SRtSR #(.security_order(security_order), .CONF(1'b0)) XOR_L04 (.a(m_merged[54]), .b(m_merged[58]), .z(l[4]));
    linear_CCHPC1_1_generic_SRtSR #(.security_order(security_order), .CONF(1'b0)) XOR_L05 (.a(m_merged[49]), .b(m_merged[61]), .z(l[5]));
    linear_CCHPC1_1_generic_SRtSR #(.security_order(security_order), .CONF(1'b0)) XOR_L06 (.a(m_merged[62]), .b(l[5]), .z(l[6]));
    linear_CCHPC1_1_generic_SRtSR #(.security_order(security_order), .CONF(1'b0)) XOR_L07 (.a(m_merged[46]), .b(l[3]), .z(l[7]));
    linear_CCHPC1_1_generic_SRtSR #(.security_order(security_order), .CONF(1'b0)) XOR_L08 (.a(m_merged[51]), .b(m_merged[59]), .z(l[8]));
    linear_CCHPC1_1_generic_SRtSR #(.security_order(security_order), .CONF(1'b0)) XOR_L09 (.a(m_merged[52]), .b(m_merged[53]), .z(l[9]));
    linear_CCHPC1_1_generic_SRtSR #(.security_order(security_order), .CONF(1'b0)) XOR_L10 (.a(m_merged[53]), .b(l[4]), .z(l[10]));
    linear_CCHPC1_1_generic_SRtSR #(.security_order(security_order), .CONF(1'b0)) XOR_L11 (.a(m_merged[60]), .b(l[2]), .z(l[11]));
    linear_CCHPC1_1_generic_SRtSR #(.security_order(security_order), .CONF(1'b0)) XOR_L12 (.a(m_merged[48]), .b(m_merged[51]), .z(l[12]));
    linear_CCHPC1_1_generic_SRtSR #(.security_order(security_order), .CONF(1'b0)) XOR_L13 (.a(m_merged[50]), .b(l[0]), .z(l[13]));
    linear_CCHPC1_1_generic_SRtSR #(.security_order(security_order), .CONF(1'b0)) XOR_L14 (.a(m_merged[52]), .b(m_merged[61]), .z(l[14]));
    linear_CCHPC1_1_generic_SRtSR #(.security_order(security_order), .CONF(1'b0)) XOR_L15 (.a(m_merged[55]), .b(l[1]), .z(l[15]));
    linear_CCHPC1_1_generic_SRtSR #(.security_order(security_order), .CONF(1'b0)) XOR_L16 (.a(m_merged[56]), .b(l[0]), .z(l[16]));
    linear_CCHPC1_1_generic_SRtSR #(.security_order(security_order), .CONF(1'b0)) XOR_L17 (.a(m_merged[57]), .b(l[1]), .z(l[17]));
    linear_CCHPC1_1_generic_SRtSR #(.security_order(security_order), .CONF(1'b0)) XOR_L18 (.a(m_merged[58]), .b(l[8]), .z(l[18]));
    linear_CCHPC1_1_generic_SRtSR #(.security_order(security_order), .CONF(1'b0)) XOR_L19 (.a(m_merged[63]), .b(l[4]), .z(l[19]));
    linear_CCHPC1_1_generic_SRtSR #(.security_order(security_order), .CONF(1'b0)) XOR_L20 (.a(l[0]), .b(l[1]), .z(l[20]));
    linear_CCHPC1_1_generic_SRtSR #(.security_order(security_order), .CONF(1'b0)) XOR_L21 (.a(l[1]), .b(l[7]), .z(l[21]));
    linear_CCHPC1_1_generic_SRtSR #(.security_order(security_order), .CONF(1'b0)) XOR_L22 (.a(l[3]), .b(l[12]), .z(l[22]));
    linear_CCHPC1_1_generic_SRtSR #(.security_order(security_order), .CONF(1'b0)) XOR_L23 (.a(l[18]), .b(l[2]), .z(l[23]));
    linear_CCHPC1_1_generic_SRtSR #(.security_order(security_order), .CONF(1'b0)) XOR_L24 (.a(l[15]), .b(l[9]), .z(l[24]));
    linear_CCHPC1_1_generic_SRtSR #(.security_order(security_order), .CONF(1'b0)) XOR_L25 (.a(l[6]), .b(l[10]), .z(l[25]));
    linear_CCHPC1_1_generic_SRtSR #(.security_order(security_order), .CONF(1'b0)) XOR_L26 (.a(l[7]), .b(l[9]), .z(l[26]));
    linear_CCHPC1_1_generic_SRtSR #(.security_order(security_order), .CONF(1'b0)) XOR_L27 (.a(l[8]), .b(l[10]), .z(l[27]));
    linear_CCHPC1_1_generic_SRtSR #(.security_order(security_order), .CONF(1'b0)) XOR_L28 (.a(l[11]), .b(l[14]), .z(l[28]));
    linear_CCHPC1_1_generic_SRtSR #(.security_order(security_order), .CONF(1'b0)) XOR_L29 (.a(l[11]), .b(l[17]), .z(l[29]));
    linear_CCHPC1_1_generic_SRtSR #(.security_order(security_order), .CONF(1'b0)) XOR_S00 (.a(l[6]), .b(l[24]), .z(sboxOutput[7]));
    linear_CCHPC1_1_generic_SRtSR #(.security_order(security_order), .CONF(1'b1)) XNOR_S01 (.a(l[16]), .b(l[26]), .z(sboxOutput[6]));
    linear_CCHPC1_1_generic_SRtSR #(.security_order(security_order), .CONF(1'b1)) XNOR_S02 (.a(l[19]), .b(l[28]), .z(sboxOutput[5]));
    linear_CCHPC1_1_generic_SRtSR #(.security_order(security_order), .CONF(1'b0)) XOR_S03 (.a(l[6]), .b(l[21]), .z(sboxOutput[4]));
    linear_CCHPC1_1_generic_SRtSR #(.security_order(security_order), .CONF(1'b0)) XOR_S04 (.a(l[20]), .b(l[22]), .z(sboxOutput[3]));
    linear_CCHPC1_1_generic_SRtSR #(.security_order(security_order), .CONF(1'b0)) XOR_S05 (.a(l[25]), .b(l[29]), .z(sboxOutput[2]));
    linear_CCHPC1_1_generic_SRtSR #(.security_order(security_order), .CONF(1'b1)) XNOR_S06 (.a(l[13]), .b(l[27]), .z(sboxOutput[1]));
    linear_CCHPC1_1_generic_SRtSR #(.security_order(security_order), .CONF(1'b1)) XNOR_S07 (.a(l[6]), .b(l[23]), .z(sboxOutput[0]));

    // -------------------------------------------------------------------------

endmodule

