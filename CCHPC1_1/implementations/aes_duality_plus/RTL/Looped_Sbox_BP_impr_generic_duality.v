// Looped wrapper around the BP_impr AES S-box.
// The S-box output is fed back as the next S-box input.
// A reset pulse generates the share-wise select sequence that loads a new
// primary input into the loop. ALIGN_OUT optionally delays only the primary
// wrapper outputs such that all shares of each output bit are available in the
// same clock cycle. The internal S-box feedback path is not affected.
module Looped_Sbox_BP_impr_generic_duality #(
    parameter security_order   = 1,
    parameter FORWARD_R        = 0,
    parameter wAOI22_linear    = 1,
    parameter wAOI22_nonlinear = 0,
    parameter ALIGN_OUT        = 0
)(
    clk, rst, r_SR, r_duality0, r_duality1, a, z, prch0_o, prch1_o
);
    localparam integer d = security_order+1;

    localparam integer nonlinear_count_DRtDR = 15;
    localparam integer nonlinear_count_DRtSR = 18;

    localparam integer RAND_COUNT        = (d*(d-1))/2;
    localparam integer RAND_COUNT_CONSEC = ((d-1)*(d-2))/2;

    localparam integer RAND_WIDTH_SR = nonlinear_count_DRtDR*(d-1) + nonlinear_count_DRtSR*RAND_COUNT;
    localparam integer RAND_WIDTH_DR = (RAND_COUNT_CONSEC > 0) ? nonlinear_count_DRtDR*2*RAND_COUNT_CONSEC : 2;

    input clk;
    input rst;

    // Randomness for the 33 nonlinear gadgets:
    // - the first 15 DRtDR gadgets use (d-1) single-rail random bits and
    //   externally provided dual-rail consecutive-layer randomness,
    // - the final 18 DRtSR gadgets use RAND_COUNT single-rail random bits only.
    // For first security order no nonlinear gadget uses consecutive-layer
    // randomness, so r_duality0/1 are reduced to one shared 2-bit dummy port.
    input [RAND_WIDTH_SR-1:0] r_SR;
    input [RAND_WIDTH_DR-1:0] r_duality0;
    input [RAND_WIDTH_DR-1:0] r_duality1;

    input  [8*d-1:0] a;
    output [8*d-1:0] z;

    output [d-2:0] prch0_o;
    output [d-2:0] prch1_o;


    // -------------------------------------------------------------------------
    // Control
    // -------------------------------------------------------------------------

    wire [d-2:0] prch0;
    wire [d-2:0] prch1;
    wire [d-1:0] sel;
    wire [d-1:0] unused_MCsel;
    wire [7:0] unused_Rcon;
    wire unused_done_layer0;

    // taken from AES
    AES_controller_CCHPC1_1_generic_duality #(
        .security_order(security_order)
    ) Controller_inst (
        .clk(clk),
        .rst(rst),
        .prch0(prch0),
        .prch1(prch1),
        .sel(sel),
        .MCsel(unused_MCsel),
        .Rcon(unused_Rcon),
        .done_layer0(unused_done_layer0)
    );

    assign prch0_o = prch0;
    assign prch1_o = prch1;


    // -------------------------------------------------------------------------
    // Looped S-box
    // -------------------------------------------------------------------------

    wire [8*d-1:0] roundInput;
    wire [8*d-1:0] roundOutput;
    wire [8*d-1:0] unused_z_keyschedule;

    // Input selection: either load a new byte or feed the previous S-box output
    // back into the next loop iteration.
    genvar i, j;
    generate
        for (i = 0; i < 8; i=i+1) begin : loop_input_mux_
            for (j = 0; j < d; j=j+1) begin : loop_input_mux_share_

                assign roundInput[d*i+j] = sel[j] ? a[d*i+j] : roundOutput[d*i+j];

            end
        end
    endgenerate

    Sbox_BP_impr_generic_duality_reg #(
        .security_order(security_order),
        .FORWARD_R(FORWARD_R),
        .wAOI22_linear(wAOI22_linear),
        .wAOI22_nonlinear(wAOI22_nonlinear),
        .MoveInputREG(1'b1),
        .isKeySchedule(1'b0)
    ) SBox_inst (
        .clk(clk),
        .prch0(prch0),
        .prch1(prch1),
        .r_SR(r_SR),
        .r_duality0(r_duality0),
        .r_duality1(r_duality1),
        .a(roundInput),
        .z(roundOutput),
        .z_keyschedule(unused_z_keyschedule)
    );


    // -------------------------------------------------------------------------
    // Optional primary-output alignment
    // -------------------------------------------------------------------------

    generate
        if (ALIGN_OUT == 1) begin : gen_output_alignment_

            for (i = 0; i < 8; i=i+1) begin : loop_output_bit_

                localparam integer DELAY_SHARE0 = d-2;
                wire [DELAY_SHARE0:0] z_pipe_share0;

                REG_pipeline_vec #(
                    .depth(DELAY_SHARE0)
                ) reg_pipeline_z_share0_inst (
                    .clk(clk),
                    .a(roundOutput[i*d]),
                    .z(z_pipe_share0)
                );

                assign z[i*d] = z_pipe_share0[DELAY_SHARE0];

                for (j = 1; j < d; j=j+1) begin : loop_output_share_

                    localparam integer DELAY = d-1-j;
                    wire [DELAY:0] z_pipe;

                    REG_pipeline_vec #(
                        .depth(DELAY)
                    ) reg_pipeline_z_inst (
                        .clk(clk),
                        .a(roundOutput[i*d+j]),
                        .z(z_pipe)
                    );

                    assign z[i*d+j] = z_pipe[DELAY];

                end
            end

        end else begin : gen_no_output_alignment_

            assign z = roundOutput;

        end
    endgenerate

endmodule

