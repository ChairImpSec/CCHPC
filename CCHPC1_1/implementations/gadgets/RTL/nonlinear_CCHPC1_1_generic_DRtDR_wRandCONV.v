// nonlinear CCHPC1.1 gadget for arbitrary security orders
// - dual-rail inputs and outputs in layers l > 0
// - internal conversion of random bits into DRP if required
module nonlinear_CCHPC1_1_generic_DRtDR_wRandCONV #(
    parameter security_order = 1,                       // sets the security order, must be > 0
    parameter CONF           = 2'b00,                   // configures nonlinear function: AND (2'b00), NAND (2'b01), NOR (2'b10), OR (2'b11)
    parameter FORWARD_R      = 0,                       // forward each non-final layer output to the next layer's last MTG random input (0: paper construction)
    parameter wAOI22         = 0,                       // use more complex AOI22 cells for area improvements
    parameter OPT_PRCH       = 0,                       // potential area improvements by adding pre-charge of true rail data with negated pre-charge control signals
    parameter RAND_REG       = 0,                       // ensures all fresh randomness crosses a register, which might be required by the PRNG source (e.g., Trivium)
    parameter aINV = 1'b0, bINV = 1'b0, zINV = 1'b0,    // unrail parameters to move input/output inversions into the gadgets
    parameter ALIGN_OUT = 0                             // align all output shares to the timing of the last layer
)(
    clk, prch, a, b, r_SR, z
);
    parameter integer d = security_order+1;

    localparam integer RAIL_FACTOR = 2;

    localparam integer RAND_COUNT             = (d*(d-1))/2;
    localparam integer RAND_COUNT_CONSEC      = ((d-1)*(d-2))/2;
    localparam integer RAND_COUNT_CONSEC_SAFE = (RAND_COUNT_CONSEC > 0) ? RAND_COUNT_CONSEC : 1;
    localparam integer RAND_WIDTH_CONSEC      = (RAND_COUNT_CONSEC > 0) ? RAIL_FACTOR*RAND_COUNT_CONSEC : 1;


    input         clk;
    input [d-2:0] prch;

    input  [2*(d-1):0] a;       // share format: {..., a[2], a[1], a[0]} = {..., a^1_f, a^1_t, a^0}, ^ indicates share index, _ indicates rail
    input  [2*(d-1):0] b;       //

    input  [RAND_COUNT-1:0] r_SR;  // single-rail random bits, converted internally

    output [2*(d-1):0] z;       //



    // --- intermediates

    wire [RAND_COUNT_CONSEC_SAFE-1:0]   randConsec;           // single-rail
    wire [RAND_WIDTH_CONSEC-1:0]        randConsec_DR;        // registered and pre-charged dual-rail
    wire [d-2:0]                        randL0;               // single-rail
    wire [RAND_COUNT-1:0]               randPrecomp;          // single-rail
    wire [RAND_COUNT-1:0]               randPrecomp_used;     // single-rail

    wire [2*d*(d-1)-1:0]                t;             	// single-rail
    wire [RAIL_FACTOR*2*d*(d-1)-1:0]    t_DR;						// pre-charged dual-rail
    wire [2*d*(d-1)-1:0]                t_fwd_SR;        // pre-charged single-rail for forwarded layers

    wire [d-2:0] prch_n;

    // explicitly generates negated prch signal per layer
    genvar pn;
    generate
        if (OPT_PRCH == 1) begin : gen_prch_n_

            for (pn = 0; pn < d-1; pn = pn+1) begin : gen_inv_
                INV inv_prch_inst (.a(prch[pn]), .z(prch_n[pn]));
            end

        end else begin : gen_no_prch_n_

            // avoid unused
            wire unused_prch_n;

            assign prch_n = {(d-1){1'b0}};

            assign unused_prch_n = ^prch_n;

        end
    endgenerate

    //-----------------------------------------
    //-- CONFIG -------------------------------
    //-----------------------------------------

    wire [2*(d-1):1] aDR;
    wire [2*(d-1):1] bDR;

    wire [(d-2):0] a_precomp;
    wire [(d-2):0] b_precomp;

    wire [2*(d-1):0] z_internal;
    wire [2*(d-1):1] z_consecutive;
    wire [d-2:0]     fwdConsec;
    wire             randFwd0;


    genvar i, rl, rm, rp, rpl, rpk;
    generate

        // conditional input inversion by dual-rail swap to change non-linear function for free (and2/nand2/nor2/or2)
        if (d > 2) begin : gen_DR_
            assign aDR[2*(d-1)-2:1] = a[2*(d-1)-2:1];
            assign bDR[2*(d-1)-2:1] = b[2*(d-1)-2:1];
        end

        assign aDR[2*(d-1):2*(d-1)-1] = (CONF[1] ^ aINV) ? {a[2*(d-1)-1], a[2*(d-1)]} : a[2*(d-1):2*(d-1)-1];
        assign bDR[2*(d-1):2*(d-1)-1] = (CONF[1] ^ bINV) ? {b[2*(d-1)-1], b[2*(d-1)]} : b[2*(d-1):2*(d-1)-1];

        // precomp takes single rails
        for (i = 0; i < (d-1); i=i+1) begin : loop_precomp_assign_
            assign a_precomp[i] = (i == 0) ? a[0] : aDR[2*i-1];
            assign b_precomp[i] = (i == 0) ? b[0] : bDR[2*i-1];
        end

        //-----------------------------------------
        //-- pre-processing randomness ------------
        //-----------------------------------------

        // single-rail precomputation randomness for layers l > 0
        for (rpl = 1; rpl < d; rpl = rpl+1) begin : gen_randPrecomp_layer_

            for (rpk = 0; rpk < rpl; rpk = rpk+1) begin : gen_randPrecomp_rand_

                localparam integer R_IDX = (rpl*(rpl-1))/2 + rpk;

                if (rpk == 0) begin : gen_rand_from_SR_

                    // Random bit is not converted for a consecutive DRP layer,
                    // therefore use the original single-rail randomness.
                    if (RAND_REG == 1) begin : gen_registered_
                        REG #(.WIDTH(1)) reg_rand_inst (
                            .clk(clk),
                            .d(r_SR[R_IDX]),
                            .q(randPrecomp[R_IDX])
                        );
                    end else begin : gen_direct_
                        assign randPrecomp[R_IDX] = r_SR[R_IDX];
                    end

                end else begin : gen_rand_from_DR_

                    // The same random bit is first converted to dual-rail in
                    // consecutive layer k. Use the TRUE rail of that registered
                    // value as the temporally aligned source for precomputation.
                    localparam integer RAND_OFFSET = ((rpk-1)*(2*d-rpk-2))/2;
                    localparam integer RAND_POS    = RAND_OFFSET + (rpl-1-rpk);

                    // randConsec_DR[2*RAND_POS] is the TRUE rail.
                    assign randPrecomp[R_IDX] = randConsec_DR[RAIL_FACTOR*RAND_POS];

                end
            end

        end

        // single-rail of triangular layer l = 0 randomness   
        for (i = 0; i < (d-1); i = i+1) begin : gen_randL0_            
            assign randL0[i] = randPrecomp[(i*(i+1))/2];
        end

        // randomness for (DRP) layers l > 0
        if (RAND_COUNT_CONSEC > 0) begin : gen_randConsec_

            // single-rail triangular randomness extraction
            for (rl = 1; rl < (d-1); rl = rl+1) begin : gen_layer_

                for (rm = 0; rm < (d-1-rl); rm = rm+1) begin : gen_rand_

                    localparam integer SRC = ((rl+rm)*(rl+rm+1))/2 + rl;
                    localparam integer DST = ((rl-1)*(2*d-rl-2))/2 + rm;

                    assign randConsec[DST] = r_SR[SRC];

                end
            end

            // single-to-dual-rail conversion + pre-charging
            if (OPT_PRCH == 1) begin : gen_opt_prch_

                // single-rail randomness is implicitly converted by REG_prch_SRtDR
                for (rp = 1; rp < (d-1); rp=rp+1) begin : gen_layer_

                    localparam integer RAND_COUNT_DRP_LAYER = d-1-rp;
                    localparam integer RAND_OFFSET          = ((rp-1)*(2*d-rp-2))/2;

                    REG_prch_SRtDR #(
                        .IN_WIDTH(RAND_COUNT_DRP_LAYER),
                        .CHUNK_IN_WIDTH(1)
                    ) reg_rand_inst (
                        .clk    (clk),
                        .prch   (prch[rp-1]),
                        .prch_n (prch_n[rp-1]),
                        .a      (randConsec[RAND_OFFSET+RAND_COUNT_DRP_LAYER-1:RAND_OFFSET]),
                        .z      (randConsec_DR[2*(RAND_OFFSET+RAND_COUNT_DRP_LAYER)-1:2*RAND_OFFSET])
                    );

                end
            end else begin : gen_default_prch_

                wire [2*RAND_COUNT_CONSEC_SAFE-1:0] randConsec_DR_in;    // converted dual-rail

                SRtDR_conversion #(
                    .WIDTH(RAND_COUNT_CONSEC_SAFE),
                    .CHUNK_WIDTH(1),
                    .SWAP_RAILS(1)      // rails are intentionally swapped as they are inverted again by the NOR-based pre-charge
                ) randConsec_SRtDR_inst (
                    .a(randConsec),
                    .z(randConsec_DR_in)
                );

                for (rp = 1; rp < (d-1); rp = rp+1) begin : gen_layer_

                    localparam integer RAND_COUNT_DRP_LAYER = d-1-rp;
                    localparam integer RAND_OFFSET          = ((rp-1)*(2*d-rp-2))/2;

                    REG_prch_wNOR #(
                        .WIDTH(2*RAND_COUNT_DRP_LAYER)
                    ) reg_rand_inst (
                        .clk    (clk),
                        .prch   (prch[rp-1]),
                        .a      (randConsec_DR_in[2*(RAND_OFFSET+RAND_COUNT_DRP_LAYER)-1:2*RAND_OFFSET]),
                        .z      (randConsec_DR[2*(RAND_OFFSET+RAND_COUNT_DRP_LAYER)-1:2*RAND_OFFSET])
                    );

                end
            end
        end else begin : gen_no_randConsec_

            // avoid unused for first security order
            assign randConsec        = 1'b0;
            assign randConsec_DR = 1'b0;

        end

    endgenerate




    // --- Layer: l = 0

    nonlinear_CCHPC1_1_generic_layer0 #(
        .security_order(security_order),    // security order
        .zINV(CONF[0] ^ zINV),              // non-linear function output inversion (and2/nand2/nor2/or2)
        .FORWARD_R(FORWARD_R)               // forward layer output
    ) nonlinear_layer0 (
        .randL0(randL0),
        .a(a[0]),
        .b(b[0]),
        .z(z_internal[0]),
        .r_fwd(randFwd0)
    );

    // --- Forward layer outputs into the next layer's last MTG

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
                ) reg_t_inst (
                    .clk  (clk),
                    .prch (prch[tp-1]),
                    .a    (t[SR_OFFSET+SR_WIDTH-1:SR_OFFSET]),
                    .z    (t_fwd_SR[SR_OFFSET+SR_WIDTH-1:SR_OFFSET])
                );

                assign t_DR[DR_OFFSET+DR_WIDTH-1:DR_OFFSET] = {DR_WIDTH{1'b0}};

            end else begin : gen_default_

                if (OPT_PRCH == 1) begin : gen_opt_prch_

                    REG_prch_SRtDR #(
                        .IN_WIDTH(SR_WIDTH),
                        .CHUNK_IN_WIDTH(4)
                    ) reg_t_inst (
                        .clk    (clk),
                        .prch   (prch[tp-1]),
                        .prch_n (prch_n[tp-1]),
                        .a      (t[SR_OFFSET+SR_WIDTH-1:SR_OFFSET]),
                        .z      (t_DR[DR_OFFSET+DR_WIDTH-1:DR_OFFSET])
                    );

                end else begin : gen_default_prch_

                    wire [DR_WIDTH-1:0] t_DR_in;

                    SRtDR_conversion #(
                        .WIDTH(SR_WIDTH),
                        .CHUNK_WIDTH(4),
                        .SWAP_RAILS(1)
                    ) t_SRtDR_inst (
                        .a(t[SR_OFFSET+SR_WIDTH-1:SR_OFFSET]),
                        .z(t_DR_in)
                    );

                    REG_prch_wNOR #(
                        .WIDTH(DR_WIDTH)
                    ) reg_t_inst (
                        .clk  (clk),
                        .prch (prch[tp-1]),
                        .a    (t_DR_in),
                        .z    (t_DR[DR_OFFSET+DR_WIDTH-1:DR_OFFSET])
                    );

                end

                assign t_fwd_SR[SR_OFFSET+SR_WIDTH-1:SR_OFFSET] = {SR_WIDTH{1'b0}};

            end

        end

    endgenerate

    // --- (DRP) Layers: l > 0

    nonlinear_CCHPC1_1_generic_consecutive #(
        .security_order(security_order),    // security order
        .OUT_DR(1),                         // DRtDR
        .FORWARD_R(FORWARD_R),							// forward layer output
        .wAOI22(wAOI22)                     // area improvement using AOI22 cells
    ) nonlinear_consecutive_inst (
        .aDR(aDR),
        .bDR(bDR),
        .r_DRorSR(randConsec_DR),
        .t_DRorSR(t_DR),
        .t_fwd_SR(t_fwd_SR),
        .z_DRorSR(z_consecutive),
        .fwd_SR(fwdConsec)
    );

    genvar zl;
    generate

        if (FORWARD_R == 1) begin : gen_forward_outputs_

            for (zl = 1; zl < d-1; zl=zl+1) begin : gen_layer_

                localparam integer RAND_COUNT  = d-1-zl;
                localparam integer RAND_OFFSET = ((zl-1)*(2*d-zl-2))/2;

                DRP_XOR2_TREE #(
                    .NUM_INPUTS(RAND_COUNT),
                    .wAOI22(wAOI22)
                ) xor_rand_inst (
                    .a(randConsec_DR[2*(RAND_OFFSET+RAND_COUNT)-1:2*RAND_OFFSET]),
                    .z(z_internal[2*zl:2*zl-1])
                );

            end

            assign z_internal[2*(d-1):2*(d-1)-1] = z_consecutive[2*(d-1):2*(d-1)-1];

            if (d > 2) begin : gen_unused_z_consecutive_
                wire unused_z_consecutive;
                assign unused_z_consecutive = ^z_consecutive[2*(d-2):1];
            end

            wire unused_fwdConsec;
            assign unused_fwdConsec = fwdConsec[d-2];

        end else begin : gen_default_outputs_

            wire unused_fwdConsec;
            wire unused_randFwd0;

            assign unused_fwdConsec = ^fwdConsec;
            assign unused_randFwd0  = randFwd0;

            assign z_internal[2*(d-1):1] = z_consecutive;

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

            wire [d-1:0] z_layer0_pipe;

            REG_pipeline_vec #(.depth(d-1)) reg_z_layer0_inst (.clk(clk), .a(z_internal[0]), .z(z_layer0_pipe));

            assign z[0] = z_layer0_pipe[d-1];

            for (ol = 1; ol < d; ol=ol+1) begin : gen_layer_

                localparam integer DELAY = d-1-ol;

                for (orail = 0; orail < RAIL_FACTOR; orail=orail+1) begin : gen_rail_

                    localparam integer Z_IDX = RAIL_FACTOR*ol - (RAIL_FACTOR-1) + orail;

                    wire [DELAY:0] z_pipe;

                    REG_pipeline_vec #(.depth(DELAY)) reg_z_inst (.clk(clk), .a(z_internal[Z_IDX]), .z(z_pipe));

                    assign z[Z_IDX] = z_pipe[DELAY];

                end

            end

        end else begin : gen_no_output_alignment_

            assign z = z_internal;

        end

    endgenerate

endmodule

