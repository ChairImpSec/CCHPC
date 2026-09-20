// nonlinear CCHPC1.1 gadget for arbitrary security orders
// - dual-rail inputs and outputs in layers l > 0
// - single-rail and externally pre-charged dual-rail randomness
// - operation in duality
module nonlinear_CCHPC1_1_generic_DRtDR_duality_wPRCHn #(
    parameter security_order = 1,                       // sets the security order, must be > 0
    parameter CONF           = 2'b00,                   // configures nonlinear function: AND (2'b00), NAND (2'b01), NOR (2'b10), OR (2'b11)
    parameter FORWARD_R      = 0,                       // forward each non-final layer output to the next layer's last MTG random input (0: paper construction)
    parameter wAOI22         = 0,                       // use more complex AOI22 cells for area improvements
    parameter OPT_PRCH       = 0,                       // potential are improvements by adding pre-charge of true rail data with negated pre-charge control signals
    parameter aINV = 1'b0, bINV = 1'b0, zINV = 1'b0,    // unrail parameters to move input/output inversions into the gadgets
    parameter ALIGN_OUT = 0                             // align all output shares to the timing of the last layer
)(
    clk, prch0, prch1, prch0_n, prch1_n, a_layer0, a_duality0, a_duality1, b_layer0, b_duality0, b_duality1, r_SR, r_duality0, r_duality1, z_layer0, z_duality0, z_duality1
);
    parameter integer d = security_order+1;

    localparam integer RAND_COUNT             = (d*(d-1))/2;
    localparam integer RAND_COUNT_CONSEC      = ((d-1)*(d-2))/2;
    localparam integer RAND_COUNT_CONSEC_SAFE = (RAND_COUNT_CONSEC > 0) ? RAND_COUNT_CONSEC : 1;

    localparam integer RAIL_FACTOR = 2;

    input         clk;
    input [d-2:0] prch0;
    input [d-2:0] prch1;
    input [d-2:0] prch0_n;
    input [d-2:0] prch1_n;

    input             a_layer0;   // share 0
    input             b_layer0;   // share 0
    input [2*(d-1):1] a_duality0; // dual-rail shares from duality instance 0 
    input [2*(d-1):1] a_duality1; // dual-rail shares from duality instance 1
    input [2*(d-1):1] b_duality0; // dual-rail shares from duality instance 0 
    input [2*(d-1):1] b_duality1; // dual-rail shares from duality instance 1

    input [d-2:0] r_SR;                                  				// externally registered single-rail random bits
    input [RAIL_FACTOR*RAND_COUNT_CONSEC_SAFE-1:0] r_duality0; 	// externally registered and pre-charged dual-rail random bits for duality instance 0
    input [RAIL_FACTOR*RAND_COUNT_CONSEC_SAFE-1:0] r_duality1; 	// externally registered and pre-charged dual-rail random bits for duality instance 1
                                                                // first security order: both are 2-bit dummy ports, no consecutive-layer randomness exists

    output             z_layer0;   // share 0
    output [2*(d-1):1] z_duality0; // dual-rail shares from duality instance 0 
    output [2*(d-1):1] z_duality1; // dual-rail shares from duality instance 1



    // --- intermediates

    wire [d-2:0]                                    randL0;           // single-rail
    wire [RAND_COUNT-1:0]                           randPrecomp;      // single-rail
    wire [RAND_COUNT-1:0]                           randPrecomp_used; // single-rail

    wire [2*d*(d-1)-1:0]                t;         // single-rail
    wire [RAIL_FACTOR*2*d*(d-1)-1:0]    t_DR0;     // pre-charged dual-rail for duality instance 0
    wire [RAIL_FACTOR*2*d*(d-1)-1:0]    t_DR1;     // pre-charged dual-rail for duality instance 1
    wire [2*d*(d-1)-1:0]                t_fwd_SR0; // pre-charged single-rail for forwarded layers, duality instance 0
    wire [2*d*(d-1)-1:0]                t_fwd_SR1; // pre-charged single-rail for forwarded layers, duality instance 1

