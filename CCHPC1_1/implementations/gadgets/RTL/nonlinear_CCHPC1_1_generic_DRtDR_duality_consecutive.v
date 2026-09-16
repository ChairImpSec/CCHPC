module nonlinear_CCHPC1_1_generic_DRtDR_duality_consecutive #( parameter security_order = 1, FORWARD_R = 0, wAOI22 = 0
)(
    aDR0, aDR1, bDR0, bDR1, r_DR0, r_DR1, t_DR0, t_DR1, t_fwd_SR0, t_fwd_SR1, z_DR0, z_DR1, fwd_SR
);
    parameter integer d = security_order+1;

    localparam integer RAND_COUNT_CONSEC      = ((d-1)*(d-2))/2;
    localparam integer RAND_COUNT_CONSEC_SAFE = (RAND_COUNT_CONSEC > 0) ? RAND_COUNT_CONSEC : 1;
    
    localparam integer RAIL_FACTOR = 2;

    input  [RAIL_FACTOR*(d-1):1] aDR0; // dual-rail shares from duality instance 0 
    input  [RAIL_FACTOR*(d-1):1] aDR1; // dual-rail shares from duality instance 1 
    input  [RAIL_FACTOR*(d-1):1] bDR0; // dual-rail shares from duality instance 0 
    input  [RAIL_FACTOR*(d-1):1] bDR1; // dual-rail shares from duality instance 1 

    input  [RAIL_FACTOR*RAND_COUNT_CONSEC_SAFE-1:0] r_DR0; // dual-rail random bits
    input  [RAIL_FACTOR*RAND_COUNT_CONSEC_SAFE-1:0] r_DR1; // dual-rail random bits

    input  [RAIL_FACTOR*2*d*(d-1)-1:0] t_DR0;     // dual-rail
    input  [RAIL_FACTOR*2*d*(d-1)-1:0] t_DR1;     // dual-rail
    input  [2*d*(d-1)-1:0]             t_fwd_SR0; // pre-charged single-rail for forwarded layers, duality instance 0
    input  [2*d*(d-1)-1:0]             t_fwd_SR1; // pre-charged single-rail for forwarded layers, duality instance 1

    output [RAIL_FACTOR*(d-1):1] z_DR0;		// dual-rail shares from duality instance 0 
    output [RAIL_FACTOR*(d-1):1] z_DR1;		// dual-rail shares from duality instance 1 
    output [d-2:0]               fwd_SR; 	// selected-term contribution for forwarding

    //-----------------------------------------
    //-- consecutive layers (DRtDR) -----------
    //-----------------------------------------

    genvar l, k;
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

                wire [l-1:0] tmp_mux0;
                wire [l-1:0] tmp_mux1;
                wire [l-1:0] tmp_merged;

                DRP_MUX4_RAIL_parallel #(
                    .NUM_INPUTS(l),
                    .wAOI22(wAOI22)
                ) mux_L_inst0 (
                    .s0(aDR0[2*l:2*l-1]),
                    .s1(bDR0[2*l:2*l-1]),
                    .d(t_fwd_SR0[SR_OFFSET+SR_WIDTH-1:SR_OFFSET]),
                    .z(tmp_mux0)
                );

                DRP_MUX4_RAIL_parallel #(
                    .NUM_INPUTS(l),
                    .wAOI22(wAOI22)
                ) mux_L_inst1 (
                    .s0(aDR1[2*l:2*l-1]),
                    .s1(bDR1[2*l:2*l-1]),
                    .d(t_fwd_SR1[SR_OFFSET+SR_WIDTH-1:SR_OFFSET]),
                    .z(tmp_mux1)
                );

                for (k = 0; k < l; k=k+1) begin : gen_merge_
                    NOR2 merge_inst (.a(tmp_mux0[k]), .b(tmp_mux1[k]), .z(tmp_merged[k]));
                end

                CCHPC_DRtSR_XOR_COMP #(
                    .NUM_INPUTS(l),
                    .INVERT(0)
                ) fwd_comp_inst (
                    .a(tmp_merged),
                    .z(fwd_SR[l-1])
                );

                assign z_DR0[2*l:2*l-1] = 2'b00;
                assign z_DR1[2*l:2*l-1] = 2'b00;

            end else begin : gen_default_

                wire [RAIL_FACTOR*(d-1)-1:0] tmp_flat0;
                wire [RAIL_FACTOR*(d-1)-1:0] tmp_flat1;

                if (RAND_COUNT > 0) begin : gen_assign_rand_
                    assign tmp_flat0[RAIL_FACTOR*RAND_COUNT-1:0] = r_DR0[RAIL_FACTOR*(RAND_OFFSET+RAND_COUNT)-1:RAIL_FACTOR*RAND_OFFSET];
                    assign tmp_flat1[RAIL_FACTOR*RAND_COUNT-1:0] = r_DR1[RAIL_FACTOR*(RAND_OFFSET+RAND_COUNT)-1:RAIL_FACTOR*RAND_OFFSET];
                end

                DRP_MUX4_parallel #(
                    .NUM_INPUTS(l),
                    .wAOI22(wAOI22)
                ) mux_L_inst0 (
                    .s0(aDR0[2*l:2*l-1]),
                    .s1(bDR0[2*l:2*l-1]),
                    .d(t_DR0[T_OFFSET+T_WIDTH-1:T_OFFSET]),
                    .z(tmp_flat0[2*(d-1)-1:2*(d-1)-2*l])
                );

                DRP_MUX4_parallel #(
                    .NUM_INPUTS(l),
                    .wAOI22(wAOI22)
                ) mux_L_inst1 (
                    .s0(aDR1[2*l:2*l-1]),
                    .s1(bDR1[2*l:2*l-1]),
                    .d(t_DR1[T_OFFSET+T_WIDTH-1:T_OFFSET]),
                    .z(tmp_flat1[2*(d-1)-1:2*(d-1)-2*l])
                );

                DRP_XOR2_TREE #(
                    .NUM_INPUTS(d-1),
                    .wAOI22(wAOI22)
                ) xor_tree_L_inst0 (
                    .a(tmp_flat0),
                    .z(z_DR0[2*l:2*l-1])
                );

                DRP_XOR2_TREE #(
                    .NUM_INPUTS(d-1),
                    .wAOI22(wAOI22)
                ) xor_tree_L_inst1 (
                    .a(tmp_flat1),
                    .z(z_DR1[2*l:2*l-1])
                );

                assign fwd_SR[l-1] = 1'b0;

            end

        end

        if (security_order < 2) begin : gen_unused_order1_

            wire unused_r_DR0;
            wire unused_r_DR1;
            wire unused_t_fwd_SR0;
            wire unused_t_fwd_SR1;

            assign unused_r_DR0     = ^r_DR0;
            assign unused_r_DR1     = ^r_DR1;
            assign unused_t_fwd_SR0 = ^t_fwd_SR0;
            assign unused_t_fwd_SR1 = ^t_fwd_SR1;

        end else if (FORWARD_R == 0) begin : gen_unused_fwd_

            wire unused_t_fwd_SR0;
            wire unused_t_fwd_SR1;

            assign unused_t_fwd_SR0 = ^t_fwd_SR0;
            assign unused_t_fwd_SR1 = ^t_fwd_SR1;

        end else begin : gen_unused_rand_

            wire unused_r_DR0;
            wire unused_r_DR1;

            assign unused_r_DR0 = ^r_DR0;
            assign unused_r_DR1 = ^r_DR1;

        end
				
    endgenerate

endmodule

