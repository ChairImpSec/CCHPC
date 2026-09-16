module nonlinear_CCHPC1_1_generic_DRtSR_duality_consecutive #( parameter security_order = 1, FORWARD_R = 0, wAOI22 = 0
)(
    aDR0, aDR1, bDR0, bDR1, r_SR, t_SR0, t_SR1, z_SR, fwd_SR
);
    parameter integer d = security_order+1;

    localparam integer RAND_COUNT_CONSEC      = ((d-1)*(d-2))/2;
    localparam integer RAND_COUNT_CONSEC_SAFE = (RAND_COUNT_CONSEC > 0) ? RAND_COUNT_CONSEC : 1;
    
    localparam integer RAIL_FACTOR = 2;

    input  [RAIL_FACTOR*(d-1):1] aDR0; // dual-rail shares from duality instance 0 
    input  [RAIL_FACTOR*(d-1):1] aDR1; // dual-rail shares from duality instance 1 
    input  [RAIL_FACTOR*(d-1):1] bDR0; // dual-rail shares from duality instance 0 
    input  [RAIL_FACTOR*(d-1):1] bDR1; // dual-rail shares from duality instance 1 

    input  [RAND_COUNT_CONSEC_SAFE-1:0] r_SR; // single-rail random bits

    input  [2*d*(d-1)-1:0] t_SR0; // single-rail
    input  [2*d*(d-1)-1:0] t_SR1; // single-rail

    output [(d-1):1] z_SR;   // single-rail shares
    output [d-2:0]   fwd_SR; // selected-term contribution for forwarding

    //-----------------------------------------
    //-- consecutive layers (DRtSR) -----------
    //-----------------------------------------

    genvar l, k;
    generate

        for (l = 1; l < d; l = l+1) begin : gen_consecutive_layer_

            localparam integer T_WIDTH  = 4*l;
            localparam integer T_OFFSET = 2*l*(l-1);

            localparam integer RAND_COUNT  = d-1-l;
            localparam integer RAND_OFFSET = ((l-1)*(2*d-l-2))/2;

            wire [l-1:0] tmp_mux0;
            wire [l-1:0] tmp_mux1;
            wire [l-1:0] tmp_merged;
            wire         merged;

            DRP_MUX4_RAIL_parallel #(
                .NUM_INPUTS(l),
                .wAOI22(wAOI22)
            ) mux_L_inst0 (
                .s0(aDR0[2*l:2*l-1]),
                .s1(bDR0[2*l:2*l-1]),
                .d(t_SR0[T_OFFSET+T_WIDTH-1:T_OFFSET]),
                .z(tmp_mux0)
            );

            DRP_MUX4_RAIL_parallel #(
                .NUM_INPUTS(l),
                .wAOI22(wAOI22)
            ) mux_L_inst1 (
                .s0(aDR1[2*l:2*l-1]),
                .s1(bDR1[2*l:2*l-1]),
                .d(t_SR1[T_OFFSET+T_WIDTH-1:T_OFFSET]),
                .z(tmp_mux1)
            );

            for (k = 0; k < l; k=k+1) begin : gen_merge_
                NOR2 merge_inst (.a(tmp_mux0[k]), .b(tmp_mux1[k]), .z(tmp_merged[k]));
            end

            CCHPC_DRtSR_XOR_COMP #(
                .NUM_INPUTS(l),
                .INVERT(0)
            ) comp_inst (
                .a(tmp_merged),
                .z(merged)
            );

            if ((FORWARD_R == 1) && (l < d-1)) begin : gen_forward_

                assign fwd_SR[l-1] = merged;
                assign z_SR[l] = 1'b0;

            end else begin : gen_default_

                assign fwd_SR[l-1] = 1'b0;

                // Compression randomness:
                if (RAND_COUNT > 0) begin : gen_rand_

                    assign z_SR[l] = merged ^ (^r_SR[RAND_OFFSET+RAND_COUNT-1:RAND_OFFSET]);

                end else begin : gen_no_rand_

                    assign z_SR[l] = merged;

                end

            end

        end

        if ((FORWARD_R == 1) || (security_order < 2)) begin : gen_unused_rand_

            wire unused_r_SR;

            assign unused_r_SR = ^r_SR;

        end

    endgenerate

endmodule

