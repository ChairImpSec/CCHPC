module reg_SRtDR_generic_duality #(
    parameter security_order = 1,
    parameter INV            = 1'b0,
    parameter OPT_PRCH       = 0       // potential area improvements by adding pre-charge of true rail data with negated pre-charge control signals
)(
    clk, prch0, prch1, a, z_layer0, z_duality0, z_duality1
);
    parameter integer d = security_order+1;

    input         clk;
    input [d-2:0] prch0;
    input [d-2:0] prch1;

    input  [  (d-1):0] a;           // single-rail input shares
    output             z_layer0;    // share 0
    output [2*(d-1):1] z_duality0;  // dual-rail shares, duality instance 0
    output [2*(d-1):1] z_duality1;  // dual-rail shares, duality instance 1


    //-----------------------------------------
    //-- layer0 (single-rail) -----------------
    //-----------------------------------------

    REG #(.WIDTH(1)) reg_layer0_inst (clk, a[0], z_layer0);


    //-----------------------------------------
    //-- consecutive layers (dual-rail) -------
    //-----------------------------------------

    genvar i;
    generate
        for (i = 0; i < d-1; i=i+1) begin : gen_layer_

            if (OPT_PRCH == 1) begin : gen_opt_prch_

                wire       prch0_n;
                wire       prch1_n;
                wire [1:0] z_internal0;
                wire [1:0] z_internal1;

                INV inv_prch0_inst (.a(prch0[i]), .z(prch0_n));
                INV inv_prch1_inst (.a(prch1[i]), .z(prch1_n));

                REG_prch_SRtDR #(
                    .IN_WIDTH(1),
                    .CHUNK_IN_WIDTH(1)
                ) reg_inst0 (
                    .clk    (clk),
                    .prch   (prch0[i]),
                    .prch_n (prch0_n),
                    .a      (a[i+1]),
                    .z      (z_internal0)
                );

                REG_prch_SRtDR #(
                    .IN_WIDTH(1),
                    .CHUNK_IN_WIDTH(1)
                ) reg_inst1 (
                    .clk    (clk),
                    .prch   (prch1[i]),
                    .prch_n (prch1_n),
                    .a      (a[i+1]),
                    .z      (z_internal1)
                );

                if (INV && i == d-2) begin : gen_inv_
                    assign z_duality0[2*i+2:2*i+1] = {z_internal0[0], z_internal0[1]};
                    assign z_duality1[2*i+2:2*i+1] = {z_internal1[0], z_internal1[1]};
                end else begin : gen_no_inv_
                    assign z_duality0[2*i+2:2*i+1] = z_internal0;
                    assign z_duality1[2*i+2:2*i+1] = z_internal1;
                end

            end else begin : gen_default_prch_

                wire [1:0] dr;

                SRtDR_conversion #(
                    .WIDTH(1),
                    .CHUNK_WIDTH(1),
                    .SWAP_RAILS((INV && i == d-2) ? 0 : 1)
                ) SRtDR_inst (
                    .a(a[i+1]),
                    .z(dr)
                );

                REG_prch_wNOR #(.WIDTH(2)) reg_inst0 (
                    .clk  (clk),
                    .prch (prch0[i]),
                    .a    (dr),
                    .z    (z_duality0[2*i+2:2*i+1])
                );

                REG_prch_wNOR #(.WIDTH(2)) reg_inst1 (
                    .clk  (clk),
                    .prch (prch1[i]),
                    .a    (dr),
                    .z    (z_duality1[2*i+2:2*i+1])
                );

            end

        end
    endgenerate

endmodule

