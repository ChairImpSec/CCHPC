module nonlinear_CCHPC1_1_generic_consecutive #( parameter security_order = 1, OUT_DR = 1, FORWARD_R = 0, wAOI22 = 0
)(
    aDR, bDR, r_DRorSR, t_DRorSR, t_fwd_SR, z_DRorSR, fwd_SR
);
    parameter integer d = security_order+1;

    localparam integer RAIL_FACTOR = (OUT_DR == 1) ? 2 : 1;

    localparam integer RAND_COUNT_CONSEC      = ((d-1)*(d-2))/2;
    localparam integer RAND_COUNT_CONSEC_SAFE = (RAND_COUNT_CONSEC > 0) ? RAND_COUNT_CONSEC : 1;
    localparam integer RAND_WIDTH_CONSEC      = (RAND_COUNT_CONSEC > 0) ? RAIL_FACTOR*RAND_COUNT_CONSEC : 1;


    input  [2*(d-1):1] aDR; // dual-rail shares
    input  [2*(d-1):1] bDR; // dual-rail shares

    input  [RAND_WIDTH_CONSEC-1:0] r_DRorSR; // dual-rail or single-rail random bits based on OUT_DR

    input  [RAIL_FACTOR*2*d*(d-1)-1:0] t_DRorSR; // dual-rail or single-rail based on OUT_DR
    input  [2*d*(d-1)-1:0]             t_fwd_SR; // pre-charged single-rail for forwarded layers

    output [RAIL_FACTOR*(d-1):1] z_DRorSR; // dual-rail or single-rail shares based on OUT_DR
    output [d-2:0]               fwd_SR;   // selected-term contribution for forwarding

    //-----------------------------------------
    //-- consecutive layers (DRtDR / DRtSR) ---
    //-----------------------------------------

    genvar l;
    generate

        for (l = 1; l < d; l = l+1) begin : gen_consecutive_layer_

            localparam integer SR_WIDTH  = 4*l;
            localparam integer SR_OFFSET = 2*l*(l-1);

            localparam integer T_WIDTH  = RAIL_FACTOR*SR_WIDTH;
            localparam integer T_OFFSET = RAIL_FACTOR*SR_OFFSET;

            // Compression randomness:
            localparam integer RAND_COUNT  = d-1-l;
            localparam integer RAND_OFFSET = ((l-1)*(2*d-l-2))/2;

            if ((FORWARD_R == 1) && (l < d-1)) begin : gen_forward_

                wire [l-1:0] tmp_mux;

                DRP_MUX4_RAIL_parallel #(
                    .NUM_INPUTS(l),
                    .wAOI22(wAOI22)
                ) mux_L_inst (
                    .s0(aDR[2*l:2*l-1]),
                    .s1(bDR[2*l:2*l-1]),
                    .d(t_fwd_SR[SR_OFFSET+SR_WIDTH-1:SR_OFFSET]),
                    .z(tmp_mux)
                );

                assign z_DRorSR[RAIL_FACTOR*l:RAIL_FACTOR*(l-1)+1] = {RAIL_FACTOR{1'b0}};

                // Compensate the inversion introduced by the false-rail t-path
                CCHPC_DRtSR_XOR_COMP #(
                    .NUM_INPUTS(l),
                    .INVERT(l % 2)
                ) fwd_comp_inst (
                    .a(tmp_mux),
                    .z(fwd_SR[l-1])
                );

            end else begin : gen_default_

                wire [RAIL_FACTOR*(d-1)-1:0] tmp_flat;

                if (RAND_COUNT > 0) begin : gen_assign_rand_
                    assign tmp_flat[RAIL_FACTOR*RAND_COUNT-1:0] = r_DRorSR[RAIL_FACTOR*(RAND_OFFSET+RAND_COUNT)-1:RAIL_FACTOR*RAND_OFFSET];
                end

                if (OUT_DR == 1) begin : gen_DR_

                    DRP_MUX4_parallel #(
                        .NUM_INPUTS(l),
                        .wAOI22(wAOI22)
                    ) mux_L_inst (
                        .s0(aDR[2*l:2*l-1]),
                        .s1(bDR[2*l:2*l-1]),
                        .d(t_DRorSR[T_OFFSET+T_WIDTH-1:T_OFFSET]),
                        .z(tmp_flat[2*(d-1)-1:2*(d-1)-2*l])
                    );

                    DRP_XOR2_TREE #(
                        .NUM_INPUTS(d-1),
                        .wAOI22(wAOI22)
                    ) xor_tree_L_inst (
                        .a(tmp_flat),
                        .z(z_DRorSR[2*l:2*l-1])
                    );

                end else begin : gen_SR_

                    DRP_MUX4_RAIL_parallel #(
                        .NUM_INPUTS(l),
                        .wAOI22(wAOI22)
                    ) mux_L_inst (
                        .s0(aDR[2*l:2*l-1]),
                        .s1(bDR[2*l:2*l-1]),
                        .d(t_DRorSR[T_OFFSET+T_WIDTH-1:T_OFFSET]),
                        .z(tmp_flat[(d-1)-1:(d-1)-l])
                    );

                    // Compensate the inversion introduced by the pre-charged SR t-path
                    //   odd  l -> XNOR
                    //   even l -> XOR
                    localparam integer INV_COMP = (l % 2);

                    if (INV_COMP == 0) begin : gen_xor_
                        assign z_DRorSR[l] = ^tmp_flat;
                    end else begin : gen_xnor_
                        assign z_DRorSR[l] = ~(^tmp_flat);
                    end

                end

                assign fwd_SR[l-1] = 1'b0;

            end

        end


			if (security_order < 2) begin : gen_unused_order1_

					wire unused_r_DRorSR;
					wire unused_t_fwd_SR;

					assign unused_r_DRorSR = ^r_DRorSR;
					assign unused_t_fwd_SR = ^t_fwd_SR;

			end else if (FORWARD_R == 0) begin : gen_unused_fwd_

					wire unused_t_fwd_SR;

					assign unused_t_fwd_SR = ^t_fwd_SR;

			end else begin : gen_unused_rand_

					wire unused_r_DRorSR;
					wire unused_t_DRorSR;
					wire unused_t_fwd_SR;

					assign unused_r_DRorSR = ^r_DRorSR;
					assign unused_t_DRorSR = ^t_DRorSR;
					assign unused_t_fwd_SR = ^t_fwd_SR;

			end

    endgenerate

endmodule

