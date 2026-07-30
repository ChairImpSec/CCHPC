//module Sbox_opt_reg #( parameter MoveInputREG = 1, isKeySchedule = 0 )(clk, prch, r0, r1, a, z, z_keyschedule);
module Sbox_opt_reg_d #( parameter security_order = 1, MoveInputREG = 1, isKeySchedule = 0 )(clk, prch0, prch1, r0, r1, a, z, z_keyschedule);
    parameter integer d               = security_order+1;
    parameter integer nonlinear_count = 33;

    input  clk;
    input  [d-2:0] prch0;
    input  [d-2:0] prch1;
    input  [((d*(d-1)))*nonlinear_count-1:0] r0;
    input  [((d*(d-1)))*nonlinear_count-1:0] r1;
    input  [8*d-1:0] a;
    output [8*d-1:0] z;
    output [8*d-1:0] z_keyschedule;

    // ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

    // -- Intermediates
    wire [d-1:0]     sboxOutput      [7:0]; // single-rail
    wire [d-1:0]     sboxOutput_reg  [7:0]; // single-rail
    wire [2*(d-1):0] sboxInput       [7:0]; // CCHPC representation

    wire [((d*(d-1)))-1:0] in_r  [nonlinear_count-1:0]; // dual-rail layer0
    wire [((d*(d-1)))-1:0] in_r0 [nonlinear_count-1:0]; // dual-rail duality inst0
    wire [((d*(d-1)))-1:0] in_r1 [nonlinear_count-1:0]; // dual-rail duality inst1

    wire             t  [27:1]; // single-rail layer0
    wire [2*(d-1):0] t0 [27:1]; // CCHPC representation round0
    wire [2*(d-1):0] t1 [27:1]; // CCHPC representation round1

    wire             m        [63: 1]; // single-rail layer0
    wire [2*(d-1):0] m0       [63: 1]; // CCHPC representation round0
    wire [2*(d-1):0] m1       [63: 1]; // CCHPC representation round1
    wire [d-1:0]     m_merged [63:46]; // single-rail

    wire [d-1:0] l [29:0]; // single-rail

    wire [2*(d-1):1] sboxInput0_ctrl [7:0]; // controlled dual-rail shares round0 (input to reg)
    wire [2*(d-1):1] sboxInput1_ctrl [7:0]; // controlled dual-rail shares round1 (input to reg)
    wire             sboxInput_reg   [7:0]; // single-rail layer0
    wire [2*(d-1):0] sboxInput0_reg  [7:0]; // CCHPC representation round0
    wire [2*(d-1):0] sboxInput1_reg  [7:0]; // CCHPC representation round1

    wire [d-1:0]     t5_SR2DR;       // single-rail logic preceding non-linear parts
    wire [2*(d-1):0] t5_SR2DR_CCHPC; // single-rail logic preceding non-linear parts (converted to dual-rail logic before register)
    wire [2*(d-1):1] t5_0_ctrl;      // controlled dual-rail shares round0 (input to reg)
    wire [2*(d-1):1] t5_1_ctrl;      // controlled dual-rail shares round1 (input to reg)
    wire             t5_reg;         // single-rail layer0
    wire [2*(d-1):0] t5_0_reg;       // CCHPC representation round0
    wire [2*(d-1):0] t5_1_reg;       // CCHPC representation round1

    wire [d*(d-1)*4-1:0] t_in [15:0];       // pre-processed values for regular non-linear gadgets
    wire [d*(d-1)*2-1:0] t_in_DR2SR [17:0]; // pre-processed values for DR2SR non-linear gadgets

    // ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

    genvar i, j;
    generate
        for (i = 0; i < 8; i=i+1) begin : loop_round_state_reg

            // IO Mapping
            assign z[d*(i+1)-1:d*i] = sboxOutput_reg[i];
            assign sboxInput[i][0]  = a[i*d];

            for (j = 0; j < (d-1); j=j+1) begin : gen_io_mapping

                assign sboxInput[i][2*j+1] = a[i*d+j+1];

            end

            // Round State Register
            if ((MoveInputREG == 1) && (isKeySchedule != 1)) begin : gen_round_state_reg_sbox_inputs // exclude linear gadgets that can be implemented in single-rail before the round register
                if (i != 3) begin : gen_round_state_reg_sbox_inputs_opt 

                    for (j = 0; j < (d-1); j=j+1) begin : gen_round_state_reg_sbox_inputs_opt_layer

                        INV not_inst (.a(sboxInput[i][2*j+1]), .z(sboxInput[i][2*j+2]));

                        NOR2 ctrl_t0_t_inst0 (.a(sboxInput[i][2*j+2]), .b(prch0[j]), .z(sboxInput0_ctrl[i][2*j+1]));
                        NOR2 ctrl_t0_f_inst0 (.a(sboxInput[i][2*j+1]), .b(prch0[j]), .z(sboxInput0_ctrl[i][2*j+2]));
                        NOR2 ctrl_t1_t_inst0 (.a(sboxInput[i][2*j+2]), .b(prch1[j]), .z(sboxInput1_ctrl[i][2*j+1]));
                        NOR2 ctrl_t1_f_inst0 (.a(sboxInput[i][2*j+1]), .b(prch1[j]), .z(sboxInput1_ctrl[i][2*j+2]));

                    end

                    assign sboxInput_reg[i] = sboxInput[i][0];
                    REG #(.WIDTH(2*(d-1))) reg_consecutive_0_inst (clk, sboxInput0_ctrl[i][2*(d-1):1], sboxInput0_reg[i][2*(d-1):1]);
                    REG #(.WIDTH(2*(d-1))) reg_consecutive_1_inst (clk, sboxInput1_ctrl[i][2*(d-1):1], sboxInput1_reg[i][2*(d-1):1]);

                    assign sboxInput0_reg[i][0] = sboxInput_reg[i];
                    assign sboxInput1_reg[i][0] = sboxInput_reg[i];

                    REG #(.WIDTH(1)) reg_layer0_inst (clk, sboxOutput[i][0], sboxOutput_reg[i][0]); // share 0 state register after non-linear part to decrease total latency by 1
                    assign sboxOutput_reg[i][d-1:1] = sboxOutput[i][d-1:1];


                end else begin: gen_round_state_reg_intermediate_inputs

                    assign t5_SR2DR_CCHPC[0] = t5_SR2DR[0];

                    for (j = 0; j < (d-1); j=j+1) begin : gen_round_state_reg_intermediate_inputs_layer

                        assign t5_SR2DR_CCHPC[2*j+1] = t5_SR2DR[j+1];
                        INV not_inst (.a(t5_SR2DR_CCHPC[2*j+1]), .z(t5_SR2DR_CCHPC[2*j+2]));

                        NOR2 ctrl_t0_t_inst0 (.a(t5_SR2DR_CCHPC[2*j+2]), .b(prch0[j]), .z(t5_0_ctrl[2*j+1]));
                        NOR2 ctrl_t0_f_inst0 (.a(t5_SR2DR_CCHPC[2*j+1]), .b(prch0[j]), .z(t5_0_ctrl[2*j+2]));
                        NOR2 ctrl_t1_t_inst0 (.a(t5_SR2DR_CCHPC[2*j+2]), .b(prch1[j]), .z(t5_1_ctrl[2*j+1]));
                        NOR2 ctrl_t1_f_inst0 (.a(t5_SR2DR_CCHPC[2*j+1]), .b(prch1[j]), .z(t5_1_ctrl[2*j+2]));

                    end

                    assign t5_reg = t5_SR2DR[0];
                    REG #(.WIDTH(2*(d-1))) reg_consecutive_0_inst (clk, t5_0_ctrl[2*(d-1):1], t5_0_reg[2*(d-1):1]);
                    REG #(.WIDTH(2*(d-1))) reg_consecutive_1_inst (clk, t5_1_ctrl[2*(d-1):1], t5_1_reg[2*(d-1):1]);

                    assign t5_0_reg[0] = t5_reg;
                    assign t5_1_reg[0] = t5_reg;

                    assign t[5]  = t5_reg;
                    assign t0[5] = t5_0_reg;
                    assign t1[5] = t5_1_reg;

                    REG #(.WIDTH(1)) reg_layer0_inst (clk, sboxOutput[i][0], sboxOutput_reg[i][0]); // share 0 state register after non-linear part to decrease total latency by 1
                    assign sboxOutput_reg[i][d-1:1] = sboxOutput[i][d-1:1];

                end
            end else begin : gen_round_state_reg_sbox_inputs_full // complete round register

                for (j = 0; j < (d-1); j=j+1) begin : gen_round_state_reg_sbox_inputs_opt_layer

                    INV not_inst (.a(sboxInput[i][2*j+1]), .z(sboxInput[i][2*j+2]));

                    NOR2 ctrl_t0_t_inst0 (.a(sboxInput[i][2*j+2]), .b(prch0[j]), .z(sboxInput0_ctrl[i][2*j+1]));
                    NOR2 ctrl_t0_f_inst0 (.a(sboxInput[i][2*j+1]), .b(prch0[j]), .z(sboxInput0_ctrl[i][2*j+2]));
                    NOR2 ctrl_t1_t_inst0 (.a(sboxInput[i][2*j+2]), .b(prch1[j]), .z(sboxInput1_ctrl[i][2*j+1]));
                    NOR2 ctrl_t1_f_inst0 (.a(sboxInput[i][2*j+1]), .b(prch1[j]), .z(sboxInput1_ctrl[i][2*j+2]));

                end

                assign sboxInput_reg[i] = sboxInput[i][0];
                REG #(.WIDTH(2*(d-1))) reg_consecutive_0_inst (clk, sboxInput0_ctrl[i][2*(d-1):1], sboxInput0_reg[i][2*(d-1):1]);
                REG #(.WIDTH(2*(d-1))) reg_consecutive_1_inst (clk, sboxInput1_ctrl[i][2*(d-1):1], sboxInput1_reg[i][2*(d-1):1]);

                assign sboxInput0_reg[i][0] = sboxInput_reg[i];
                assign sboxInput1_reg[i][0] = sboxInput_reg[i];

                // REG output without substitution
                if (isKeySchedule == 1) begin : wiring_z_keyschedule // register output required for processing in key schedule

                    assign z_keyschedule[d*i] = sboxInput_reg[i];

                    for (j = 0; j < (d-1); j=j+1) begin : wiring_z_keyschedule_layer

                        NOR2 merge_m_inst (.a(sboxInput0_reg[i][2*j+2]), .b(sboxInput1_reg[i][2*j+2]), .z(z_keyschedule[d*i+j+1])); // XOR2 -> NOR2, take inverted rail

                    end

                    assign sboxOutput_reg[i][0] = sboxOutput[i][0];

                end else begin : wiring_layer0_reg_not_keyschedule // if sbox is not instantiated in the keyschedule, move layer0 state register to the sbox output

                    REG #(.WIDTH(1)) reg_layer0_inst (clk, sboxOutput[i][0], sboxOutput_reg[i][0]); // share 0 state register after non-linear part to decrease total latency by 1
                      
                end

                assign sboxOutput_reg[i][d-1:1] = sboxOutput[i][d-1:1];

            end
        end
    endgenerate


    // Randomness Input Mapping
    generate
        for (i = 0; i < nonlinear_count; i=i+1) begin : loop_randomness_mapping
            
            assign in_r[i]  = r0[(i+1)*((d*(d-1)))-1:i*((d*(d-1)))];  // dual-rail random bit layer0 instance
            assign in_r0[i] = r0[(i+1)*((d*(d-1)))-1:i*((d*(d-1)))];  // dual-rail random bit duality instance 0
            assign in_r1[i] = r1[(i+1)*((d*(d-1)))-1:i*((d*(d-1)))];  // dual-rail random bit duality instance 1

        end
    endgenerate

    // Duality Wiring
    generate
        for (i = 1; i < 28; i=i+1) begin : loop_duality_wiring_t

            assign t0[i][0] = t[i];
            assign t1[i][0] = t[i];

        end
        for (i = 1; i < 64; i=i+1) begin : loop_duality_wiring_m

            assign m0[i][0] = m[i];
            assign m1[i][0] = m[i];

        end
    endgenerate


    // ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

    // First Stage: Linear Map
    linear_CCHPC1_1_layer0                                                        XOR_T01_layer0        (.a( sboxInput_reg[7]), .b( sboxInput_reg[4]), .z( t[1]));
    linear_CCHPC1_1_consecutive_d #(.security_order(security_order), .CONF(1'b0)) XOR_T01_consecutive_0 (.a(sboxInput0_reg[7]), .b(sboxInput0_reg[4]), .z(t0[1][2*(d-1):1]));
    linear_CCHPC1_1_consecutive_d #(.security_order(security_order), .CONF(1'b0)) XOR_T01_consecutive_1 (.a(sboxInput1_reg[7]), .b(sboxInput1_reg[4]), .z(t1[1][2*(d-1):1]));
    linear_CCHPC1_1_layer0                                                        XOR_T02_layer0        (.a( sboxInput_reg[7]), .b( sboxInput_reg[2]), .z( t[2]));
    linear_CCHPC1_1_consecutive_d #(.security_order(security_order), .CONF(1'b0)) XOR_T02_consecutive_0 (.a(sboxInput0_reg[7]), .b(sboxInput0_reg[2]), .z(t0[2][2*(d-1):1]));
    linear_CCHPC1_1_consecutive_d #(.security_order(security_order), .CONF(1'b0)) XOR_T02_consecutive_1 (.a(sboxInput1_reg[7]), .b(sboxInput1_reg[2]), .z(t1[2][2*(d-1):1]));
    linear_CCHPC1_1_layer0                                                        XOR_T03_layer0        (.a( sboxInput_reg[7]), .b( sboxInput_reg[1]), .z( t[3]));
    linear_CCHPC1_1_consecutive_d #(.security_order(security_order), .CONF(1'b0)) XOR_T03_consecutive_0 (.a(sboxInput0_reg[7]), .b(sboxInput0_reg[1]), .z(t0[3][2*(d-1):1]));
    linear_CCHPC1_1_consecutive_d #(.security_order(security_order), .CONF(1'b0)) XOR_T03_consecutive_1 (.a(sboxInput1_reg[7]), .b(sboxInput1_reg[1]), .z(t1[3][2*(d-1):1]));
    linear_CCHPC1_1_layer0                                                        XOR_T04_layer0        (.a( sboxInput_reg[4]), .b( sboxInput_reg[2]), .z( t[4]));
    linear_CCHPC1_1_consecutive_d #(.security_order(security_order), .CONF(1'b0)) XOR_T04_consecutive_0 (.a(sboxInput0_reg[4]), .b(sboxInput0_reg[2]), .z(t0[4][2*(d-1):1]));
    linear_CCHPC1_1_consecutive_d #(.security_order(security_order), .CONF(1'b0)) XOR_T04_consecutive_1 (.a(sboxInput1_reg[4]), .b(sboxInput1_reg[2]), .z(t1[4][2*(d-1):1]));

    generate
        if ((MoveInputREG == 1) && (isKeySchedule != 1)) begin : linear_gadgets_succeed_round_reg

            linear_CCHPC1_1_SRtSR #(.security_order(security_order), .CONF(1'b0)) XOR_T05  (.a(a[d*4-1:d*3]), .b(a[d*2-1:d*1]), .z(t5_SR2DR)); // implemented in single-rail logic as only the output is connected to non-linear gadgets

        end else begin : linear_gadgets_preceed_round_reg

            linear_CCHPC1_1_layer0                                                        XOR_T05_layer0        (.a( sboxInput_reg[3]), .b( sboxInput_reg[1]), .z( t[5]));
            linear_CCHPC1_1_consecutive_d #(.security_order(security_order), .CONF(1'b0)) XOR_T05_consecutive_0 (.a(sboxInput0_reg[3]), .b(sboxInput0_reg[1]), .z(t0[5][2*(d-1):1]));
            linear_CCHPC1_1_consecutive_d #(.security_order(security_order), .CONF(1'b0)) XOR_T05_consecutive_1 (.a(sboxInput1_reg[3]), .b(sboxInput1_reg[1]), .z(t1[5][2*(d-1):1]));

        end
    endgenerate

    linear_CCHPC1_1_layer0                                                        XOR_T06_layer0        (.a( t[1]), .b( t[5]), .z( t[6]));
    linear_CCHPC1_1_consecutive_d #(.security_order(security_order), .CONF(1'b0)) XOR_T06_consecutive_0 (.a(t0[1]), .b(t0[5]), .z(t0[6][2*(d-1):1]));
    linear_CCHPC1_1_consecutive_d #(.security_order(security_order), .CONF(1'b0)) XOR_T06_consecutive_1 (.a(t1[1]), .b(t1[5]), .z(t1[6][2*(d-1):1]));
    linear_CCHPC1_1_layer0                                                        XOR_T07_layer0        (.a( sboxInput_reg[6]), .b( sboxInput_reg[5]), .z( t[7]));
    linear_CCHPC1_1_consecutive_d #(.security_order(security_order), .CONF(1'b0)) XOR_T07_consecutive_0 (.a(sboxInput0_reg[6]), .b(sboxInput0_reg[5]), .z(t0[7][2*(d-1):1]));
    linear_CCHPC1_1_consecutive_d #(.security_order(security_order), .CONF(1'b0)) XOR_T07_consecutive_1 (.a(sboxInput1_reg[6]), .b(sboxInput1_reg[5]), .z(t1[7][2*(d-1):1]));
    linear_CCHPC1_1_layer0                                                        XOR_T08_layer0        (.a( sboxInput_reg[0]), .b( t[6]), .z( t[8]));
    linear_CCHPC1_1_consecutive_d #(.security_order(security_order), .CONF(1'b0)) XOR_T08_consecutive_0 (.a(sboxInput0_reg[0]), .b(t0[6]), .z(t0[8][2*(d-1):1]));
    linear_CCHPC1_1_consecutive_d #(.security_order(security_order), .CONF(1'b0)) XOR_T08_consecutive_1 (.a(sboxInput1_reg[0]), .b(t1[6]), .z(t1[8][2*(d-1):1]));
    linear_CCHPC1_1_layer0                                                        XOR_T09_layer0        (.a( sboxInput_reg[0]), .b( t[7]), .z( t[9]));
    linear_CCHPC1_1_consecutive_d #(.security_order(security_order), .CONF(1'b0)) XOR_T09_consecutive_0 (.a(sboxInput0_reg[0]), .b(t0[7]), .z(t0[9][2*(d-1):1]));
    linear_CCHPC1_1_consecutive_d #(.security_order(security_order), .CONF(1'b0)) XOR_T09_consecutive_1 (.a(sboxInput1_reg[0]), .b(t1[7]), .z(t1[9][2*(d-1):1]));
    linear_CCHPC1_1_layer0                                                        XOR_T10_layer0        (.a( t[6]), .b( t[7]), .z( t[10]));
    linear_CCHPC1_1_consecutive_d #(.security_order(security_order), .CONF(1'b0)) XOR_T10_consecutive_0 (.a(t0[6]), .b(t0[7]), .z(t0[10][2*(d-1):1]));
    linear_CCHPC1_1_consecutive_d #(.security_order(security_order), .CONF(1'b0)) XOR_T10_consecutive_1 (.a(t1[6]), .b(t1[7]), .z(t1[10][2*(d-1):1]));
    linear_CCHPC1_1_layer0                                                        XOR_T11_layer0        (.a( sboxInput_reg[6]), .b( sboxInput_reg[2]), .z( t[11]));
    linear_CCHPC1_1_consecutive_d #(.security_order(security_order), .CONF(1'b0)) XOR_T11_consecutive_0 (.a(sboxInput0_reg[6]), .b(sboxInput0_reg[2]), .z(t0[11][2*(d-1):1]));
    linear_CCHPC1_1_consecutive_d #(.security_order(security_order), .CONF(1'b0)) XOR_T11_consecutive_1 (.a(sboxInput1_reg[6]), .b(sboxInput1_reg[2]), .z(t1[11][2*(d-1):1]));
    linear_CCHPC1_1_layer0                                                        XOR_T12_layer0        (.a( sboxInput_reg[5]), .b( sboxInput_reg[2]), .z( t[12]));
    linear_CCHPC1_1_consecutive_d #(.security_order(security_order), .CONF(1'b0)) XOR_T12_consecutive_0 (.a(sboxInput0_reg[5]), .b(sboxInput0_reg[2]), .z(t0[12][2*(d-1):1]));
    linear_CCHPC1_1_consecutive_d #(.security_order(security_order), .CONF(1'b0)) XOR_T12_consecutive_1 (.a(sboxInput1_reg[5]), .b(sboxInput1_reg[2]), .z(t1[12][2*(d-1):1]));
    linear_CCHPC1_1_layer0                                                        XOR_T13_layer0        (.a( t[3]), .b( t[4]), .z( t[13]));
    linear_CCHPC1_1_consecutive_d #(.security_order(security_order), .CONF(1'b0)) XOR_T13_consecutive_0 (.a(t0[3]), .b(t0[4]), .z(t0[13][2*(d-1):1]));
    linear_CCHPC1_1_consecutive_d #(.security_order(security_order), .CONF(1'b0)) XOR_T13_consecutive_1 (.a(t1[3]), .b(t1[4]), .z(t1[13][2*(d-1):1]));
    linear_CCHPC1_1_layer0                                                        XOR_T14_layer0        (.a( t[6]), .b( t[11]), .z( t[14]));
    linear_CCHPC1_1_consecutive_d #(.security_order(security_order), .CONF(1'b0)) XOR_T14_consecutive_0 (.a(t0[6]), .b(t0[11]), .z(t0[14][2*(d-1):1]));
    linear_CCHPC1_1_consecutive_d #(.security_order(security_order), .CONF(1'b0)) XOR_T14_consecutive_1 (.a(t1[6]), .b(t1[11]), .z(t1[14][2*(d-1):1]));
    linear_CCHPC1_1_layer0                                                        XOR_T15_layer0        (.a( t[5]), .b( t[11]), .z( t[15]));
    linear_CCHPC1_1_consecutive_d #(.security_order(security_order), .CONF(1'b0)) XOR_T15_consecutive_0 (.a(t0[5]), .b(t0[11]), .z(t0[15][2*(d-1):1]));
    linear_CCHPC1_1_consecutive_d #(.security_order(security_order), .CONF(1'b0)) XOR_T15_consecutive_1 (.a(t1[5]), .b(t1[11]), .z(t1[15][2*(d-1):1]));
    linear_CCHPC1_1_layer0                                                        XOR_T16_layer0        (.a( t[5]), .b( t[12]), .z( t[16]));
    linear_CCHPC1_1_consecutive_d #(.security_order(security_order), .CONF(1'b0)) XOR_T16_consecutive_0 (.a(t0[5]), .b(t0[12]), .z(t0[16][2*(d-1):1]));
    linear_CCHPC1_1_consecutive_d #(.security_order(security_order), .CONF(1'b0)) XOR_T16_consecutive_1 (.a(t1[5]), .b(t1[12]), .z(t1[16][2*(d-1):1]));
    linear_CCHPC1_1_layer0                                                        XOR_T17_layer0        (.a( t[9]), .b( t[16]), .z( t[17]));
    linear_CCHPC1_1_consecutive_d #(.security_order(security_order), .CONF(1'b0)) XOR_T17_consecutive_0 (.a(t0[9]), .b(t0[16]), .z(t0[17][2*(d-1):1]));
    linear_CCHPC1_1_consecutive_d #(.security_order(security_order), .CONF(1'b0)) XOR_T17_consecutive_1 (.a(t1[9]), .b(t1[16]), .z(t1[17][2*(d-1):1]));
    linear_CCHPC1_1_layer0                                                        XOR_T18_layer0        (.a( sboxInput_reg[4]), .b( sboxInput_reg[0]), .z( t[18]));
    linear_CCHPC1_1_consecutive_d #(.security_order(security_order), .CONF(1'b0)) XOR_T18_consecutive_0 (.a(sboxInput0_reg[4]), .b(sboxInput0_reg[0]), .z(t0[18][2*(d-1):1]));
    linear_CCHPC1_1_consecutive_d #(.security_order(security_order), .CONF(1'b0)) XOR_T18_consecutive_1 (.a(sboxInput1_reg[4]), .b(sboxInput1_reg[0]), .z(t1[18][2*(d-1):1]));
    linear_CCHPC1_1_layer0                                                        XOR_T19_layer0        (.a( t[7]), .b( t[18]), .z( t[19]));
    linear_CCHPC1_1_consecutive_d #(.security_order(security_order), .CONF(1'b0)) XOR_T19_consecutive_0 (.a(t0[7]), .b(t0[18]), .z(t0[19][2*(d-1):1]));
    linear_CCHPC1_1_consecutive_d #(.security_order(security_order), .CONF(1'b0)) XOR_T19_consecutive_1 (.a(t1[7]), .b(t1[18]), .z(t1[19][2*(d-1):1]));
    linear_CCHPC1_1_layer0                                                        XOR_T20_layer0        (.a( t[1]), .b( t[19]), .z( t[20]));
    linear_CCHPC1_1_consecutive_d #(.security_order(security_order), .CONF(1'b0)) XOR_T20_consecutive_0 (.a(t0[1]), .b(t0[19]), .z(t0[20][2*(d-1):1]));
    linear_CCHPC1_1_consecutive_d #(.security_order(security_order), .CONF(1'b0)) XOR_T20_consecutive_1 (.a(t1[1]), .b(t1[19]), .z(t1[20][2*(d-1):1]));
    linear_CCHPC1_1_layer0                                                        XOR_T21_layer0        (.a( sboxInput_reg[1]), .b( sboxInput_reg[0]), .z( t[21]));
    linear_CCHPC1_1_consecutive_d #(.security_order(security_order), .CONF(1'b0)) XOR_T21_consecutive_0 (.a(sboxInput0_reg[1]), .b(sboxInput0_reg[0]), .z(t0[21][2*(d-1):1]));
    linear_CCHPC1_1_consecutive_d #(.security_order(security_order), .CONF(1'b0)) XOR_T21_consecutive_1 (.a(sboxInput1_reg[1]), .b(sboxInput1_reg[0]), .z(t1[21][2*(d-1):1]));
    linear_CCHPC1_1_layer0                                                        XOR_T22_layer0        (.a( t[7]), .b( t[21]), .z( t[22]));
    linear_CCHPC1_1_consecutive_d #(.security_order(security_order), .CONF(1'b0)) XOR_T22_consecutive_0 (.a(t0[7]), .b(t0[21]), .z(t0[22][2*(d-1):1]));
    linear_CCHPC1_1_consecutive_d #(.security_order(security_order), .CONF(1'b0)) XOR_T22_consecutive_1 (.a(t1[7]), .b(t1[21]), .z(t1[22][2*(d-1):1]));
    linear_CCHPC1_1_layer0                                                        XOR_T23_layer0        (.a( t[2]), .b( t[22]), .z( t[23]));
    linear_CCHPC1_1_consecutive_d #(.security_order(security_order), .CONF(1'b0)) XOR_T23_consecutive_0 (.a(t0[2]), .b(t0[22]), .z(t0[23][2*(d-1):1]));
    linear_CCHPC1_1_consecutive_d #(.security_order(security_order), .CONF(1'b0)) XOR_T23_consecutive_1 (.a(t1[2]), .b(t1[22]), .z(t1[23][2*(d-1):1]));
    linear_CCHPC1_1_layer0                                                        XOR_T24_layer0        (.a( t[2]), .b( t[10]), .z( t[24]));
    linear_CCHPC1_1_consecutive_d #(.security_order(security_order), .CONF(1'b0)) XOR_T24_consecutive_0 (.a(t0[2]), .b(t0[10]), .z(t0[24][2*(d-1):1]));
    linear_CCHPC1_1_consecutive_d #(.security_order(security_order), .CONF(1'b0)) XOR_T24_consecutive_1 (.a(t1[2]), .b(t1[10]), .z(t1[24][2*(d-1):1]));
    linear_CCHPC1_1_layer0                                                        XOR_T25_layer0        (.a( t[20]), .b( t[17]), .z( t[25]));
    linear_CCHPC1_1_consecutive_d #(.security_order(security_order), .CONF(1'b0)) XOR_T25_consecutive_0 (.a(t0[20]), .b(t0[17]), .z(t0[25][2*(d-1):1]));
    linear_CCHPC1_1_consecutive_d #(.security_order(security_order), .CONF(1'b0)) XOR_T25_consecutive_1 (.a(t1[20]), .b(t1[17]), .z(t1[25][2*(d-1):1]));
    linear_CCHPC1_1_layer0                                                        XOR_T26_layer0        (.a( t[3]), .b( t[16]), .z( t[26]));
    linear_CCHPC1_1_consecutive_d #(.security_order(security_order), .CONF(1'b0)) XOR_T26_consecutive_0 (.a(t0[3]), .b(t0[16]), .z(t0[26][2*(d-1):1]));
    linear_CCHPC1_1_consecutive_d #(.security_order(security_order), .CONF(1'b0)) XOR_T26_consecutive_1 (.a(t1[3]), .b(t1[16]), .z(t1[26][2*(d-1):1]));
    linear_CCHPC1_1_layer0                                                        XOR_T27_layer0        (.a( t[1]), .b( t[12]), .z( t[27]));
    linear_CCHPC1_1_consecutive_d #(.security_order(security_order), .CONF(1'b0)) XOR_T27_consecutive_0 (.a(t0[1]), .b(t0[12]), .z(t0[27][2*(d-1):1]));
    linear_CCHPC1_1_consecutive_d #(.security_order(security_order), .CONF(1'b0)) XOR_T27_consecutive_1 (.a(t1[1]), .b(t1[12]), .z(t1[27][2*(d-1):1]));

    // Middle Stage (Non-linear)

    nonlinear_CCHPC1_1_layer0_d      #(.security_order(security_order), .CONF(2'b00)) AND_M1_layer0        (                         .r( in_r[0]), .a( t[13]), .b( t[6]), .z( m[1]));
    nonlinear_CCHPC1_1_precomp_d     #(.security_order(security_order), .CONF(2'b00)) AND_M1_precomp       (.clk(clk), .prch0(prch0), .prch1(prch1), .r( in_r[0]), .a0( t[13]), .b0( t[6]), .aDR0(t0[13][2*(d-1):1]), .aDR1(t1[13][2*(d-1):1]), .bDR0(t0[6][2*(d-1):1]), .bDR1(t1[6][2*(d-1):1]), .t_in(t_in[0]));
    nonlinear_CCHPC1_1_consecutive_d #(.security_order(security_order), .CONF(2'b00)) AND_M1_consecutive_0 (.clk(clk), .prch(prch0), .aDR(t0[13][2*(d-1):1]), .bDR(t0[6][2*(d-1):1]), .r(in_r0[0]), .t_in(t_in[0]), .zDR(m0[1][2*(d-1):1]));
    nonlinear_CCHPC1_1_consecutive_d #(.security_order(security_order), .CONF(2'b00)) AND_M1_consecutive_1 (.clk(clk), .prch(prch1), .aDR(t1[13][2*(d-1):1]), .bDR(t1[6][2*(d-1):1]), .r(in_r1[0]), .t_in(t_in[0]), .zDR(m1[1][2*(d-1):1]));
    nonlinear_CCHPC1_1_layer0_d      #(.security_order(security_order), .CONF(2'b00)) AND_M2_layer0        (                         .r( in_r[1]), .a( t[23]), .b( t[8]), .z( m[2]));
    nonlinear_CCHPC1_1_precomp_d     #(.security_order(security_order), .CONF(2'b00)) AND_M2_precomp       (.clk(clk), .prch0(prch0), .prch1(prch1), .r( in_r[1]), .a0( t[23]), .b0( t[8]), .aDR0(t0[23][2*(d-1):1]), .aDR1(t1[23][2*(d-1):1]), .bDR0(t0[8][2*(d-1):1]), .bDR1(t1[8][2*(d-1):1]), .t_in(t_in[1]));
    nonlinear_CCHPC1_1_consecutive_d #(.security_order(security_order), .CONF(2'b00)) AND_M2_consecutive_0 (.clk(clk), .prch(prch0), .aDR(t0[23][2*(d-1):1]), .bDR(t0[8][2*(d-1):1]), .r(in_r0[1]), .t_in(t_in[1]), .zDR(m0[2][2*(d-1):1]));
    nonlinear_CCHPC1_1_consecutive_d #(.security_order(security_order), .CONF(2'b00)) AND_M2_consecutive_1 (.clk(clk), .prch(prch1), .aDR(t1[23][2*(d-1):1]), .bDR(t1[8][2*(d-1):1]), .r(in_r1[1]), .t_in(t_in[1]), .zDR(m1[2][2*(d-1):1]));
    linear_CCHPC1_1_layer0                                                        XOR_M3_layer0        (.a( t[14]), .b( m[1]), .z( m[3]));
    linear_CCHPC1_1_consecutive_d #(.security_order(security_order), .CONF(1'b0)) XOR_M3_consecutive_0 (.a(t0[14]), .b(m0[1]), .z(m0[3][2*(d-1):1]));
    linear_CCHPC1_1_consecutive_d #(.security_order(security_order), .CONF(1'b0)) XOR_M3_consecutive_1 (.a(t1[14]), .b(m1[1]), .z(m1[3][2*(d-1):1]));
    nonlinear_CCHPC1_1_layer0_d      #(.security_order(security_order), .CONF(2'b00)) AND_M4_layer0        (                         .r( in_r[2]), .a( t[19]), .b( sboxInput_reg[0]), .z( m[4]));
    nonlinear_CCHPC1_1_precomp_d     #(.security_order(security_order), .CONF(2'b00)) AND_M4_precomp       (.clk(clk), .prch0(prch0), .prch1(prch1), .r( in_r[2]), .a0( t[19]), .b0( sboxInput_reg[0]), .aDR0(t0[19][2*(d-1):1]), .aDR1(t1[19][2*(d-1):1]), .bDR0(sboxInput0_reg[0][2*(d-1):1]), .bDR1(sboxInput1_reg[0][2*(d-1):1]), .t_in(t_in[2]));
    nonlinear_CCHPC1_1_consecutive_d #(.security_order(security_order), .CONF(2'b00)) AND_M4_consecutive_0 (.clk(clk), .prch(prch0), .aDR(t0[19][2*(d-1):1]), .bDR(sboxInput0_reg[0][2*(d-1):1]), .r(in_r0[2]), .t_in(t_in[2]), .zDR(m0[4][2*(d-1):1]));
    nonlinear_CCHPC1_1_consecutive_d #(.security_order(security_order), .CONF(2'b00)) AND_M4_consecutive_1 (.clk(clk), .prch(prch1), .aDR(t1[19][2*(d-1):1]), .bDR(sboxInput1_reg[0][2*(d-1):1]), .r(in_r1[2]), .t_in(t_in[2]), .zDR(m1[4][2*(d-1):1]));
    linear_CCHPC1_1_layer0                                                        XOR_M5_layer0        (.a( m[4]), .b( m[1]), .z( m[5]));
    linear_CCHPC1_1_consecutive_d #(.security_order(security_order), .CONF(1'b0)) XOR_M5_consecutive_0 (.a(m0[4]), .b(m0[1]), .z(m0[5][2*(d-1):1]));
    linear_CCHPC1_1_consecutive_d #(.security_order(security_order), .CONF(1'b0)) XOR_M5_consecutive_1 (.a(m1[4]), .b(m1[1]), .z(m1[5][2*(d-1):1]));
    nonlinear_CCHPC1_1_layer0_d      #(.security_order(security_order), .CONF(2'b00)) AND_M6_layer0        (                         .r( in_r[3]), .a( t[3]), .b( t[16]), .z( m[6]));
    nonlinear_CCHPC1_1_precomp_d     #(.security_order(security_order), .CONF(2'b00)) AND_M6_precomp       (.clk(clk), .prch0(prch0), .prch1(prch1), .r( in_r[3]), .a0( t[3]), .b0( t[16]), .aDR0(t0[3][2*(d-1):1]), .aDR1(t1[3][2*(d-1):1]), .bDR0(t0[16][2*(d-1):1]), .bDR1(t1[16][2*(d-1):1]), .t_in(t_in[3]));
    nonlinear_CCHPC1_1_consecutive_d #(.security_order(security_order), .CONF(2'b00)) AND_M6_consecutive_0 (.clk(clk), .prch(prch0), .aDR(t0[3][2*(d-1):1]), .bDR(t0[16][2*(d-1):1]), .r(in_r0[3]), .t_in(t_in[3]), .zDR(m0[6][2*(d-1):1]));
    nonlinear_CCHPC1_1_consecutive_d #(.security_order(security_order), .CONF(2'b00)) AND_M6_consecutive_1 (.clk(clk), .prch(prch1), .aDR(t1[3][2*(d-1):1]), .bDR(t1[16][2*(d-1):1]), .r(in_r1[3]), .t_in(t_in[3]), .zDR(m1[6][2*(d-1):1]));
    nonlinear_CCHPC1_1_layer0_d      #(.security_order(security_order), .CONF(2'b00)) AND_M7_layer0        (                         .r( in_r[4]), .a( t[22]), .b( t[9]), .z( m[7]));
    nonlinear_CCHPC1_1_precomp_d     #(.security_order(security_order), .CONF(2'b00)) AND_M7_precomp       (.clk(clk), .prch0(prch0), .prch1(prch1), .r( in_r[4]), .a0( t[22]), .b0( t[9]), .aDR0(t0[22][2*(d-1):1]), .aDR1(t1[22][2*(d-1):1]), .bDR0(t0[9][2*(d-1):1]), .bDR1(t1[9][2*(d-1):1]), .t_in(t_in[4]));
    nonlinear_CCHPC1_1_consecutive_d #(.security_order(security_order), .CONF(2'b00)) AND_M7_consecutive_0 (.clk(clk), .prch(prch0), .aDR(t0[22][2*(d-1):1]), .bDR(t0[9][2*(d-1):1]), .r(in_r0[4]), .t_in(t_in[4]), .zDR(m0[7][2*(d-1):1]));
    nonlinear_CCHPC1_1_consecutive_d #(.security_order(security_order), .CONF(2'b00)) AND_M7_consecutive_1 (.clk(clk), .prch(prch1), .aDR(t1[22][2*(d-1):1]), .bDR(t1[9][2*(d-1):1]), .r(in_r1[4]), .t_in(t_in[4]), .zDR(m1[7][2*(d-1):1]));
    linear_CCHPC1_1_layer0                                                        XOR_M8_layer0        (.a( t[26]), .b( m[6]), .z( m[8]));
    linear_CCHPC1_1_consecutive_d #(.security_order(security_order), .CONF(1'b0)) XOR_M8_consecutive_0 (.a(t0[26]), .b(m0[6]), .z(m0[8][2*(d-1):1]));
    linear_CCHPC1_1_consecutive_d #(.security_order(security_order), .CONF(1'b0)) XOR_M8_consecutive_1 (.a(t1[26]), .b(m1[6]), .z(m1[8][2*(d-1):1]));
    nonlinear_CCHPC1_1_layer0_d      #(.security_order(security_order), .CONF(2'b00)) AND_M9_layer0        (                         .r( in_r[5]), .a( t[20]), .b( t[17]), .z( m[9]));
    nonlinear_CCHPC1_1_precomp_d     #(.security_order(security_order), .CONF(2'b00)) AND_M9_precomp       (.clk(clk), .prch0(prch0), .prch1(prch1), .r( in_r[5]), .a0( t[20]), .b0( t[17]), .aDR0(t0[20][2*(d-1):1]), .aDR1(t1[20][2*(d-1):1]), .bDR0(t0[17][2*(d-1):1]), .bDR1(t1[17][2*(d-1):1]), .t_in(t_in[5]));
    nonlinear_CCHPC1_1_consecutive_d #(.security_order(security_order), .CONF(2'b00)) AND_M9_consecutive_0 (.clk(clk), .prch(prch0), .aDR(t0[20][2*(d-1):1]), .bDR(t0[17][2*(d-1):1]), .r(in_r0[5]), .t_in(t_in[5]), .zDR(m0[9][2*(d-1):1]));
    nonlinear_CCHPC1_1_consecutive_d #(.security_order(security_order), .CONF(2'b00)) AND_M9_consecutive_1 (.clk(clk), .prch(prch1), .aDR(t1[20][2*(d-1):1]), .bDR(t1[17][2*(d-1):1]), .r(in_r1[5]), .t_in(t_in[5]), .zDR(m1[9][2*(d-1):1]));
    linear_CCHPC1_1_layer0                                                        XOR_M10_layer0        (.a( m[9]), .b( m[6]), .z( m[10]));
    linear_CCHPC1_1_consecutive_d #(.security_order(security_order), .CONF(1'b0)) XOR_M10_consecutive_0 (.a(m0[9]), .b(m0[6]), .z(m0[10][2*(d-1):1]));
    linear_CCHPC1_1_consecutive_d #(.security_order(security_order), .CONF(1'b0)) XOR_M10_consecutive_1 (.a(m1[9]), .b(m1[6]), .z(m1[10][2*(d-1):1]));
    nonlinear_CCHPC1_1_layer0_d      #(.security_order(security_order), .CONF(2'b00)) AND_M11_layer0        (                         .r( in_r[6]), .a( t[1]), .b( t[15]), .z( m[11]));
    nonlinear_CCHPC1_1_precomp_d     #(.security_order(security_order), .CONF(2'b00)) AND_M11_precomp       (.clk(clk), .prch0(prch0), .prch1(prch1), .r( in_r[6]), .a0( t[1]), .b0( t[15]), .aDR0(t0[1][2*(d-1):1]), .aDR1(t1[1][2*(d-1):1]), .bDR0(t0[15][2*(d-1):1]), .bDR1(t1[15][2*(d-1):1]), .t_in(t_in[6]));
    nonlinear_CCHPC1_1_consecutive_d #(.security_order(security_order), .CONF(2'b00)) AND_M11_consecutive_0 (.clk(clk), .prch(prch0), .aDR(t0[1][2*(d-1):1]), .bDR(t0[15][2*(d-1):1]), .r(in_r0[6]), .t_in(t_in[6]), .zDR(m0[11][2*(d-1):1]));
    nonlinear_CCHPC1_1_consecutive_d #(.security_order(security_order), .CONF(2'b00)) AND_M11_consecutive_1 (.clk(clk), .prch(prch1), .aDR(t1[1][2*(d-1):1]), .bDR(t1[15][2*(d-1):1]), .r(in_r1[6]), .t_in(t_in[6]), .zDR(m1[11][2*(d-1):1]));
    nonlinear_CCHPC1_1_layer0_d      #(.security_order(security_order), .CONF(2'b00)) AND_M12_layer0        (                         .r( in_r[7]), .a( t[4]), .b( t[27]), .z( m[12]));
    nonlinear_CCHPC1_1_precomp_d     #(.security_order(security_order), .CONF(2'b00)) AND_M12_precomp       (.clk(clk), .prch0(prch0), .prch1(prch1), .r( in_r[7]), .a0( t[4]), .b0( t[27]), .aDR0(t0[4][2*(d-1):1]), .aDR1(t1[4][2*(d-1):1]), .bDR0(t0[27][2*(d-1):1]), .bDR1(t1[27][2*(d-1):1]), .t_in(t_in[7]));
    nonlinear_CCHPC1_1_consecutive_d #(.security_order(security_order), .CONF(2'b00)) AND_M12_consecutive_0 (.clk(clk), .prch(prch0), .aDR(t0[4][2*(d-1):1]), .bDR(t0[27][2*(d-1):1]), .r(in_r0[7]), .t_in(t_in[7]), .zDR(m0[12][2*(d-1):1]));
    nonlinear_CCHPC1_1_consecutive_d #(.security_order(security_order), .CONF(2'b00)) AND_M12_consecutive_1 (.clk(clk), .prch(prch1), .aDR(t1[4][2*(d-1):1]), .bDR(t1[27][2*(d-1):1]), .r(in_r1[7]), .t_in(t_in[7]), .zDR(m1[12][2*(d-1):1]));
    linear_CCHPC1_1_layer0                                                        XOR_M13_layer0        (.a( m[12]), .b( m[11]), .z( m[13]));
    linear_CCHPC1_1_consecutive_d #(.security_order(security_order), .CONF(1'b0)) XOR_M13_consecutive_0 (.a(m0[12]), .b(m0[11]), .z(m0[13][2*(d-1):1]));
    linear_CCHPC1_1_consecutive_d #(.security_order(security_order), .CONF(1'b0)) XOR_M13_consecutive_1 (.a(m1[12]), .b(m1[11]), .z(m1[13][2*(d-1):1]));
    nonlinear_CCHPC1_1_layer0_d      #(.security_order(security_order), .CONF(2'b00)) AND_M14_layer0        (                         .r( in_r[8]), .a( t[2]), .b( t[10]), .z( m[14]));
    nonlinear_CCHPC1_1_precomp_d     #(.security_order(security_order), .CONF(2'b00)) AND_M14_precomp       (.clk(clk), .prch0(prch0), .prch1(prch1), .r( in_r[8]), .a0( t[2]), .b0( t[10]), .aDR0(t0[2][2*(d-1):1]), .aDR1(t1[2][2*(d-1):1]), .bDR0(t0[10][2*(d-1):1]), .bDR1(t1[10][2*(d-1):1]), .t_in(t_in[8]));
    nonlinear_CCHPC1_1_consecutive_d #(.security_order(security_order), .CONF(2'b00)) AND_M14_consecutive_0 (.clk(clk), .prch(prch0), .aDR(t0[2][2*(d-1):1]), .bDR(t0[10][2*(d-1):1]), .r(in_r0[8]), .t_in(t_in[8]), .zDR(m0[14][2*(d-1):1]));
    nonlinear_CCHPC1_1_consecutive_d #(.security_order(security_order), .CONF(2'b00)) AND_M14_consecutive_1 (.clk(clk), .prch(prch1), .aDR(t1[2][2*(d-1):1]), .bDR(t1[10][2*(d-1):1]), .r(in_r1[8]), .t_in(t_in[8]), .zDR(m1[14][2*(d-1):1]));
    linear_CCHPC1_1_layer0                                                        XOR_M15_layer0        (.a( m[14]), .b( m[11]), .z( m[15]));
    linear_CCHPC1_1_consecutive_d #(.security_order(security_order), .CONF(1'b0)) XOR_M15_consecutive_0 (.a(m0[14]), .b(m0[11]), .z(m0[15][2*(d-1):1]));
    linear_CCHPC1_1_consecutive_d #(.security_order(security_order), .CONF(1'b0)) XOR_M15_consecutive_1 (.a(m1[14]), .b(m1[11]), .z(m1[15][2*(d-1):1]));
    linear_CCHPC1_1_layer0                                                        XOR_M16_layer0        (.a( m[3]), .b( m[2]), .z( m[16]));
    linear_CCHPC1_1_consecutive_d #(.security_order(security_order), .CONF(1'b0)) XOR_M16_consecutive_0 (.a(m0[3]), .b(m0[2]), .z(m0[16][2*(d-1):1]));
    linear_CCHPC1_1_consecutive_d #(.security_order(security_order), .CONF(1'b0)) XOR_M16_consecutive_1 (.a(m1[3]), .b(m1[2]), .z(m1[16][2*(d-1):1]));
    linear_CCHPC1_1_layer0                                                        XOR_M17_layer0        (.a( m[5]), .b( t[24]), .z( m[17]));
    linear_CCHPC1_1_consecutive_d #(.security_order(security_order), .CONF(1'b0)) XOR_M17_consecutive_0 (.a(m0[5]), .b(t0[24]), .z(m0[17][2*(d-1):1]));
    linear_CCHPC1_1_consecutive_d #(.security_order(security_order), .CONF(1'b0)) XOR_M17_consecutive_1 (.a(m1[5]), .b(t1[24]), .z(m1[17][2*(d-1):1]));
    linear_CCHPC1_1_layer0                                                        XOR_M18_layer0        (.a( m[8]), .b( m[7]), .z( m[18]));
    linear_CCHPC1_1_consecutive_d #(.security_order(security_order), .CONF(1'b0)) XOR_M18_consecutive_0 (.a(m0[8]), .b(m0[7]), .z(m0[18][2*(d-1):1]));
    linear_CCHPC1_1_consecutive_d #(.security_order(security_order), .CONF(1'b0)) XOR_M18_consecutive_1 (.a(m1[8]), .b(m1[7]), .z(m1[18][2*(d-1):1]));
    linear_CCHPC1_1_layer0                                                        XOR_M19_layer0        (.a( m[10]), .b( m[15]), .z( m[19]));
    linear_CCHPC1_1_consecutive_d #(.security_order(security_order), .CONF(1'b0)) XOR_M19_consecutive_0 (.a(m0[10]), .b(m0[15]), .z(m0[19][2*(d-1):1]));
    linear_CCHPC1_1_consecutive_d #(.security_order(security_order), .CONF(1'b0)) XOR_M19_consecutive_1 (.a(m1[10]), .b(m1[15]), .z(m1[19][2*(d-1):1]));
    linear_CCHPC1_1_layer0                                                        XOR_M20_layer0        (.a( m[16]), .b( m[13]), .z( m[20]));
    linear_CCHPC1_1_consecutive_d #(.security_order(security_order), .CONF(1'b0)) XOR_M20_consecutive_0 (.a(m0[16]), .b(m0[13]), .z(m0[20][2*(d-1):1]));
    linear_CCHPC1_1_consecutive_d #(.security_order(security_order), .CONF(1'b0)) XOR_M20_consecutive_1 (.a(m1[16]), .b(m1[13]), .z(m1[20][2*(d-1):1]));
    linear_CCHPC1_1_layer0                                                        XOR_M21_layer0        (.a( m[17]), .b( m[15]), .z( m[21]));
    linear_CCHPC1_1_consecutive_d #(.security_order(security_order), .CONF(1'b0)) XOR_M21_consecutive_0 (.a(m0[17]), .b(m0[15]), .z(m0[21][2*(d-1):1]));
    linear_CCHPC1_1_consecutive_d #(.security_order(security_order), .CONF(1'b0)) XOR_M21_consecutive_1 (.a(m1[17]), .b(m1[15]), .z(m1[21][2*(d-1):1]));
    linear_CCHPC1_1_layer0                                                        XOR_M22_layer0        (.a( m[18]), .b( m[13]), .z( m[22]));
    linear_CCHPC1_1_consecutive_d #(.security_order(security_order), .CONF(1'b0)) XOR_M22_consecutive_0 (.a(m0[18]), .b(m0[13]), .z(m0[22][2*(d-1):1]));
    linear_CCHPC1_1_consecutive_d #(.security_order(security_order), .CONF(1'b0)) XOR_M22_consecutive_1 (.a(m1[18]), .b(m1[13]), .z(m1[22][2*(d-1):1]));
    linear_CCHPC1_1_layer0                                                        XOR_M23_layer0        (.a( m[19]), .b( t[25]), .z( m[23]));
    linear_CCHPC1_1_consecutive_d #(.security_order(security_order), .CONF(1'b0)) XOR_M23_consecutive_0 (.a(m0[19]), .b(t0[25]), .z(m0[23][2*(d-1):1]));
    linear_CCHPC1_1_consecutive_d #(.security_order(security_order), .CONF(1'b0)) XOR_M23_consecutive_1 (.a(m1[19]), .b(t1[25]), .z(m1[23][2*(d-1):1]));

    // -- [HB25] F_{2^4} inverter --------------------------------------------------------------------------------------------
    // -- Vedad Hadžić and Roderick Bloem, Efficient and Composable Masked AES S-BoxDesigns Using Optimized Inverters --------

    wire             inv_g  [3:0];
    wire [2*(d-1):0] inv_g0 [3:0];
    wire [2*(d-1):0] inv_g1 [3:0];

    wire             inv_a  [1:0];
    wire [2*(d-1):0] inv_a0 [1:0];
    wire [2*(d-1):0] inv_a1 [1:0];

    wire             inv_b  [1:0];
    wire [2*(d-1):0] inv_b0 [1:0];
    wire [2*(d-1):0] inv_b1 [1:0];

    wire             inv_c  [1:0];
    wire [2*(d-1):0] inv_c0 [1:0];
    wire [2*(d-1):0] inv_c1 [1:0];

    wire             inv_d  [1:0];
    wire [2*(d-1):0] inv_d0 [1:0];
    wire [2*(d-1):0] inv_d1 [1:0];

    wire             inv_e  [1:0];
    wire [2*(d-1):0] inv_e0 [1:0];
    wire [2*(d-1):0] inv_e1 [1:0];

    wire             inv_f  [1:0];
    wire [2*(d-1):0] inv_f0 [1:0];
    wire [2*(d-1):0] inv_f1 [1:0];

    wire             inv_l  [3:0];
    wire [2*(d-1):0] inv_l0 [3:0];
    wire [2*(d-1):0] inv_l1 [3:0];

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

    generate
        for (i = 0; i < 4; i=i+1) begin : loop_duality_wiring_inv

            assign inv_l0[i][0] = inv_l[i];
            assign inv_l1[i][0] = inv_l[i];

            if (i < 2) begin : duality_wiring_inter

                assign inv_a0[i][0] = inv_a[i];
                assign inv_a1[i][0] = inv_a[i];

                assign inv_b0[i][0] = inv_b[i];
                assign inv_b1[i][0] = inv_b[i];

                assign inv_c0[i][0] = inv_c[i];
                assign inv_c1[i][0] = inv_c[i];

                assign inv_d0[i][0] = inv_d[i];
                assign inv_d1[i][0] = inv_d[i];

                assign inv_e0[i][0] = inv_e[i];
                assign inv_e1[i][0] = inv_e[i];

                assign inv_f0[i][0] = inv_f[i];
                assign inv_f1[i][0] = inv_f[i];

            end

        end
    endgenerate

    // combinational logic

    // a0 = g1 + g0
    linear_CCHPC1_1_layer0                                                        XOR_A0_layer0        (.a( inv_g[1]), .b( inv_g[0]), .z( inv_a[0]));
    linear_CCHPC1_1_consecutive_d #(.security_order(security_order), .CONF(1'b0)) XOR_A0_consecutive_0 (.a(inv_g0[1]), .b(inv_g0[0]), .z(inv_a0[0][2*(d-1):1]));
    linear_CCHPC1_1_consecutive_d #(.security_order(security_order), .CONF(1'b0)) XOR_A0_consecutive_1 (.a(inv_g1[1]), .b(inv_g1[0]), .z(inv_a1[0][2*(d-1):1]));

    // a1 = g3 + g2
    linear_CCHPC1_1_layer0                                                        XOR_A1_layer0        (.a( inv_g[3]), .b( inv_g[2]), .z( inv_a[1]));
    linear_CCHPC1_1_consecutive_d #(.security_order(security_order), .CONF(1'b0)) XOR_A1_consecutive_0 (.a(inv_g0[3]), .b(inv_g0[2]), .z(inv_a0[1][2*(d-1):1]));
    linear_CCHPC1_1_consecutive_d #(.security_order(security_order), .CONF(1'b0)) XOR_A1_consecutive_1 (.a(inv_g1[3]), .b(inv_g1[2]), .z(inv_a1[1][2*(d-1):1]));

    // b0 = g2 x g0
    nonlinear_CCHPC1_1_layer0_d      #(.security_order(security_order), .CONF(2'b00)) AND_B0_layer0        (                         .r( in_r[9]), .a( inv_g[2]), .b( inv_g[0]), .z( inv_b[0]));
    nonlinear_CCHPC1_1_precomp_d     #(.security_order(security_order), .CONF(2'b00)) AND_B0_precomp       (.clk(clk), .prch0(prch0), .prch1(prch1), .r( in_r[9]), .a0( inv_g[2]), .b0( inv_g[0]), .aDR0(inv_g0[2][2*(d-1):1]), .aDR1(inv_g1[2][2*(d-1):1]), .bDR0(inv_g0[0][2*(d-1):1]), .bDR1(inv_g1[0][2*(d-1):1]), .t_in(t_in[9]));
    nonlinear_CCHPC1_1_consecutive_d #(.security_order(security_order), .CONF(2'b00)) AND_B0_consecutive_0 (.clk(clk), .prch(prch0), .aDR(inv_g0[2][2*(d-1):1]), .bDR(inv_g0[0][2*(d-1):1]), .r(in_r0[9]), .t_in(t_in[9]), .zDR(inv_b0[0][2*(d-1):1]));
    nonlinear_CCHPC1_1_consecutive_d #(.security_order(security_order), .CONF(2'b00)) AND_B0_consecutive_1 (.clk(clk), .prch(prch1), .aDR(inv_g1[2][2*(d-1):1]), .bDR(inv_g1[0][2*(d-1):1]), .r(in_r1[9]), .t_in(t_in[9]), .zDR(inv_b1[0][2*(d-1):1]));

    // b1 = g3 x g1
    nonlinear_CCHPC1_1_layer0_d      #(.security_order(security_order), .CONF(2'b00)) AND_B1_layer0        (                         .r( in_r[10]), .a( inv_g[3]), .b( inv_g[1]), .z( inv_b[1]));
    nonlinear_CCHPC1_1_precomp_d     #(.security_order(security_order), .CONF(2'b00)) AND_B1_precomp       (.clk(clk), .prch0(prch0), .prch1(prch1), .r( in_r[10]), .a0( inv_g[3]), .b0( inv_g[1]), .aDR0(inv_g0[3][2*(d-1):1]), .aDR1(inv_g1[3][2*(d-1):1]), .bDR0(inv_g0[1][2*(d-1):1]), .bDR1(inv_g1[1][2*(d-1):1]), .t_in(t_in[10]));
    nonlinear_CCHPC1_1_consecutive_d #(.security_order(security_order), .CONF(2'b00)) AND_B1_consecutive_0 (.clk(clk), .prch(prch0), .aDR(inv_g0[3][2*(d-1):1]), .bDR(inv_g0[1][2*(d-1):1]), .r(in_r0[10]), .t_in(t_in[10]), .zDR(inv_b0[1][2*(d-1):1]));
    nonlinear_CCHPC1_1_consecutive_d #(.security_order(security_order), .CONF(2'b00)) AND_B1_consecutive_1 (.clk(clk), .prch(prch1), .aDR(inv_g1[3][2*(d-1):1]), .bDR(inv_g1[1][2*(d-1):1]), .r(in_r1[10]), .t_in(t_in[10]), .zDR(inv_b1[1][2*(d-1):1]));

    // c0 = a0 + b0
    linear_CCHPC1_1_layer0                                                        XOR_C0_layer0        (.a( inv_a[0]), .b( inv_b[0]), .z( inv_c[0]));
    linear_CCHPC1_1_consecutive_d #(.security_order(security_order), .CONF(1'b0)) XOR_C0_consecutive_0 (.a(inv_a0[0]), .b(inv_b0[0]), .z(inv_c0[0][2*(d-1):1]));
    linear_CCHPC1_1_consecutive_d #(.security_order(security_order), .CONF(1'b0)) XOR_C0_consecutive_1 (.a(inv_a1[0]), .b(inv_b1[0]), .z(inv_c1[0][2*(d-1):1]));

    // c1 = a1 + b0
    linear_CCHPC1_1_layer0                                                        XOR_C1_layer0        (.a( inv_a[1]), .b( inv_b[0]), .z( inv_c[1]));
    linear_CCHPC1_1_consecutive_d #(.security_order(security_order), .CONF(1'b0)) XOR_C1_consecutive_0 (.a(inv_a0[1]), .b(inv_b0[0]), .z(inv_c0[1][2*(d-1):1]));
    linear_CCHPC1_1_consecutive_d #(.security_order(security_order), .CONF(1'b0)) XOR_C1_consecutive_1 (.a(inv_a1[1]), .b(inv_b1[0]), .z(inv_c1[1][2*(d-1):1]));

    // d0 = g0 + b1
    linear_CCHPC1_1_layer0                                                        XOR_D0_layer0        (.a( inv_g[0]), .b( inv_b[1]), .z( inv_d[0]));
    linear_CCHPC1_1_consecutive_d #(.security_order(security_order), .CONF(1'b0)) XOR_D0_consecutive_0 (.a(inv_g0[0]), .b(inv_b0[1]), .z(inv_d0[0][2*(d-1):1]));
    linear_CCHPC1_1_consecutive_d #(.security_order(security_order), .CONF(1'b0)) XOR_D0_consecutive_1 (.a(inv_g1[0]), .b(inv_b1[1]), .z(inv_d1[0][2*(d-1):1]));

    // d1 = g2 + b1
    linear_CCHPC1_1_layer0                                                        XOR_D1_layer0        (.a( inv_g[2]), .b( inv_b[1]), .z( inv_d[1]));
    linear_CCHPC1_1_consecutive_d #(.security_order(security_order), .CONF(1'b0)) XOR_D1_consecutive_0 (.a(inv_g0[2]), .b(inv_b0[1]), .z(inv_d0[1][2*(d-1):1]));
    linear_CCHPC1_1_consecutive_d #(.security_order(security_order), .CONF(1'b0)) XOR_D1_consecutive_1 (.a(inv_g1[2]), .b(inv_b1[1]), .z(inv_d1[1][2*(d-1):1]));

    // e0 = g3 x c0
    nonlinear_CCHPC1_1_layer0_d      #(.security_order(security_order), .CONF(2'b00)) AND_E0_layer0        (                         .r( in_r[11]), .a( inv_g[3]), .b( inv_c[0]), .z( inv_e[0]));
    nonlinear_CCHPC1_1_precomp_d     #(.security_order(security_order), .CONF(2'b00)) AND_E0_precomp       (.clk(clk), .prch0(prch0), .prch1(prch1), .r( in_r[11]), .a0( inv_g[3]), .b0( inv_c[0]), .aDR0(inv_g0[3][2*(d-1):1]), .aDR1(inv_g1[3][2*(d-1):1]), .bDR0(inv_c0[0][2*(d-1):1]), .bDR1(inv_c1[0][2*(d-1):1]), .t_in(t_in[11]));
    nonlinear_CCHPC1_1_consecutive_d #(.security_order(security_order), .CONF(2'b00)) AND_E0_consecutive_0 (.clk(clk), .prch(prch0), .aDR(inv_g0[3][2*(d-1):1]), .bDR(inv_c0[0][2*(d-1):1]), .r(in_r0[11]), .t_in(t_in[11]), .zDR(inv_e0[0][2*(d-1):1]));
    nonlinear_CCHPC1_1_consecutive_d #(.security_order(security_order), .CONF(2'b00)) AND_E0_consecutive_1 (.clk(clk), .prch(prch1), .aDR(inv_g1[3][2*(d-1):1]), .bDR(inv_c1[0][2*(d-1):1]), .r(in_r1[11]), .t_in(t_in[11]), .zDR(inv_e1[0][2*(d-1):1]));

    // e1 = g1 x c1
    nonlinear_CCHPC1_1_layer0_d      #(.security_order(security_order), .CONF(2'b00)) AND_E1_layer0        (                         .r( in_r[12]), .a( inv_g[1]), .b( inv_c[1]), .z( inv_e[1]));
    nonlinear_CCHPC1_1_precomp_d     #(.security_order(security_order), .CONF(2'b00)) AND_E1_precomp       (.clk(clk), .prch0(prch0), .prch1(prch1), .r( in_r[12]), .a0( inv_g[1]), .b0( inv_c[1]), .aDR0(inv_g0[1][2*(d-1):1]), .aDR1(inv_g1[1][2*(d-1):1]), .bDR0(inv_c0[1][2*(d-1):1]), .bDR1(inv_c1[1][2*(d-1):1]), .t_in(t_in[12]));
    nonlinear_CCHPC1_1_consecutive_d #(.security_order(security_order), .CONF(2'b00)) AND_E1_consecutive_0 (.clk(clk), .prch(prch0), .aDR(inv_g0[1][2*(d-1):1]), .bDR(inv_c0[1][2*(d-1):1]), .r(in_r0[12]), .t_in(t_in[12]), .zDR(inv_e0[1][2*(d-1):1]));
    nonlinear_CCHPC1_1_consecutive_d #(.security_order(security_order), .CONF(2'b00)) AND_E1_consecutive_1 (.clk(clk), .prch(prch1), .aDR(inv_g1[1][2*(d-1):1]), .bDR(inv_c1[1][2*(d-1):1]), .r(in_r1[12]), .t_in(t_in[12]), .zDR(inv_e1[1][2*(d-1):1]));

    // f0 = a1 x d0
    nonlinear_CCHPC1_1_layer0_d      #(.security_order(security_order), .CONF(2'b00)) AND_F0_layer0        (                         .r( in_r[13]), .a( inv_a[1]), .b( inv_d[0]), .z( inv_f[0]));
    nonlinear_CCHPC1_1_precomp_d     #(.security_order(security_order), .CONF(2'b00)) AND_F0_precomp       (.clk(clk), .prch0(prch0), .prch1(prch1), .r( in_r[13]), .a0( inv_a[1]), .b0( inv_d[0]), .aDR0(inv_a0[1][2*(d-1):1]), .aDR1(inv_a1[1][2*(d-1):1]), .bDR0(inv_d0[0][2*(d-1):1]), .bDR1(inv_d1[0][2*(d-1):1]), .t_in(t_in[13]));
    nonlinear_CCHPC1_1_consecutive_d #(.security_order(security_order), .CONF(2'b00)) AND_F0_consecutive_0 (.clk(clk), .prch(prch0), .aDR(inv_a0[1][2*(d-1):1]), .bDR(inv_d0[0][2*(d-1):1]), .r(in_r0[13]), .t_in(t_in[13]), .zDR(inv_f0[0][2*(d-1):1]));
    nonlinear_CCHPC1_1_consecutive_d #(.security_order(security_order), .CONF(2'b00)) AND_F0_consecutive_1 (.clk(clk), .prch(prch1), .aDR(inv_a1[1][2*(d-1):1]), .bDR(inv_d1[0][2*(d-1):1]), .r(in_r1[13]), .t_in(t_in[13]), .zDR(inv_f1[0][2*(d-1):1]));

    // f1 = a0 x d1
    nonlinear_CCHPC1_1_layer0_d      #(.security_order(security_order), .CONF(2'b00)) AND_F1_layer0        (                         .r( in_r[14]), .a( inv_a[0]), .b( inv_d[1]), .z( inv_f[1]));
    nonlinear_CCHPC1_1_precomp_d     #(.security_order(security_order), .CONF(2'b00)) AND_F1_precomp       (.clk(clk), .prch0(prch0), .prch1(prch1), .r( in_r[14]), .a0( inv_a[0]), .b0( inv_d[1]), .aDR0(inv_a0[0][2*(d-1):1]), .aDR1(inv_a1[0][2*(d-1):1]), .bDR0(inv_d0[1][2*(d-1):1]), .bDR1(inv_d1[1][2*(d-1):1]), .t_in(t_in[14]));
    nonlinear_CCHPC1_1_consecutive_d #(.security_order(security_order), .CONF(2'b00)) AND_F1_consecutive_0 (.clk(clk), .prch(prch0), .aDR(inv_a0[0][2*(d-1):1]), .bDR(inv_d0[1][2*(d-1):1]), .r(in_r0[14]), .t_in(t_in[14]), .zDR(inv_f0[1][2*(d-1):1]));
    nonlinear_CCHPC1_1_consecutive_d #(.security_order(security_order), .CONF(2'b00)) AND_F1_consecutive_1 (.clk(clk), .prch(prch1), .aDR(inv_a1[0][2*(d-1):1]), .bDR(inv_d1[1][2*(d-1):1]), .r(in_r1[14]), .t_in(t_in[14]), .zDR(inv_f1[1][2*(d-1):1]));

    // l3 = a0 + e1
    linear_CCHPC1_1_layer0                                                        XOR_L3_layer0        (.a( inv_a[0]), .b( inv_e[1]), .z( inv_l[3]));
    linear_CCHPC1_1_consecutive_d #(.security_order(security_order), .CONF(1'b0)) XOR_L3_consecutive_0 (.a(inv_a0[0]), .b(inv_e0[1]), .z(inv_l0[3][2*(d-1):1]));
    linear_CCHPC1_1_consecutive_d #(.security_order(security_order), .CONF(1'b0)) XOR_L3_consecutive_1 (.a(inv_a1[0]), .b(inv_e1[1]), .z(inv_l1[3][2*(d-1):1]));

    // l2 = g0 + f1
    linear_CCHPC1_1_layer0                                                        XOR_L2_layer0        (.a( inv_g[0]), .b( inv_f[1]), .z( inv_l[2]));
    linear_CCHPC1_1_consecutive_d #(.security_order(security_order), .CONF(1'b0)) XOR_L2_consecutive_0 (.a(inv_g0[0]), .b(inv_f0[1]), .z(inv_l0[2][2*(d-1):1]));
    linear_CCHPC1_1_consecutive_d #(.security_order(security_order), .CONF(1'b0)) XOR_L2_consecutive_1 (.a(inv_g1[0]), .b(inv_f1[1]), .z(inv_l1[2][2*(d-1):1]));

    // l1 = a1 + e0
    linear_CCHPC1_1_layer0                                                        XOR_L1_layer0        (.a( inv_a[1]), .b( inv_e[0]), .z( inv_l[1]));
    linear_CCHPC1_1_consecutive_d #(.security_order(security_order), .CONF(1'b0)) XOR_L1_consecutive_0 (.a(inv_a0[1]), .b(inv_e0[0]), .z(inv_l0[1][2*(d-1):1]));
    linear_CCHPC1_1_consecutive_d #(.security_order(security_order), .CONF(1'b0)) XOR_L1_consecutive_1 (.a(inv_a1[1]), .b(inv_e1[0]), .z(inv_l1[1][2*(d-1):1]));

    // l0 = g2 + f0
    linear_CCHPC1_1_layer0                                                        XOR_L0_layer0        (.a( inv_g[2]), .b( inv_f[0]), .z( inv_l[0]));
    linear_CCHPC1_1_consecutive_d #(.security_order(security_order), .CONF(1'b0)) XOR_L0_consecutive_0 (.a(inv_g0[2]), .b(inv_f0[0]), .z(inv_l0[0][2*(d-1):1]));
    linear_CCHPC1_1_consecutive_d #(.security_order(security_order), .CONF(1'b0)) XOR_L0_consecutive_1 (.a(inv_g1[2]), .b(inv_f1[0]), .z(inv_l1[0][2*(d-1):1]));

    // output mapping
    assign m[37]             = inv_l[0];
    assign m0[37][2*(d-1):1] = inv_l0[0][2*(d-1):1];
    assign m1[37][2*(d-1):1] = inv_l1[0][2*(d-1):1];

    assign m[38]             = inv_l[1];
    assign m0[38][2*(d-1):1] = inv_l0[1][2*(d-1):1];
    assign m1[38][2*(d-1):1] = inv_l1[1][2*(d-1):1];

    assign m[39]             = inv_l[2];
    assign m0[39][2*(d-1):1] = inv_l0[2][2*(d-1):1];
    assign m1[39][2*(d-1):1] = inv_l1[2][2*(d-1):1];

    assign m[40]             = inv_l[3];
    assign m0[40][2*(d-1):1] = inv_l0[3][2*(d-1):1];
    assign m1[40][2*(d-1):1] = inv_l1[3][2*(d-1):1];

    // --------------------------------------------------------------------------------------------------------------

    linear_CCHPC1_1_layer0                                                        XOR_M41_layer0        (.a( m[38]), .b( m[40]), .z( m[41]));
    linear_CCHPC1_1_consecutive_d #(.security_order(security_order), .CONF(1'b0)) XOR_M41_consecutive_0 (.a(m0[38]), .b(m0[40]), .z(m0[41][2*(d-1):1]));
    linear_CCHPC1_1_consecutive_d #(.security_order(security_order), .CONF(1'b0)) XOR_M41_consecutive_1 (.a(m1[38]), .b(m1[40]), .z(m1[41][2*(d-1):1]));
    linear_CCHPC1_1_layer0                                                        XOR_M42_layer0        (.a( m[37]), .b( m[39]), .z( m[42]));
    linear_CCHPC1_1_consecutive_d #(.security_order(security_order), .CONF(1'b0)) XOR_M42_consecutive_0 (.a(m0[37]), .b(m0[39]), .z(m0[42][2*(d-1):1]));
    linear_CCHPC1_1_consecutive_d #(.security_order(security_order), .CONF(1'b0)) XOR_M42_consecutive_1 (.a(m1[37]), .b(m1[39]), .z(m1[42][2*(d-1):1]));
    linear_CCHPC1_1_layer0                                                        XOR_M43_layer0        (.a( m[37]), .b( m[38]), .z( m[43]));
    linear_CCHPC1_1_consecutive_d #(.security_order(security_order), .CONF(1'b0)) XOR_M43_consecutive_0 (.a(m0[37]), .b(m0[38]), .z(m0[43][2*(d-1):1]));
    linear_CCHPC1_1_consecutive_d #(.security_order(security_order), .CONF(1'b0)) XOR_M43_consecutive_1 (.a(m1[37]), .b(m1[38]), .z(m1[43][2*(d-1):1]));
    linear_CCHPC1_1_layer0                                                        XOR_M44_layer0        (.a( m[39]), .b( m[40]), .z( m[44]));
    linear_CCHPC1_1_consecutive_d #(.security_order(security_order), .CONF(1'b0)) XOR_M44_consecutive_0 (.a(m0[39]), .b(m0[40]), .z(m0[44][2*(d-1):1]));
    linear_CCHPC1_1_consecutive_d #(.security_order(security_order), .CONF(1'b0)) XOR_M44_consecutive_1 (.a(m1[39]), .b(m1[40]), .z(m1[44][2*(d-1):1]));
    linear_CCHPC1_1_layer0                                                        XOR_M45_layer0        (.a( m[42]), .b( m[41]), .z( m[45]));
    linear_CCHPC1_1_consecutive_d #(.security_order(security_order), .CONF(1'b0)) XOR_M45_consecutive_0 (.a(m0[42]), .b(m0[41]), .z(m0[45][2*(d-1):1]));
    linear_CCHPC1_1_consecutive_d #(.security_order(security_order), .CONF(1'b0)) XOR_M45_consecutive_1 (.a(m1[42]), .b(m1[41]), .z(m1[45][2*(d-1):1]));

    nonlinear_CCHPC1_1_layer0_d            #(.security_order(security_order), .CONF(2'b00)) AND_M46_layer0        (                         .r( in_r[15]), .a( m[44]), .b( t[6]), .z( m[46]));
    nonlinear_CCHPC1_1_precomp_DR2SR_d     #(.security_order(security_order), .CONF(2'b00)) AND_M46_precomp       (.clk(clk), .prch0(prch0), .prch1(prch1), .r( in_r[15]), .a0( m[44]), .b0( t[6]), .aDR0(m0[44][2*(d-1):1]), .aDR1(m1[44][2*(d-1):1]), .bDR0(t0[6][2*(d-1):1]), .bDR1(t1[6][2*(d-1):1]), .t_in(t_in_DR2SR[0]));
    nonlinear_CCHPC1_1_consecutive_DR2SR_d #(.security_order(security_order), .CONF(2'b00)) AND_M46_consecutive_0 (.clk(clk), .prch(prch0), .aDR(m0[44][2*(d-1):1]), .bDR(t0[6][2*(d-1):1]), .r(in_r0[15]), .t_in(t_in_DR2SR[0]), .z(m0[46][d-1:1]));
    nonlinear_CCHPC1_1_consecutive_DR2SR_d #(.security_order(security_order), .CONF(2'b00)) AND_M46_consecutive_1 (.clk(clk), .prch(prch1), .aDR(m1[44][2*(d-1):1]), .bDR(t1[6][2*(d-1):1]), .r(in_r1[15]), .t_in(t_in_DR2SR[0]), .z(m1[46][d-1:1]));
    nonlinear_CCHPC1_1_layer0_d            #(.security_order(security_order), .CONF(2'b00)) AND_M47_layer0        (                         .r( in_r[16]), .a( m[40]), .b( t[8]), .z( m[47]));
    nonlinear_CCHPC1_1_precomp_DR2SR_d     #(.security_order(security_order), .CONF(2'b00)) AND_M47_precomp       (.clk(clk), .prch0(prch0), .prch1(prch1), .r( in_r[16]), .a0( m[40]), .b0( t[8]), .aDR0(m0[40][2*(d-1):1]), .aDR1(m1[40][2*(d-1):1]), .bDR0(t0[8][2*(d-1):1]), .bDR1(t1[8][2*(d-1):1]), .t_in(t_in_DR2SR[1]));
    nonlinear_CCHPC1_1_consecutive_DR2SR_d #(.security_order(security_order), .CONF(2'b00)) AND_M47_consecutive_0 (.clk(clk), .prch(prch0), .aDR(m0[40][2*(d-1):1]), .bDR(t0[8][2*(d-1):1]), .r(in_r0[16]), .t_in(t_in_DR2SR[1]), .z(m0[47][d-1:1]));
    nonlinear_CCHPC1_1_consecutive_DR2SR_d #(.security_order(security_order), .CONF(2'b00)) AND_M47_consecutive_1 (.clk(clk), .prch(prch1), .aDR(m1[40][2*(d-1):1]), .bDR(t1[8][2*(d-1):1]), .r(in_r1[16]), .t_in(t_in_DR2SR[1]), .z(m1[47][d-1:1]));
    nonlinear_CCHPC1_1_layer0_d            #(.security_order(security_order), .CONF(2'b00)) AND_M48_layer0        (                         .r( in_r[17]), .a( m[39]), .b( sboxInput_reg[0]), .z( m[48]));
    nonlinear_CCHPC1_1_precomp_DR2SR_d     #(.security_order(security_order), .CONF(2'b00)) AND_M48_precomp       (.clk(clk), .prch0(prch0), .prch1(prch1), .r( in_r[17]), .a0( m[39]), .b0( sboxInput_reg[0]), .aDR0(m0[39][2*(d-1):1]), .aDR1(m1[39][2*(d-1):1]), .bDR0(sboxInput0_reg[0][2*(d-1):1]), .bDR1(sboxInput1_reg[0][2*(d-1):1]), .t_in(t_in_DR2SR[2]));
    nonlinear_CCHPC1_1_consecutive_DR2SR_d #(.security_order(security_order), .CONF(2'b00)) AND_M48_consecutive_0 (.clk(clk), .prch(prch0), .aDR(m0[39][2*(d-1):1]), .bDR(sboxInput0_reg[0][2*(d-1):1]), .r(in_r0[17]), .t_in(t_in_DR2SR[2]), .z(m0[48][d-1:1]));
    nonlinear_CCHPC1_1_consecutive_DR2SR_d #(.security_order(security_order), .CONF(2'b00)) AND_M48_consecutive_1 (.clk(clk), .prch(prch1), .aDR(m1[39][2*(d-1):1]), .bDR(sboxInput1_reg[0][2*(d-1):1]), .r(in_r1[17]), .t_in(t_in_DR2SR[2]), .z(m1[48][d-1:1]));
    nonlinear_CCHPC1_1_layer0_d            #(.security_order(security_order), .CONF(2'b00)) AND_M49_layer0        (                         .r( in_r[18]), .a( m[43]), .b( t[16]), .z( m[49]));
    nonlinear_CCHPC1_1_precomp_DR2SR_d     #(.security_order(security_order), .CONF(2'b00)) AND_M49_precomp       (.clk(clk), .prch0(prch0), .prch1(prch1), .r( in_r[18]), .a0( m[43]), .b0( t[16]), .aDR0(m0[43][2*(d-1):1]), .aDR1(m1[43][2*(d-1):1]), .bDR0(t0[16][2*(d-1):1]), .bDR1(t1[16][2*(d-1):1]), .t_in(t_in_DR2SR[3]));
    nonlinear_CCHPC1_1_consecutive_DR2SR_d #(.security_order(security_order), .CONF(2'b00)) AND_M49_consecutive_0 (.clk(clk), .prch(prch0), .aDR(m0[43][2*(d-1):1]), .bDR(t0[16][2*(d-1):1]), .r(in_r0[18]), .t_in(t_in_DR2SR[3]), .z(m0[49][d-1:1]));
    nonlinear_CCHPC1_1_consecutive_DR2SR_d #(.security_order(security_order), .CONF(2'b00)) AND_M49_consecutive_1 (.clk(clk), .prch(prch1), .aDR(m1[43][2*(d-1):1]), .bDR(t1[16][2*(d-1):1]), .r(in_r1[18]), .t_in(t_in_DR2SR[3]), .z(m1[49][d-1:1]));
    nonlinear_CCHPC1_1_layer0_d            #(.security_order(security_order), .CONF(2'b00)) AND_M50_layer0        (                         .r( in_r[19]), .a( m[38]), .b( t[9]), .z( m[50]));
    nonlinear_CCHPC1_1_precomp_DR2SR_d     #(.security_order(security_order), .CONF(2'b00)) AND_M50_precomp       (.clk(clk), .prch0(prch0), .prch1(prch1), .r( in_r[19]), .a0( m[38]), .b0( t[9]), .aDR0(m0[38][2*(d-1):1]), .aDR1(m1[38][2*(d-1):1]), .bDR0(t0[9][2*(d-1):1]), .bDR1(t1[9][2*(d-1):1]), .t_in(t_in_DR2SR[4]));
    nonlinear_CCHPC1_1_consecutive_DR2SR_d #(.security_order(security_order), .CONF(2'b00)) AND_M50_consecutive_0 (.clk(clk), .prch(prch0), .aDR(m0[38][2*(d-1):1]), .bDR(t0[9][2*(d-1):1]), .r(in_r0[19]), .t_in(t_in_DR2SR[4]), .z(m0[50][d-1:1]));
    nonlinear_CCHPC1_1_consecutive_DR2SR_d #(.security_order(security_order), .CONF(2'b00)) AND_M50_consecutive_1 (.clk(clk), .prch(prch1), .aDR(m1[38][2*(d-1):1]), .bDR(t1[9][2*(d-1):1]), .r(in_r1[19]), .t_in(t_in_DR2SR[4]), .z(m1[50][d-1:1]));
    nonlinear_CCHPC1_1_layer0_d            #(.security_order(security_order), .CONF(2'b00)) AND_M51_layer0        (                         .r( in_r[20]), .a( m[37]), .b( t[17]), .z( m[51]));
    nonlinear_CCHPC1_1_precomp_DR2SR_d     #(.security_order(security_order), .CONF(2'b00)) AND_M51_precomp       (.clk(clk), .prch0(prch0), .prch1(prch1), .r( in_r[20]), .a0( m[37]), .b0( t[17]), .aDR0(m0[37][2*(d-1):1]), .aDR1(m1[37][2*(d-1):1]), .bDR0(t0[17][2*(d-1):1]), .bDR1(t1[17][2*(d-1):1]), .t_in(t_in_DR2SR[5]));
    nonlinear_CCHPC1_1_consecutive_DR2SR_d #(.security_order(security_order), .CONF(2'b00)) AND_M51_consecutive_0 (.clk(clk), .prch(prch0), .aDR(m0[37][2*(d-1):1]), .bDR(t0[17][2*(d-1):1]), .r(in_r0[20]), .t_in(t_in_DR2SR[5]), .z(m0[51][d-1:1]));
    nonlinear_CCHPC1_1_consecutive_DR2SR_d #(.security_order(security_order), .CONF(2'b00)) AND_M51_consecutive_1 (.clk(clk), .prch(prch1), .aDR(m1[37][2*(d-1):1]), .bDR(t1[17][2*(d-1):1]), .r(in_r1[20]), .t_in(t_in_DR2SR[5]), .z(m1[51][d-1:1]));
    nonlinear_CCHPC1_1_layer0_d            #(.security_order(security_order), .CONF(2'b00)) AND_M52_layer0        (                         .r( in_r[21]), .a( m[42]), .b( t[15]), .z( m[52]));
    nonlinear_CCHPC1_1_precomp_DR2SR_d     #(.security_order(security_order), .CONF(2'b00)) AND_M52_precomp       (.clk(clk), .prch0(prch0), .prch1(prch1), .r( in_r[21]), .a0( m[42]), .b0( t[15]), .aDR0(m0[42][2*(d-1):1]), .aDR1(m1[42][2*(d-1):1]), .bDR0(t0[15][2*(d-1):1]), .bDR1(t1[15][2*(d-1):1]), .t_in(t_in_DR2SR[6]));
    nonlinear_CCHPC1_1_consecutive_DR2SR_d #(.security_order(security_order), .CONF(2'b00)) AND_M52_consecutive_0 (.clk(clk), .prch(prch0), .aDR(m0[42][2*(d-1):1]), .bDR(t0[15][2*(d-1):1]), .r(in_r0[21]), .t_in(t_in_DR2SR[6]), .z(m0[52][d-1:1]));
    nonlinear_CCHPC1_1_consecutive_DR2SR_d #(.security_order(security_order), .CONF(2'b00)) AND_M52_consecutive_1 (.clk(clk), .prch(prch1), .aDR(m1[42][2*(d-1):1]), .bDR(t1[15][2*(d-1):1]), .r(in_r1[21]), .t_in(t_in_DR2SR[6]), .z(m1[52][d-1:1]));
    nonlinear_CCHPC1_1_layer0_d            #(.security_order(security_order), .CONF(2'b00)) AND_M53_layer0        (                         .r( in_r[22]), .a( m[45]), .b( t[27]), .z( m[53]));
    nonlinear_CCHPC1_1_precomp_DR2SR_d     #(.security_order(security_order), .CONF(2'b00)) AND_M53_precomp       (.clk(clk), .prch0(prch0), .prch1(prch1), .r( in_r[22]), .a0( m[45]), .b0( t[27]), .aDR0(m0[45][2*(d-1):1]), .aDR1(m1[45][2*(d-1):1]), .bDR0(t0[27][2*(d-1):1]), .bDR1(t1[27][2*(d-1):1]), .t_in(t_in_DR2SR[7]));
    nonlinear_CCHPC1_1_consecutive_DR2SR_d #(.security_order(security_order), .CONF(2'b00)) AND_M53_consecutive_0 (.clk(clk), .prch(prch0), .aDR(m0[45][2*(d-1):1]), .bDR(t0[27][2*(d-1):1]), .r(in_r0[22]), .t_in(t_in_DR2SR[7]), .z(m0[53][d-1:1]));
    nonlinear_CCHPC1_1_consecutive_DR2SR_d #(.security_order(security_order), .CONF(2'b00)) AND_M53_consecutive_1 (.clk(clk), .prch(prch1), .aDR(m1[45][2*(d-1):1]), .bDR(t1[27][2*(d-1):1]), .r(in_r1[22]), .t_in(t_in_DR2SR[7]), .z(m1[53][d-1:1]));
    nonlinear_CCHPC1_1_layer0_d            #(.security_order(security_order), .CONF(2'b00)) AND_M54_layer0        (                         .r( in_r[23]), .a( m[41]), .b( t[10]), .z( m[54]));
    nonlinear_CCHPC1_1_precomp_DR2SR_d     #(.security_order(security_order), .CONF(2'b00)) AND_M54_precomp       (.clk(clk), .prch0(prch0), .prch1(prch1), .r( in_r[23]), .a0( m[41]), .b0( t[10]), .aDR0(m0[41][2*(d-1):1]), .aDR1(m1[41][2*(d-1):1]), .bDR0(t0[10][2*(d-1):1]), .bDR1(t1[10][2*(d-1):1]), .t_in(t_in_DR2SR[8]));
    nonlinear_CCHPC1_1_consecutive_DR2SR_d #(.security_order(security_order), .CONF(2'b00)) AND_M54_consecutive_0 (.clk(clk), .prch(prch0), .aDR(m0[41][2*(d-1):1]), .bDR(t0[10][2*(d-1):1]), .r(in_r0[23]), .t_in(t_in_DR2SR[8]), .z(m0[54][d-1:1]));
    nonlinear_CCHPC1_1_consecutive_DR2SR_d #(.security_order(security_order), .CONF(2'b00)) AND_M54_consecutive_1 (.clk(clk), .prch(prch1), .aDR(m1[41][2*(d-1):1]), .bDR(t1[10][2*(d-1):1]), .r(in_r1[23]), .t_in(t_in_DR2SR[8]), .z(m1[54][d-1:1]));
    nonlinear_CCHPC1_1_layer0_d            #(.security_order(security_order), .CONF(2'b00)) AND_M55_layer0        (                         .r( in_r[24]), .a( m[44]), .b( t[13]), .z( m[55]));
    nonlinear_CCHPC1_1_precomp_DR2SR_d     #(.security_order(security_order), .CONF(2'b00)) AND_M55_precomp       (.clk(clk), .prch0(prch0), .prch1(prch1), .r( in_r[24]), .a0( m[44]), .b0( t[13]), .aDR0(m0[44][2*(d-1):1]), .aDR1(m1[44][2*(d-1):1]), .bDR0(t0[13][2*(d-1):1]), .bDR1(t1[13][2*(d-1):1]), .t_in(t_in_DR2SR[9]));
    nonlinear_CCHPC1_1_consecutive_DR2SR_d #(.security_order(security_order), .CONF(2'b00)) AND_M55_consecutive_0 (.clk(clk), .prch(prch0), .aDR(m0[44][2*(d-1):1]), .bDR(t0[13][2*(d-1):1]), .r(in_r0[24]), .t_in(t_in_DR2SR[9]), .z(m0[55][d-1:1]));
    nonlinear_CCHPC1_1_consecutive_DR2SR_d #(.security_order(security_order), .CONF(2'b00)) AND_M55_consecutive_1 (.clk(clk), .prch(prch1), .aDR(m1[44][2*(d-1):1]), .bDR(t1[13][2*(d-1):1]), .r(in_r1[24]), .t_in(t_in_DR2SR[9]), .z(m1[55][d-1:1]));
    nonlinear_CCHPC1_1_layer0_d            #(.security_order(security_order), .CONF(2'b00)) AND_M56_layer0        (                         .r( in_r[25]), .a( m[40]), .b( t[23]), .z( m[56]));
    nonlinear_CCHPC1_1_precomp_DR2SR_d     #(.security_order(security_order), .CONF(2'b00)) AND_M56_precomp       (.clk(clk), .prch0(prch0), .prch1(prch1), .r( in_r[25]), .a0( m[40]), .b0( t[23]), .aDR0(m0[40][2*(d-1):1]), .aDR1(m1[40][2*(d-1):1]), .bDR0(t0[23][2*(d-1):1]), .bDR1(t1[23][2*(d-1):1]), .t_in(t_in_DR2SR[10]));
    nonlinear_CCHPC1_1_consecutive_DR2SR_d #(.security_order(security_order), .CONF(2'b00)) AND_M56_consecutive_0 (.clk(clk), .prch(prch0), .aDR(m0[40][2*(d-1):1]), .bDR(t0[23][2*(d-1):1]), .r(in_r0[25]), .t_in(t_in_DR2SR[10]), .z(m0[56][d-1:1]));
    nonlinear_CCHPC1_1_consecutive_DR2SR_d #(.security_order(security_order), .CONF(2'b00)) AND_M56_consecutive_1 (.clk(clk), .prch(prch1), .aDR(m1[40][2*(d-1):1]), .bDR(t1[23][2*(d-1):1]), .r(in_r1[25]), .t_in(t_in_DR2SR[10]), .z(m1[56][d-1:1]));
    nonlinear_CCHPC1_1_layer0_d            #(.security_order(security_order), .CONF(2'b00)) AND_M57_layer0        (                         .r( in_r[26]), .a( m[39]), .b( t[19]), .z( m[57]));
    nonlinear_CCHPC1_1_precomp_DR2SR_d     #(.security_order(security_order), .CONF(2'b00)) AND_M57_precomp       (.clk(clk), .prch0(prch0), .prch1(prch1), .r( in_r[26]), .a0( m[39]), .b0( t[19]), .aDR0(m0[39][2*(d-1):1]), .aDR1(m1[39][2*(d-1):1]), .bDR0(t0[19][2*(d-1):1]), .bDR1(t1[19][2*(d-1):1]), .t_in(t_in_DR2SR[11]));
    nonlinear_CCHPC1_1_consecutive_DR2SR_d #(.security_order(security_order), .CONF(2'b00)) AND_M57_consecutive_0 (.clk(clk), .prch(prch0), .aDR(m0[39][2*(d-1):1]), .bDR(t0[19][2*(d-1):1]), .r(in_r0[26]), .t_in(t_in_DR2SR[11]), .z(m0[57][d-1:1]));
    nonlinear_CCHPC1_1_consecutive_DR2SR_d #(.security_order(security_order), .CONF(2'b00)) AND_M57_consecutive_1 (.clk(clk), .prch(prch1), .aDR(m1[39][2*(d-1):1]), .bDR(t1[19][2*(d-1):1]), .r(in_r1[26]), .t_in(t_in_DR2SR[11]), .z(m1[57][d-1:1]));
    nonlinear_CCHPC1_1_layer0_d            #(.security_order(security_order), .CONF(2'b00)) AND_M58_layer0        (                         .r( in_r[27]), .a( m[43]), .b( t[3]), .z( m[58]));
    nonlinear_CCHPC1_1_precomp_DR2SR_d     #(.security_order(security_order), .CONF(2'b00)) AND_M58_precomp       (.clk(clk), .prch0(prch0), .prch1(prch1), .r( in_r[27]), .a0( m[43]), .b0( t[3]), .aDR0(m0[43][2*(d-1):1]), .aDR1(m1[43][2*(d-1):1]), .bDR0(t0[3][2*(d-1):1]), .bDR1(t1[3][2*(d-1):1]), .t_in(t_in_DR2SR[12]));
    nonlinear_CCHPC1_1_consecutive_DR2SR_d #(.security_order(security_order), .CONF(2'b00)) AND_M58_consecutive_0 (.clk(clk), .prch(prch0), .aDR(m0[43][2*(d-1):1]), .bDR(t0[3][2*(d-1):1]), .r(in_r0[27]), .t_in(t_in_DR2SR[12]), .z(m0[58][d-1:1]));
    nonlinear_CCHPC1_1_consecutive_DR2SR_d #(.security_order(security_order), .CONF(2'b00)) AND_M58_consecutive_1 (.clk(clk), .prch(prch1), .aDR(m1[43][2*(d-1):1]), .bDR(t1[3][2*(d-1):1]), .r(in_r1[27]), .t_in(t_in_DR2SR[12]), .z(m1[58][d-1:1]));
    nonlinear_CCHPC1_1_layer0_d            #(.security_order(security_order), .CONF(2'b00)) AND_M59_layer0        (                         .r( in_r[28]), .a( m[38]), .b( t[22]), .z( m[59]));
    nonlinear_CCHPC1_1_precomp_DR2SR_d     #(.security_order(security_order), .CONF(2'b00)) AND_M59_precomp       (.clk(clk), .prch0(prch0), .prch1(prch1), .r( in_r[28]), .a0( m[38]), .b0( t[22]), .aDR0(m0[38][2*(d-1):1]), .aDR1(m1[38][2*(d-1):1]), .bDR0(t0[22][2*(d-1):1]), .bDR1(t1[22][2*(d-1):1]), .t_in(t_in_DR2SR[13]));
    nonlinear_CCHPC1_1_consecutive_DR2SR_d #(.security_order(security_order), .CONF(2'b00)) AND_M59_consecutive_0 (.clk(clk), .prch(prch0), .aDR(m0[38][2*(d-1):1]), .bDR(t0[22][2*(d-1):1]), .r(in_r0[28]), .t_in(t_in_DR2SR[13]), .z(m0[59][d-1:1]));
    nonlinear_CCHPC1_1_consecutive_DR2SR_d #(.security_order(security_order), .CONF(2'b00)) AND_M59_consecutive_1 (.clk(clk), .prch(prch1), .aDR(m1[38][2*(d-1):1]), .bDR(t1[22][2*(d-1):1]), .r(in_r1[28]), .t_in(t_in_DR2SR[13]), .z(m1[59][d-1:1]));
    nonlinear_CCHPC1_1_layer0_d            #(.security_order(security_order), .CONF(2'b00)) AND_M60_layer0        (                         .r( in_r[29]), .a( m[37]), .b( t[20]), .z( m[60]));
    nonlinear_CCHPC1_1_precomp_DR2SR_d     #(.security_order(security_order), .CONF(2'b00)) AND_M60_precomp       (.clk(clk), .prch0(prch0), .prch1(prch1), .r( in_r[29]), .a0( m[37]), .b0( t[20]), .aDR0(m0[37][2*(d-1):1]), .aDR1(m1[37][2*(d-1):1]), .bDR0(t0[20][2*(d-1):1]), .bDR1(t1[20][2*(d-1):1]), .t_in(t_in_DR2SR[14]));
    nonlinear_CCHPC1_1_consecutive_DR2SR_d #(.security_order(security_order), .CONF(2'b00)) AND_M60_consecutive_0 (.clk(clk), .prch(prch0), .aDR(m0[37][2*(d-1):1]), .bDR(t0[20][2*(d-1):1]), .r(in_r0[29]), .t_in(t_in_DR2SR[14]), .z(m0[60][d-1:1]));
    nonlinear_CCHPC1_1_consecutive_DR2SR_d #(.security_order(security_order), .CONF(2'b00)) AND_M60_consecutive_1 (.clk(clk), .prch(prch1), .aDR(m1[37][2*(d-1):1]), .bDR(t1[20][2*(d-1):1]), .r(in_r1[29]), .t_in(t_in_DR2SR[14]), .z(m1[60][d-1:1]));
    nonlinear_CCHPC1_1_layer0_d            #(.security_order(security_order), .CONF(2'b00)) AND_M61_layer0        (                         .r( in_r[30]), .a( m[42]), .b( t[1]), .z( m[61]));
    nonlinear_CCHPC1_1_precomp_DR2SR_d     #(.security_order(security_order), .CONF(2'b00)) AND_M61_precomp       (.clk(clk), .prch0(prch0), .prch1(prch1), .r( in_r[30]), .a0( m[42]), .b0( t[1]), .aDR0(m0[42][2*(d-1):1]), .aDR1(m1[42][2*(d-1):1]), .bDR0(t0[1][2*(d-1):1]), .bDR1(t1[1][2*(d-1):1]), .t_in(t_in_DR2SR[15]));
    nonlinear_CCHPC1_1_consecutive_DR2SR_d #(.security_order(security_order), .CONF(2'b00)) AND_M61_consecutive_0 (.clk(clk), .prch(prch0), .aDR(m0[42][2*(d-1):1]), .bDR(t0[1][2*(d-1):1]), .r(in_r0[30]), .t_in(t_in_DR2SR[15]), .z(m0[61][d-1:1]));
    nonlinear_CCHPC1_1_consecutive_DR2SR_d #(.security_order(security_order), .CONF(2'b00)) AND_M61_consecutive_1 (.clk(clk), .prch(prch1), .aDR(m1[42][2*(d-1):1]), .bDR(t1[1][2*(d-1):1]), .r(in_r1[30]), .t_in(t_in_DR2SR[15]), .z(m1[61][d-1:1]));
    nonlinear_CCHPC1_1_layer0_d            #(.security_order(security_order), .CONF(2'b00)) AND_M62_layer0        (                         .r( in_r[31]), .a( m[45]), .b( t[4]), .z( m[62]));
    nonlinear_CCHPC1_1_precomp_DR2SR_d     #(.security_order(security_order), .CONF(2'b00)) AND_M62_precomp       (.clk(clk), .prch0(prch0), .prch1(prch1), .r( in_r[31]), .a0( m[45]), .b0( t[4]), .aDR0(m0[45][2*(d-1):1]), .aDR1(m1[45][2*(d-1):1]), .bDR0(t0[4][2*(d-1):1]), .bDR1(t1[4][2*(d-1):1]), .t_in(t_in_DR2SR[16]));
    nonlinear_CCHPC1_1_consecutive_DR2SR_d #(.security_order(security_order), .CONF(2'b00)) AND_M62_consecutive_0 (.clk(clk), .prch(prch0), .aDR(m0[45][2*(d-1):1]), .bDR(t0[4][2*(d-1):1]), .r(in_r0[31]), .t_in(t_in_DR2SR[16]), .z(m0[62][d-1:1]));
    nonlinear_CCHPC1_1_consecutive_DR2SR_d #(.security_order(security_order), .CONF(2'b00)) AND_M62_consecutive_1 (.clk(clk), .prch(prch1), .aDR(m1[45][2*(d-1):1]), .bDR(t1[4][2*(d-1):1]), .r(in_r1[31]), .t_in(t_in_DR2SR[16]), .z(m1[62][d-1:1]));
    nonlinear_CCHPC1_1_layer0_d            #(.security_order(security_order), .CONF(2'b00)) AND_M63_layer0        (                         .r( in_r[32]), .a( m[41]), .b( t[2]), .z( m[63]));
    nonlinear_CCHPC1_1_precomp_DR2SR_d     #(.security_order(security_order), .CONF(2'b00)) AND_M63_precomp       (.clk(clk), .prch0(prch0), .prch1(prch1), .r( in_r[32]), .a0( m[41]), .b0( t[2]), .aDR0(m0[41][2*(d-1):1]), .aDR1(m1[41][2*(d-1):1]), .bDR0(t0[2][2*(d-1):1]), .bDR1(t1[2][2*(d-1):1]), .t_in(t_in_DR2SR[17]));
    nonlinear_CCHPC1_1_consecutive_DR2SR_d #(.security_order(security_order), .CONF(2'b00)) AND_M63_consecutive_0 (.clk(clk), .prch(prch0), .aDR(m0[41][2*(d-1):1]), .bDR(t0[2][2*(d-1):1]), .r(in_r0[32]), .t_in(t_in_DR2SR[17]), .z(m0[63][d-1:1]));
    nonlinear_CCHPC1_1_consecutive_DR2SR_d #(.security_order(security_order), .CONF(2'b00)) AND_M63_consecutive_1 (.clk(clk), .prch(prch1), .aDR(m1[41][2*(d-1):1]), .bDR(t1[2][2*(d-1):1]), .r(in_r1[32]), .t_in(t_in_DR2SR[17]), .z(m1[63][d-1:1]));

    // Last Stage: Linear Map
    generate
        for (i = 1; i < 64; i=i+1) begin : loop_wiring_m_

            assign m0[i][0] = m[i];
            assign m1[i][0] = m[i];

            if (i > 45) begin : gen_merge_

                assign m_merged[i][0] = m[i];

                if (d > 1) begin : first_order

                    NOR2  merge_m_inst0 (.a(m0[i][1]), .b(m1[i][1]), .z(m_merged[i][1])); // NOR2 with inverted rails pre-charged to 0

                end
                if (d > 2) begin : second_order

                    NOR2  merge_m_inst1 (.a(m0[i][2]), .b(m1[i][2]), .z(m_merged[i][2])); // NOR2 with inverted rails pre-charged to 0

                end
                if (d > 3) begin : third_order

                    NAND2 merge_m_inst2 (.a(m0[i][3]), .b(m1[i][3]), .z(m_merged[i][3])); // NAND2 with inverted rails pre-charged to 1

                end

            end

        end
    endgenerate

    linear_CCHPC1_1_SRtSR #(.security_order(security_order), .CONF(1'b0)) XOR_L00  (.a(m_merged[61]), .b(m_merged[62]), .z(l[0]));
    linear_CCHPC1_1_SRtSR #(.security_order(security_order), .CONF(1'b0)) XOR_L01  (.a(m_merged[50]), .b(m_merged[56]), .z(l[1]));
    linear_CCHPC1_1_SRtSR #(.security_order(security_order), .CONF(1'b0)) XOR_L02  (.a(m_merged[46]), .b(m_merged[48]), .z(l[2]));
    linear_CCHPC1_1_SRtSR #(.security_order(security_order), .CONF(1'b0)) XOR_L03  (.a(m_merged[47]), .b(m_merged[55]), .z(l[3]));
    linear_CCHPC1_1_SRtSR #(.security_order(security_order), .CONF(1'b0)) XOR_L04  (.a(m_merged[54]), .b(m_merged[58]), .z(l[4]));
    linear_CCHPC1_1_SRtSR #(.security_order(security_order), .CONF(1'b0)) XOR_L05  (.a(m_merged[49]), .b(m_merged[61]), .z(l[5]));
    linear_CCHPC1_1_SRtSR #(.security_order(security_order), .CONF(1'b0)) XOR_L06  (.a(m_merged[62]), .b(l[5]), .z(l[6]));
    linear_CCHPC1_1_SRtSR #(.security_order(security_order), .CONF(1'b0)) XOR_L07  (.a(m_merged[46]), .b(l[3]), .z(l[7]));
    linear_CCHPC1_1_SRtSR #(.security_order(security_order), .CONF(1'b0)) XOR_L08  (.a(m_merged[51]), .b(m_merged[59]), .z(l[8]));
    linear_CCHPC1_1_SRtSR #(.security_order(security_order), .CONF(1'b0)) XOR_L09  (.a(m_merged[52]), .b(m_merged[53]), .z(l[9]));
    linear_CCHPC1_1_SRtSR #(.security_order(security_order), .CONF(1'b0)) XOR_L10  (.a(m_merged[53]), .b(l[4]), .z(l[10]));
    linear_CCHPC1_1_SRtSR #(.security_order(security_order), .CONF(1'b0)) XOR_L11  (.a(m_merged[60]), .b(l[2]), .z(l[11]));
    linear_CCHPC1_1_SRtSR #(.security_order(security_order), .CONF(1'b0)) XOR_L12  (.a(m_merged[48]), .b(m_merged[51]), .z(l[12]));
    linear_CCHPC1_1_SRtSR #(.security_order(security_order), .CONF(1'b0)) XOR_L13  (.a(m_merged[50]), .b(l[0]), .z(l[13]));
    linear_CCHPC1_1_SRtSR #(.security_order(security_order), .CONF(1'b0)) XOR_L14  (.a(m_merged[52]), .b(m_merged[61]), .z(l[14]));
    linear_CCHPC1_1_SRtSR #(.security_order(security_order), .CONF(1'b0)) XOR_L15  (.a(m_merged[55]), .b(l[1]), .z(l[15]));
    linear_CCHPC1_1_SRtSR #(.security_order(security_order), .CONF(1'b0)) XOR_L16  (.a(m_merged[56]), .b(l[0]), .z(l[16]));
    linear_CCHPC1_1_SRtSR #(.security_order(security_order), .CONF(1'b0)) XOR_L17  (.a(m_merged[57]), .b(l[1]), .z(l[17]));
    linear_CCHPC1_1_SRtSR #(.security_order(security_order), .CONF(1'b0)) XOR_L18  (.a(m_merged[58]), .b(l[8]), .z(l[18]));
    linear_CCHPC1_1_SRtSR #(.security_order(security_order), .CONF(1'b0)) XOR_L19  (.a(m_merged[63]), .b(l[4]), .z(l[19]));
    
    linear_CCHPC1_1_SRtSR #(.security_order(security_order), .CONF(1'b0)) XOR_L20  (.a(l[0]), .b(l[1]), .z(l[20]));
    linear_CCHPC1_1_SRtSR #(.security_order(security_order), .CONF(1'b0)) XOR_L21  (.a(l[1]), .b(l[7]), .z(l[21]));
    linear_CCHPC1_1_SRtSR #(.security_order(security_order), .CONF(1'b0)) XOR_L22  (.a(l[3]), .b(l[12]), .z(l[22]));
    linear_CCHPC1_1_SRtSR #(.security_order(security_order), .CONF(1'b0)) XOR_L23  (.a(l[18]), .b(l[2]), .z(l[23]));
    linear_CCHPC1_1_SRtSR #(.security_order(security_order), .CONF(1'b0)) XOR_L24  (.a(l[15]), .b(l[9]), .z(l[24]));
    linear_CCHPC1_1_SRtSR #(.security_order(security_order), .CONF(1'b0)) XOR_L25  (.a(l[6]), .b(l[10]), .z(l[25]));
    linear_CCHPC1_1_SRtSR #(.security_order(security_order), .CONF(1'b0)) XOR_L26  (.a(l[7]), .b(l[9]), .z(l[26]));
    linear_CCHPC1_1_SRtSR #(.security_order(security_order), .CONF(1'b0)) XOR_L27  (.a(l[8]), .b(l[10]), .z(l[27]));
    linear_CCHPC1_1_SRtSR #(.security_order(security_order), .CONF(1'b0)) XOR_L28  (.a(l[11]), .b(l[14]), .z(l[28]));
    linear_CCHPC1_1_SRtSR #(.security_order(security_order), .CONF(1'b0)) XOR_L29  (.a(l[11]), .b(l[17]), .z(l[29]));
    linear_CCHPC1_1_SRtSR #(.security_order(security_order), .CONF(1'b0)) XOR_S00  (.a(l[6]), .b(l[24]), .z(sboxOutput[7]));
    linear_CCHPC1_1_SRtSR #(.security_order(security_order), .CONF(1'b1)) XNOR_S01 (.a(l[16]), .b(l[26]), .z(sboxOutput[6]));
    linear_CCHPC1_1_SRtSR #(.security_order(security_order), .CONF(1'b1)) XNOR_S02 (.a(l[19]), .b(l[28]), .z(sboxOutput[5]));
    linear_CCHPC1_1_SRtSR #(.security_order(security_order), .CONF(1'b0)) XOR_S03  (.a(l[6]), .b(l[21]), .z(sboxOutput[4]));
    linear_CCHPC1_1_SRtSR #(.security_order(security_order), .CONF(1'b0)) XOR_S04  (.a(l[20]), .b(l[22]), .z(sboxOutput[3]));
    linear_CCHPC1_1_SRtSR #(.security_order(security_order), .CONF(1'b0)) XOR_S05  (.a(l[25]), .b(l[29]), .z(sboxOutput[2]));
    linear_CCHPC1_1_SRtSR #(.security_order(security_order), .CONF(1'b1)) XNOR_S06 (.a(l[13]), .b(l[27]), .z(sboxOutput[1]));
    linear_CCHPC1_1_SRtSR #(.security_order(security_order), .CONF(1'b1)) XNOR_S07 (.a(l[6]), .b(l[23]), .z(sboxOutput[0]));

    // ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

endmodule