module reg_SRtDR_generic #(
    parameter security_order = 1,
    parameter INV            = 1'b0,
    parameter OPT_PRCH       = 0       // potential area improvements by adding pre-charge of true rail data with negated pre-charge control signals
)(
    clk, prch, a, z
);
    parameter integer d = security_order+1;

    input         clk;
    input [d-2:0] prch;

    input  [  (d-1):0] a;       // share format: {..., a[2], a[1], a[0]}
    output [2*(d-1):0] z;       // share format: {..., a^1_f, a^1_t, a^0}


    //-----------------------------------------
    //-- layer0 (single-rail) -----------------
    //-----------------------------------------

    REG #(.WIDTH(1)) reg_layer0_inst (clk, a[0], z[0]);


    //-----------------------------------------
    //-- consecutive layers (dual-rail) -------
    //-----------------------------------------

    genvar i;
    generate
        for (i = 0; i < d-1; i=i+1) begin : gen_layer_

            if (OPT_PRCH == 1) begin : gen_opt_prch_

                wire       prch_n;
                wire [1:0] z_internal;

                INV inv_prch_inst (.a(prch[i]), .z(prch_n));

                REG_prch_SRtDR #(
                    .IN_WIDTH(1),
                    .CHUNK_IN_WIDTH(1)
                ) reg_inst (
                    .clk    (clk),
                    .prch   (prch[i]),
                    .prch_n (prch_n),
                    .a      (a[i+1]),
                    .z      (z_internal)
                );

                if (INV && i == d-2) begin : gen_inv_
                    assign z[2*i+2:2*i+1] = {z_internal[0], z_internal[1]};
                end else begin : gen_no_inv_
                    assign z[2*i+2:2*i+1] = z_internal;
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

                REG_prch_wNOR #(.WIDTH(2)) reg_inst (
                    .clk  (clk),
                    .prch (prch[i]),
                    .a    (dr),
                    .z    (z[2*i+2:2*i+1])
                );

            end

        end
    endgenerate

endmodule