//    wire [d-2:0] prch0_n;
//    wire [d-2:0] prch1_n;
//
//    // explicitly generates negated prch signal per layer
//    genvar pn;
//    generate
//        if (OPT_PRCH == 1) begin : gen_prch_n_
//
//            for (pn = 0; pn < d-1; pn = pn+1) begin : gen_inv_
//                INV inv_prch0_inst (.a(prch0[pn]), .z(prch0_n[pn]));
//                INV inv_prch1_inst (.a(prch1[pn]), .z(prch1_n[pn]));
//            end
//
//        end else begin : gen_no_prch_n_
//
//            // avoid unused
//            wire unused_prch0_n;
//            wire unused_prch1_n;
//
//            assign prch0_n = {(d-1){1'b0}};
//            assign prch1_n = {(d-1){1'b0}};
//
//            assign unused_prch0_n = ^prch0_n;
//            assign unused_prch1_n = ^prch1_n;
//
//        end
//    endgenerate

    generate
        if (OPT_PRCH == 0) begin : gen_no_prch_n_

            // avoid unused
            wire unused_prch0_n;
            wire unused_prch1_n;

            assign unused_prch0_n = ^prch0_n;
            assign unused_prch1_n = ^prch1_n;

        end
    endgenerate


    //-----------------------------------------
    //-- CONFIG -------------------------------
    //-----------------------------------------

    wire [2*(d-1):1] aDR0;
    wire [2*(d-1):1] aDR1;
    wire [2*(d-1):1] bDR0;
    wire [2*(d-1):1] bDR1;

    wire [(d-2):0] a_precomp;
    wire [(d-2):0] b_precomp;

    wire             z_layer0_internal;
    wire [2*(d-1):1] z_duality0_internal;
    wire [2*(d-1):1] z_duality1_internal;
    wire [2*(d-1):1] z_duality0_consecutive;
    wire [2*(d-1):1] z_duality1_consecutive;
    wire [d-2:0]     fwdConsec;
    wire             randFwd0;

    genvar i, rpl, rpk;
    generate

        // conditional input inversion by dual-rail swap to change non-linear function for free (and2/nand2/nor2/or2)
        if (d > 2) begin : gen_DR_
            assign aDR0[2*(d-1)-2:1] = a_duality0[2*(d-1)-2:1];
            assign aDR1[2*(d-1)-2:1] = a_duality1[2*(d-1)-2:1];
            assign bDR0[2*(d-1)-2:1] = b_duality0[2*(d-1)-2:1];
            assign bDR1[2*(d-1)-2:1] = b_duality1[2*(d-1)-2:1];
        end

        assign aDR0[2*(d-1):2*(d-1)-1] = (CONF[1] ^ aINV) ? {a_duality0[2*(d-1)-1], a_duality0[2*(d-1)]} : a_duality0[2*(d-1):2*(d-1)-1];
        assign aDR1[2*(d-1):2*(d-1)-1] = (CONF[1] ^ aINV) ? {a_duality1[2*(d-1)-1], a_duality1[2*(d-1)]} : a_duality1[2*(d-1):2*(d-1)-1];
        assign bDR0[2*(d-1):2*(d-1)-1] = (CONF[1] ^ bINV) ? {b_duality0[2*(d-1)-1], b_duality0[2*(d-1)]} : b_duality0[2*(d-1):2*(d-1)-1];
        assign bDR1[2*(d-1):2*(d-1)-1] = (CONF[1] ^ bINV) ? {b_duality1[2*(d-1)-1], b_duality1[2*(d-1)]} : b_duality1[2*(d-1):2*(d-1)-1];

        // precomp takes single rails
        assign a_precomp[0] = a_layer0;
        assign b_precomp[0] = b_layer0;

        for (i = 1; i < (d-1); i=i+1) begin : loop_precomp_merge_ // NOTE: this is redundant if multiple nonlinear gadgets have a common input, but the snthesizer should throw it away  
            NOR2 merge_a_inst (.a(aDR0[2*i]), .b(aDR1[2*i]), .z(a_precomp[i]));
            NOR2 merge_b_inst (.a(bDR0[2*i]), .b(bDR1[2*i]), .z(b_precomp[i]));
        end

        //-----------------------------------------
        //-- pre-processing randomness ------------
        //-----------------------------------------

        // single-rail precomputation randomness for layers l > 0
        for (rpl = 1; rpl < d; rpl = rpl+1) begin : gen_randPrecomp_layer_

            for (rpk = 0; rpk < rpl; rpk = rpk+1) begin : gen_randPrecomp_rand_

                localparam integer R_IDX = (rpl*(rpl-1))/2 + rpk;

                if (rpk == 0) begin : gen_rand_from_SR_

                    // Random bit is only required in single rail.
                    // r_SR contains the triangular rpk == 0 subset in layer order.
                    assign randPrecomp[R_IDX] = r_SR[rpl-1];

                end else begin : gen_rand_from_DR_

                    // The random bit is provided precharged separately for both
                    // duality phases. Reconstruct its temporally aligned single-rail
                    // value by NOR-merging the FALSE rails of both copies.
                    localparam integer RAND_OFFSET = ((rpk-1)*(2*d-rpk-2))/2;
                    localparam integer RAND_POS    = RAND_OFFSET + (rpl-1-rpk);

                    NOR2 merge_rand_inst (
                        .a(r_duality0[2*RAND_POS+1]),
                        .b(r_duality1[2*RAND_POS+1]),
                        .z(randPrecomp[R_IDX])
                    );

                end
            end

        end

        // single-rail of triangular layer l = 0 randomness
        for (i = 0; i < (d-1); i = i+1) begin : gen_randL0_
            assign randL0[i] = randPrecomp[(i*(i+1))/2];
        end

    endgenerate




    // --- Layer: l = 0

    nonlinear_CCHPC1_1_generic_layer0 #(
        .security_order(security_order),    // security order
        .zINV(CONF[0] ^ zINV),              // non-linear function output inversion (and2/nand2/nor2/or2)
        .FORWARD_R(FORWARD_R)               // forward layer output
    ) nonlinear_layer0 (
        .randL0(randL0),
        .a(a_layer0),
        .b(b_layer0),
        .z(z_layer0_internal),
        .r_fwd(randFwd0)
    );

    // --- Forward layer output into the next layer's last MTG

    genvar frl, frk;
    generate

        for (frl = 1; frl < d; frl = frl+1) begin : gen_randPrecomp_used_layer_
            for (frk = 0; frk < frl; frk = frk+1) begin : gen_randPrecomp_used_rand_

                localparam integer R_IDX = (frl*(frl-1))/2 + frk;

                if ((FORWARD_R == 1) && (frk == frl-1)) begin : gen_forward_

                    if (frl == 1) begin : gen_layer0_
                        assign randPrecomp_used[R_IDX] = randFwd0;
                    end else begin : gen_consecutive_
                        XOR2 xor_fwd_inst (.a(randPrecomp[R_IDX]), .b(fwdConsec[frl-2]), .z(randPrecomp_used[R_IDX]));
                    end

                end else begin : gen_default_
                    assign randPrecomp_used[R_IDX] = randPrecomp[R_IDX];
                end

            end
        end

    endgenerate

    // --- Pre-computations (MTGs) for (DRP) Layers: l > 0

    nonlinear_CCHPC1_1_generic_precomp #(
        .security_order(security_order)     // security order
    ) nonlinear_precomp (
        .clk(clk),
        .r(randPrecomp_used),
        .a(a_precomp),
        .b(b_precomp),
        .t(t)
    );

    genvar tp;
    generate

        for (tp = 1; tp < d; tp = tp+1) begin : gen_layer_

            localparam integer SR_WIDTH   = 4*tp;
            localparam integer SR_OFFSET  = 2*tp*(tp-1);

            localparam integer DR_WIDTH   = 8*tp;
            localparam integer DR_OFFSET  = 4*tp*(tp-1);

            if ((FORWARD_R == 1) && (tp < d-1)) begin : gen_forward_

                REG_prch_wNOR #(
                    .WIDTH(SR_WIDTH)
                ) reg_t_inst0 (
                    .clk  (clk),
                    .prch (prch0[tp-1]),
                    .a    (t[SR_OFFSET+SR_WIDTH-1:SR_OFFSET]),
                    .z    (t_fwd_SR0[SR_OFFSET+SR_WIDTH-1:SR_OFFSET])
                );

                REG_prch_wNOR #(
                    .WIDTH(SR_WIDTH)
                ) reg_t_inst1 (
                    .clk  (clk),
                    .prch (prch1[tp-1]),
                    .a    (t[SR_OFFSET+SR_WIDTH-1:SR_OFFSET]),
                    .z    (t_fwd_SR1[SR_OFFSET+SR_WIDTH-1:SR_OFFSET])
                );

                assign t_DR0[DR_OFFSET+DR_WIDTH-1:DR_OFFSET] = {DR_WIDTH{1'b0}};
                assign t_DR1[DR_OFFSET+DR_WIDTH-1:DR_OFFSET] = {DR_WIDTH{1'b0}};

            end else begin : gen_default_

                if (OPT_PRCH == 1) begin : gen_opt_prch_

                    REG_prch_SRtDR #(
                        .IN_WIDTH(SR_WIDTH),
                        .CHUNK_IN_WIDTH(4)
                    ) reg_t_inst0 (
                        .clk    (clk),
                        .prch   (prch0[tp-1]),
                        .prch_n (prch0_n[tp-1]),
                        .a      (t[SR_OFFSET+SR_WIDTH-1:SR_OFFSET]),
                        .z      (t_DR0[DR_OFFSET+DR_WIDTH-1:DR_OFFSET])
                    );

                    REG_prch_SRtDR #(
                        .IN_WIDTH(SR_WIDTH),
                        .CHUNK_IN_WIDTH(4)
                    ) reg_t_inst1 (
                        .clk    (clk),
                        .prch   (prch1[tp-1]),
                        .prch_n (prch1_n[tp-1]),
                        .a      (t[SR_OFFSET+SR_WIDTH-1:SR_OFFSET]),
                        .z      (t_DR1[DR_OFFSET+DR_WIDTH-1:DR_OFFSET])
                    );

                end else begin : gen_default_prch_

                    wire [DR_WIDTH-1:0] t_DR_in;

                    SRtDR_conversion #(
                        .WIDTH(SR_WIDTH),
                        .CHUNK_WIDTH(4),
                        .SWAP_RAILS(1)      // rails are intentionally swapped as they are inverted again by the NOR-based pre-charge
                    ) t_SRtDR_inst (
                        .a(t[SR_OFFSET+SR_WIDTH-1:SR_OFFSET]),
                        .z(t_DR_in)
                    );

                    REG_prch_wNOR #(
                        .WIDTH(DR_WIDTH)
                    ) reg_t_inst0 (
                        .clk  (clk),
                        .prch (prch0[tp-1]),
                        .a    (t_DR_in),
                        .z    (t_DR0[DR_OFFSET+DR_WIDTH-1:DR_OFFSET])
                    );

                    REG_prch_wNOR #(
                        .WIDTH(DR_WIDTH)
                    ) reg_t_inst1 (
                        .clk  (clk),
                        .prch (prch1[tp-1]),
                        .a    (t_DR_in),
                        .z    (t_DR1[DR_OFFSET+DR_WIDTH-1:DR_OFFSET])
                    );

                end

                assign t_fwd_SR0[SR_OFFSET+SR_WIDTH-1:SR_OFFSET] = {SR_WIDTH{1'b0}};
                assign t_fwd_SR1[SR_OFFSET+SR_WIDTH-1:SR_OFFSET] = {SR_WIDTH{1'b0}};

            end

        end

    endgenerate

    // --- (DRP) Layers: l > 0

    nonlinear_CCHPC1_1_generic_DRtDR_duality_consecutive #(
        .security_order(security_order),    // security order
        .FORWARD_R(FORWARD_R),							// forward layer output
        .wAOI22(wAOI22)                     // area improvement using AOI22 cells
    ) nonlinear_consecutive_inst (
        .aDR0(aDR0),
        .aDR1(aDR1),
        .bDR0(bDR0),
        .bDR1(bDR1),
        .r_DR0(r_duality0),
        .r_DR1(r_duality1),
        .t_DR0(t_DR0),
        .t_DR1(t_DR1),
        .t_fwd_SR0(t_fwd_SR0),
        .t_fwd_SR1(t_fwd_SR1),
        .z_DR0(z_duality0_consecutive),
        .z_DR1(z_duality1_consecutive),
        .fwd_SR(fwdConsec)
    );

    genvar zl;
    generate

        if (FORWARD_R == 1) begin : gen_forward_outputs_

            for (zl = 1; zl < d-1; zl=zl+1) begin : gen_layer_

                localparam integer RAND_COUNT_FWD  = d-1-zl;
                localparam integer RAND_OFFSET = ((zl-1)*(2*d-zl-2))/2;

                DRP_XOR2_TREE #(
                    .NUM_INPUTS(RAND_COUNT_FWD),
                    .wAOI22(wAOI22)
                ) xor_rand_inst0 (
                    .a(r_duality0[2*(RAND_OFFSET+RAND_COUNT_FWD)-1:2*RAND_OFFSET]),
                    .z(z_duality0_internal[2*zl:2*zl-1])
                );

                DRP_XOR2_TREE #(
                    .NUM_INPUTS(RAND_COUNT_FWD),
                    .wAOI22(wAOI22)
                ) xor_rand_inst1 (
                    .a(r_duality1[2*(RAND_OFFSET+RAND_COUNT_FWD)-1:2*RAND_OFFSET]),
                    .z(z_duality1_internal[2*zl:2*zl-1])
                );

            end

            assign z_duality0_internal[2*(d-1):2*(d-1)-1] = z_duality0_consecutive[2*(d-1):2*(d-1)-1];
            assign z_duality1_internal[2*(d-1):2*(d-1)-1] = z_duality1_consecutive[2*(d-1):2*(d-1)-1];

            if (d > 2) begin : gen_unused_z_consecutive_
                wire unused_z_duality0_consecutive;
                wire unused_z_duality1_consecutive;

                assign unused_z_duality0_consecutive = ^z_duality0_consecutive[2*(d-2):1];
                assign unused_z_duality1_consecutive = ^z_duality1_consecutive[2*(d-2):1];
            end

            wire unused_fwdConsec;
            assign unused_fwdConsec = fwdConsec[d-2];

        end else begin : gen_default_outputs_

            wire unused_fwdConsec;
            wire unused_randFwd0;

            assign unused_fwdConsec = ^fwdConsec;
            assign unused_randFwd0  = randFwd0;

            assign z_duality0_internal = z_duality0_consecutive;
            assign z_duality1_internal = z_duality1_consecutive;

        end

    endgenerate

    //-----------------------------------------
    //-- optional output alignment ------------
    //-----------------------------------------

    genvar ol, orail;
    generate

        // Align all output shares to the timing of the final gadget layer.
        // This is useful for pipelined/streaming operation where new inputs and
        // fresh randomness are applied every clock cycle. Without alignment,
        // output shares from different gadget layers become valid in different
        // cycles and may therefore correspond to different operations/randomness
        // instances when observed simultaneously.
        if (ALIGN_OUT == 1) begin : gen_output_alignment_

            // Layer 0
            wire [d-1:0] z_layer0_pipe;

            REG_pipeline_vec #(.depth(d-1)) reg_z_layer0_inst (.clk(clk), .a(z_layer0_internal), .z(z_layer0_pipe));

            assign z_layer0 = z_layer0_pipe[d-1];

            for (ol = 1; ol < d; ol=ol+1) begin : gen_layer_

                localparam integer DELAY = d-1-ol;

                for (orail = 0; orail < 2; orail=orail+1) begin : gen_rail_

                    localparam integer Z_IDX = 2*ol-1+orail;

                    wire [DELAY:0] z_pipe0;
                    wire [DELAY:0] z_pipe1;

                    REG_pipeline_vec #(.depth(DELAY)) reg_z0_inst (.clk(clk), .a(z_duality0_internal[Z_IDX]), .z(z_pipe0));
                    REG_pipeline_vec #(.depth(DELAY)) reg_z1_inst (.clk(clk), .a(z_duality1_internal[Z_IDX]), .z(z_pipe1));

                    assign z_duality0[Z_IDX] = z_pipe0[DELAY];
                    assign z_duality1[Z_IDX] = z_pipe1[DELAY];

                end

            end

        end else begin : gen_no_output_alignment_

            assign z_layer0   = z_layer0_internal;
            assign z_duality0 = z_duality0_internal;
            assign z_duality1 = z_duality1_internal;

        end

    endgenerate

endmodule

